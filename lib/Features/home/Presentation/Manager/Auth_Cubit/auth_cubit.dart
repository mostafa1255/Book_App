import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../data/models/User_Model.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();

  void Register(
      {required String email,
      required String password,
      required String name}) async {
    emit(LoadingSate());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user?.uid != null) {
        debugPrint("User craeted sucsess${userCredential.user!.uid}");
        sendUserDatatoFirestore(
          name: name,
          email: email,
          userId: userCredential.user!.uid,
        );
        verifyEmail();
        constants.userUid = auth.currentUser!.uid;
        emit(AuthSignSucsess());
      }
    } on FirebaseException catch (e) {
      emit(AuthSignFaliure(errmessage: '${e.message}'));
    }
  }

  Future<void> verifyEmail() async {
    try {
      auth.currentUser!.sendEmailVerification();
    } catch (e) {
      print(e.toString());
    }
  }

  void Login({required String email, required String password}) async {
    emit(LoadingSate());
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user?.uid != null) {
        if (kDebugMode) {
          print("in Auth Cubit${userCredential.user!.uid}");
        }
        constants.userUid = auth.currentUser!.uid;
        emit(AuthLoginSucsess());
      } else {
        emit(AuthLoginFaliure(
            errmessage: 'There is an Error Please try again Later'));
      }
    } on FirebaseException catch (e) {
      emit(AuthLoginFaliure(errmessage: '${e.message}'));
    }
  }

  Future<void> signUpWithGoogle() async {
    emit(LoadingSate());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final User? currentuser =
          (await auth.signInWithCredential(credential)).user;

      await sendUserDatatoFirestore(
          name: googleUser.displayName,
          email: googleUser.email,
          userId: currentuser?.uid);
      constants.userUid = currentuser?.uid;
      emit(googleSignUpSucsess());

      await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      emit(googleSignUpFaliure(errmessage: e.toString()));
      return null;
    }
  }

// fix error in sign in
  Future<void> sendUserDatatoFirestore({
    required String? name,
    required String? email,
    required String? userId,
  }) async {
    userModel usermodel = userModel(email: email, id: userId, name: name);
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .set(usermodel.toJcon());
      emit(SucsessSavedatatofireStore());
    } on FirebaseException catch (e) {
      emit(FaliureSavedatatofireStore(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      googleSignIn.disconnect();
      await auth.signOut();
      constants.userUid = null;
      emit(SignOutSucsess());
    } on Exception catch (e) {
      emit(SignOutFaliure(e.toString()));
    }
  }

  ///
  Future<void> deleteAccount() async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(constants.userUid)
          .delete();
      googleSignIn.disconnect();
      await auth.currentUser?.delete();
      constants.userUid = null;
      emit(SucsessdeleteAccount());
    } on Exception catch (e) {
      emit(FaliuredeleteAccount(e.toString()));
    }
  }

  //
  Future<void> resetPassword({required String email}) async {
    try {
      if (email != "") {
        await auth.sendPasswordResetEmail(email: email.toString());
        print("Reset sucsess");
      }
    } on Exception catch (e) {
      print("Reset faliure${e.toString()}");
    }
  }
}
