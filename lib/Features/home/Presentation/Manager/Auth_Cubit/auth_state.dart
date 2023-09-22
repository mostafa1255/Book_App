part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSignSucsess extends AuthState {}

class AuthSignFaliure extends AuthState {
  final String errmessage;

  AuthSignFaliure({required this.errmessage});
}

////////////////////

class AuthLoginSucsess extends AuthState {}

class AuthLoginFaliure extends AuthState {
  final String errmessage;

  AuthLoginFaliure({required this.errmessage});
}

//
class LoadingSate extends AuthState {}
//

class googleSignSucsess extends AuthState {}

class googleSignFaliure extends AuthState {
  final String errmessage;

  googleSignFaliure({required this.errmessage});
}

///