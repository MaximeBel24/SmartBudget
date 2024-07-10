import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:smartbudget/core/models/auth/user.dart' as app;

abstract class AuthGateway {

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

  Future<app.User?> mobileGoogleSignIn();

  Future<app.User?> webGoogleSignIn();

  Future<void> sendPasswordReset({required String email});

  Future<app.User?> updateResetPassword({
    required String password,
  });

  Future<app.User?> updateUserPassword({
    required String actualPassword,
    required String newPassword,
  });

  Future<app.User?> verifyOtp({
    required String email,
    required String pinCode,
    required String type,
  });

  Future<app.User?> updateEmail(String email);
}