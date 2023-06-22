import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RemoteAuthService {
  var client = http.Client();

  Future addStudent({
    required String name,
    required String age,
    required String url,
    required bool active,
  }) async {
    final body = {
      "data": {"name": name, "age": age, "avatar": url, "active": active}
    };
    var response = await client.post(
      Uri.parse('http://localhost:1337/api/students'),
      body: jsonEncode(body),
      headers: {
        "Content-Type": "application/json",
      },
    );
    print(response);
    return response;
  }
}
