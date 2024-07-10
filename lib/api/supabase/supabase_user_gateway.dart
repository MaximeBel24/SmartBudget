import 'package:smartbudget/core/gateway/user_gateway.dart';
import 'package:smartbudget/core/models/auth/user.dart' as app;
import 'package:smartbudget/core/utils/exceptions/http_exceptions.dart';
import 'package:smartbudget/core/utils/helpers/db_convention_helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/utils/helpers/logger_helper.dart';

class SupabaseUserGateway implements UserGateway {

  final SupabaseClient client;

  SupabaseUserGateway(this.client);

  @override
  Future<app.User> create({
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters
  }) async {
    try {
      final userFromSupabase = await client
          .from('user')
          .insert(data)
          .select(DBConventionHelper.userTableColumns);

          return app.User.fromJson(userFromSupabase.first);
    } on Exception catch (e) {
      logger.e('Error gateway while creating user : $e');
      throw GenericHttpException.unknowError(error: e);
    }
  }

  @override
  Future<void> delete({required String id}) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<app.User?> find({required String id, Map<String, dynamic>? queryParameters}) {
    // TODO: implement find
    throw UnimplementedError();
  }

  @override
  Future<List<app.User>> findAll({Map<String, dynamic>? queryParameters}) {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<app.User> update({required String id, required app.User entity, Map<String, dynamic>? queryParameters}) {
    // TODO: implement update
    throw UnimplementedError();
  }

}