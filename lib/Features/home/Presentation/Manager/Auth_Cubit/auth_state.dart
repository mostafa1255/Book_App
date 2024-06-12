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

class googleSignUpSucsess extends AuthState {}

class googleSignUpFaliure extends AuthState {
  final String errmessage;

  googleSignUpFaliure({required this.errmessage});
}

///
class SucsessSavedatatofireStore extends AuthState {}

class FaliureSavedatatofireStore extends AuthState {
  final String errmessage;

  FaliureSavedatatofireStore(this.errmessage);
}

class SucsessdeleteAccount extends AuthState {}

class FaliuredeleteAccount extends AuthState {
  final String errmessage;

  FaliuredeleteAccount(this.errmessage);
}

class SignOutSucsess extends AuthState {}

class SignOutFaliure extends AuthState {
  final String errmessage;

  SignOutFaliure(this.errmessage);
}
