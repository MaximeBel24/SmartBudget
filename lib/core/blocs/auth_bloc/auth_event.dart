part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {
  const AuthEvent();
}

class InitEvent extends AuthEvent{
  const InitEvent();
}

class SignedInEvent extends AuthEvent {
  final String email;
  final String password;

  const SignedInEvent(this.email, this.password);
}

class UserSignedInEvent extends AuthEvent {
  final User user;

  const UserSignedInEvent(this.user);
}

class SignedInByOTPEvent extends AuthEvent {
  final User user;

  const SignedInByOTPEvent({required this.user});
}

class GoogleSignIdEvent extends AuthEvent {
  const GoogleSignIdEvent();
}

class LogOutEvent extends AuthEvent {
  const LogOutEvent();
}

class ForgotPasswordEvent extends AuthEvent {
  final String? email;

  const ForgotPasswordEvent(this.email);
}

class ChangeForgotPasswordEvent extends AuthEvent {
  final String? password;

  const ChangeForgotPasswordEvent(this.password);
}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String firstname;
  final String lastname;
  final String? phoneNumber;

  const SignUpEvent({
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
    this.phoneNumber
  });
}

class VerifyOTPEvent extends AuthEvent {
  final String pinCode;
  final String email;
  final supabase.OtpType type;
  final bool wInit;

  const VerifyOTPEvent({
    required this.pinCode,
    required this.email,
    required this.type,
    this.wInit = false
  });
}

class UpdateUserPasswordEvent extends AuthEvent {
  final String actualPassword;
  final String newPassword;
  final User user;

  const UpdateUserPasswordEvent({
    required this.actualPassword,
    required this.newPassword,
    required this.user
  });
}

class ChangeEmailEvent extends AuthEvent {
  final String email;

  const ChangeEmailEvent(this.email);
}

class UpdateAuthenticatedUser extends AuthEvent {
  final User user;

  const UpdateAuthenticatedUser({required this.user});
}