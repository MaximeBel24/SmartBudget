import 'package:smartbudget/api/credentials.dart';
import 'package:smartbudget/core/gateway/auth_gateway.dart';
import 'package:smartbudget/core/gateway/user_gateway.dart';
import 'package:smartbudget/core/models/auth/user.dart' as app;
import 'package:smartbudget/core/utils/exceptions/auth_exceptions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/helpers/logger_helper.dart';

class SupabaseAuthGateway implements AuthGateway {

  final SupabaseClient client;
  final UserGateway userGateway;

  SupabaseAuthGateway(
        this.client, {
        required this.userGateway
  });

  @override
  Future<app.User?> signUp({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    String? phoneNumber
  }) async {
    try {
      final AuthResponse res = await client.auth.signUp(
          password: password,
        email: email,
        emailRedirectTo: Credentials.mailRedirectUrl,
      );

      final User, user = res.user;
      return userGateway.create(
          data: {
            'id' : user?.id,
            'firstname' : firstname,
            'lastname' : lastname,
            'email' : email,
            'phoneNumber' : phoneNumber,
          }
      );
    } on AuthException catch (e) {
      logger.e('Error while signing in AuthException: $e');
      if (e.message == 'User already registered') {
        throw EmailAlreadyExistsAuthException();
      }
      if (e.message == 'Password should be at least 6 characters.') {
        throw WeakPasswordAuthException();
      }
      rethrow;
    } catch (e) {
      logger.e('Error while signing up : $e');
      rethrow;
    }
  }

  @override
  Future<app.User?> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<app.User?> mobileGoogleSignIn() {
    // TODO: implement mobileGoogleSignIn
    throw UnimplementedError();
  }

  @override
  Future<app.User?> webGoogleSignIn() {
    // TODO: implement webGoogleSignIn
    throw UnimplementedError();
  }

  @override
  Future<void> sendPasswordReset({required String email}) {
    // TODO: implement sendPasswordReset
    throw UnimplementedError();
  }

  @override
  Future<app.User?> verifyOtp({required String email, required String pinCode, required String type}) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }

  @override
  Future<app.User?> updateEmail(String email) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<app.User?> updateUserPassword({required String actualPassword, required String newPassword}) {
    // TODO: implement updateUserPassword
    throw UnimplementedError();
  }

  @override
  Future<app.User?> updateResetPassword({required String password}) {
    // TODO: implement updateResetPassword
    throw UnimplementedError();
  }

}