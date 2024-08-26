import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';
import 'package:getxtutorial/Domain/Domain.dart';

class Services {
  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse("${Domain.domain}/users"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body) as List;
        return User.fromJsonList(jsonData);
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}
