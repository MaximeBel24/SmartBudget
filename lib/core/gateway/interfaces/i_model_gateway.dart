abstract class IModelGateway<T> {

  Future<T> create({
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
  });

  Future<T?> find({
    required String id,
    Map<String, dynamic>? queryParameters,
  });

  Future<List<T>?> findAll({
    Map<String, dynamic>? queryParameters,
  });

  Future<T> update({
    required String id,
    required T entity,
    Map<String, dynamic>? queryParameters,
  });

  Future<void> delete({required String id});
}