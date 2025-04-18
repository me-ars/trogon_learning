import 'dart:convert';
import 'package:http/http.dart' as http;

import '../errors/base_exception.dart';
import 'api_service.dart';

class ApiServiceImpl extends ApiService {
  final http.Client _client;

  ApiServiceImpl({required http.Client client}) : _client = client;

  @override
  Future<dynamic> getData({required String url}) async {
    try {
      final response = await _client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw ApiExceptions(message: 'Failed to load data: ${response.statusCode}',error:response.statusCode.toString() );
      }
    } catch (e) {
      throw ApiExceptions(message: 'error: $e',error: e.toString());
    }
  }
}
