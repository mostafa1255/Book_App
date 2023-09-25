import 'package:bloc/bloc.dart';
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
        final sharedPref = await SharedPreferences.getInstance();
        await sharedPref.setString('userId', userCredential.user!.uid);
        emit(AuthLoginSucsess());
      } else {
        print("in Auth Cubit  UID is Null");
      }
    } on FirebaseException catch (e) {
      emit(AuthLoginFaliure(errmessage: '${e.message}'));
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    emit(LoadingSate());
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      emit(googleSignSucsess());
      await sendUserDatatoFirestore(
        name: googleUser?.displayName,
        email: googleUser?.email,
        userId: auth.currentUser?.uid,
      );
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      emit(googleSignFaliure(errmessage: e.toString()));
      return null;
    }
  }

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
      await auth.signOut();
      emit(SignOutSucsess());
    } on Exception catch (e) {
      emit(SignOutFaliure(e.toString()));
    }
  }

  ///
  Future<void> deleteAccount() async {
    try {
      await auth.currentUser?.delete();
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
