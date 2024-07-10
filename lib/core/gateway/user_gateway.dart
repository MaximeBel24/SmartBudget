import 'package:smartbudget/core/gateway/interfaces/i_model_gateway.dart';

import '../models/auth/user.dart';

abstract class UserGateway implements IModelGateway<User>{

  const UserGateway();

  @override
  Future<User> create({
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters
  });

  @override
  Future<User?> find({
    required String id,
    Map<String, dynamic>? queryParameters,
  });

  @override
  Future<List<User>> findAll({
    Map<String, dynamic>? queryParameters,
  });

  @override
  Future<User> update({
    required String id,
    required User entity,
    Map<String, dynamic>? queryParameters,
  });

  @override
  Future<void> delete({required String id});

}