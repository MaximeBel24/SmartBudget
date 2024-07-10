part of 'auth_bloc.dart';

@immutable
sealed class AuthState {

  final Exception? exception;

  const AuthState({
    this.exception
  });
}

class InitState extends AuthState {
  const InitState();
}

class LoadingState extends AuthState {

  final String? text;

  const LoadingState({
    this.text
  });
}

class SignedInState extends AuthState {
  final User user;

  const SignedInState({
    super.exception,
    required this.user
  });
}

class JustSignedInState extends SignedInState {
  const JustSignedInState({
    super.exception,
    required super.user
  });
}

class UserNeedsVerificationState extends AuthState {
  final String email;

  const UserNeedsVerificationState({super.exception, required this.email});
}

class SignedOutState extends AuthState {
  const SignedOutState({super.exception});
}

class SigningUpState extends AuthState {
  const SigningUpState({super.exception});
}

class ForgotPasswordState extends AuthState {
  const ForgotPasswordState({
    super.exception,
    required this.hasSentEmail,
    this.email,
  });

  final bool hasSentEmail;
  final String? email;
}

class ChangeForgotPasswordState extends AuthState {
  const ChangeForgotPasswordState({
    super.exception,
    required this.hasChangePassword,
    this.user,
  });

  final bool hasChangePassword;
  final User? user;
}

class UserChangePasswordState extends SignedInState {
  const UserChangePasswordState({
    super.exception,
    required this.hasChangePassword,
    required super.user,
  });

  final bool hasChangePassword;
}

class SignUpState extends AuthState {
  const SignUpState({super.exception});
}

class VerifyOtpState extends AuthState {
  const VerifyOtpState({
    super.exception,
    required this.hasVerified,
    this.user,
  });

  final bool hasVerified;
  final User? user;
}

class ChangeEmailState extends AuthState {
  const ChangeEmailState({
    super.exception,
    required this.emailSent,
    this.newEmail,
  });

  final bool emailSent;
  final String? newEmail;
}

class ProviderSignupComplete extends AuthState {
  const ProviderSignupComplete({
    super.exception,
    required this.email,
    this.firstname,
    this.lastname,
  });

  final String email;
  final String? firstname;
  final String? lastname;
}
