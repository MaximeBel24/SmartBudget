import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:smartbudget/core/models/auth/user.dart' as app;

abstract class AuthProvider {

  Session? get session;

  app.User? get user;

  Future<app.User?> init();

  Future<app.User?> signUp({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    String? phoneNumber,
  });

  Future<app.User?> signIn({
    required String email,
    required String password
  });

  Future<app.User?> googleSignIn();

  Future<void> signOut();

  Future<void> sendEmailForPasswordReset({required String email});

  Future<app.User?> updateResetPassword({
    required String password,
  });

  Future<app.User?> updateUserPassword({
    required String actualPassword,
    required String newPassword
  });

  Future<app.User?> verifyOtp({
    required String email,
    required String pinCode,
    required OtpType type,
  });

  Future<app.User?> updateEmail(String email);

  Future<app.User> updateAccount({
    required String firstname,
    required String lastname,
    required String? phone,
  });
}