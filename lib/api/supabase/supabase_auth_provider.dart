import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smartbudget/core/providers/auth_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;
import 'package:smartbudget/core/models/auth/user.dart' as app;

import '../../core/gateway/auth_gateway.dart';
import '../../core/gateway/user_gateway.dart';

class SupabaseAuthProvider extends AuthProvider {

  final AuthGateway authGateway;
  final UserGateway userGateway;
  final FlutterSecureStorage secureStorage;
  final supabase.SupabaseClient client;

  SupabaseAuthProvider(
      this.client, {
        required this.authGateway,
        required this.userGateway,
        required this.secureStorage,
  }) : _session = null;

  final String sessionStorageKey = 'session';

  late supabase.Session? _session;
  late app.User? _user;

  @override
  Future<app.User?> init() async {
    _session = client.auth.currentSession;
    if (_session != null) {
      final app.User? user = await userGateway.find(id: _session!.user.id);
      _user = user;

    }
  }

  @override
  Future<app.User?> signUp({
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    String? phoneNumber
  }) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<app.User?> googleSignIn() {
    // TODO: implement googleSignIn
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmailForPasswordReset({required String email}) {
    // TODO: implement sendEmailForPasswordReset
    throw UnimplementedError();
  }

  @override
  // TODO: implement session
  supabase.Session? get session => throw UnimplementedError();

  @override
  Future<app.User?> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<app.User> updateAccount({required String firstname, required String lastname, required String? phone}) {
    // TODO: implement updateAccount
    throw UnimplementedError();
  }

  @override
  Future<app.User?> updateEmail(String email) {
    // TODO: implement updateEmail
    throw UnimplementedError();
  }

  @override
  Future<app.User?> updateResetPassword({required String password}) {
    // TODO: implement updateResetPassword
    throw UnimplementedError();
  }

  @override
  Future<app.User?> updateUserPassword({required String actualPassword, required String newPassword}) {
    // TODO: implement updateUserPassword
    throw UnimplementedError();
  }

  @override
  // TODO: implement user
  app.User? get user => throw UnimplementedError();

  @override
  Future<app.User?> verifyOtp({required String email, required String pinCode, required supabase.OtpType type}) {
    // TODO: implement verifyOtp
    throw UnimplementedError();
  }
}