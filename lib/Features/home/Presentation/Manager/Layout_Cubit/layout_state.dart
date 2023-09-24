part of 'layout_cubit.dart';

@immutable
abstract class LayoutState {}

class LayoutInitial extends LayoutState {}

class GetmydataSucsess extends LayoutState {}

class GetmydataFaliure extends LayoutState {
  final errmessage;

  GetmydataFaliure({required this.errmessage});
}

class UpdateData extends LayoutState {}

class GetUserdataSucsess extends LayoutState {}

class GetUserdataFaliure extends LayoutState {}

class Loadinguserdata extends LayoutState {}

class FiltereduserSucsess extends LayoutState {}

class ChangesearchStatusSucsess extends LayoutState {}

class sendMessagesucsess extends LayoutState {}

class sendMessageFaliure extends LayoutState {
  final errmessage;

  sendMessageFaliure({required this.errmessage});
}

class getMessagesucsess extends LayoutState {}

class getMessageFaliure extends LayoutState {
  final errmessage;

  getMessageFaliure({required this.errmessage, String? errMessage});
}
class getMessageLoading extends LayoutState {}