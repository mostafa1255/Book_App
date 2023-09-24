import 'package:bloc/bloc.dart';
import 'package:booklyapp/core/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meta/meta.dart';

import '../../../../data/models/User_Model.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  userModel? usermodel;

  // ignore: non_constant_identifier_names
  void GetMyData() async {
    try {
      final userDoc = await FirebaseFirestore.instance
          .collection("users")
          .doc(constants.userUid)
          .get();
      final userdata = userDoc.data()!;
      usermodel = userModel.fromJcon(data: userdata);
      debugPrint("User name: ${usermodel?.name}");
      emit(UpdateData());
      emit(GetmydataSucsess());
    } on FirebaseException catch (e) {
      emit(GetmydataFaliure(errmessage: e.message));
    }
  }

  List<userModel> users = [];
  void GetUserData() async {
    users.clear();
    emit(Loadinguserdata());
    try {
      final userDoc =
          await FirebaseFirestore.instance.collection('users').get();

      for (var item in userDoc.docs) {
        if (item.id != constants.userUid) {
          users.add(userModel.fromJcon(data: item.data()));
        }
      }
      emit(GetUserdataSucsess());
    } on FirebaseException catch (e) {
      emit(GetUserdataFaliure());
    }
  }

  List<userModel> usersFiltered = [];
  void searchAboutuser({required String query}) {
    usersFiltered = users
        .where(
            (user) => user.name!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();
    emit(FiltereduserSucsess());
  }

  bool searchEnabled = false;
  void changesearchstatus() {
    searchEnabled = !searchEnabled;
    if (searchEnabled == false) {
      usersFiltered.clear();
    }
    emit(ChangesearchStatusSucsess());
  }
}
