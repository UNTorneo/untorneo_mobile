import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'package:untorneo_mobile/core/constants/api_constants.dart';
import 'package:untorneo_mobile/core/logger/logger.dart';

final graphQLProvider = Provider<GraphQLHandler>(GraphQLHandler.fromRef);

final class GraphQLHandler {
  GraphQLHandler(this.ref);

  factory GraphQLHandler.fromRef(Ref ref) {
    return GraphQLHandler(ref);
  }

  late GraphQLClient client;
  final _httpLink = HttpLink(ApiConstants.baseUrl);
  final Ref ref;

  Future<void> connect() async {
    client = GraphQLClient(
      cache: GraphQLCache(),
      link: _httpLink,
    );
  }

  Future<Map<String, dynamic>> mutate(
    MutationOptions options,
    String operation,
  ) async {
    try {
      Logger.log('GraphQL Mutation: ${options.document}');
      final result = await client.mutate(options);
      Logger.log('GraphQL Mutation Result: ${result.data}');
      if (result.hasException) {
        throw result.exception!;
      }
      if (result.data == null || result.data!.isEmpty) {
        throw 'No data';
      }
      final data = result.data![operation];
      if (data?[operation]?['error'] != null) {
        throw data!['error'];
      }
      return data;
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

  Future<Map<String, dynamic>> query(
    QueryOptions options,
    String operation,
  ) async {
    try {
      Logger.log('GraphQL Query: ${options.document}');
      final result = await client.query(options);
      Logger.log('GraphQL Query Result: ${result.data}');
      if (result.hasException) {
        throw result.exception!;
      }
      if (result.data == null || result.data!.isEmpty) {
        throw 'No data';
      }
      final data = result.data![operation];
      if (data?[operation]?['error'] != null) {
        throw data!['error'];
      }
      return data;
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

  Future<List> queryList(
    QueryOptions options,
    String operation,
  ) async {
    try {
      Logger.log('GraphQL Query: ${options.document}');
      final result = await client.query(options);
      Logger.log('GraphQL Query Result: ${result.data}');
      if (result.hasException) {
        throw result.exception!;
      }
      if (result.data == null || result.data!.isEmpty) {
        throw 'No data';
      }
      final data = result.data![operation];
      if (data is List) return data;
      if (data?[operation]?['error'] != null) {
        throw data!['error'];
      }
      return data;
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
}
