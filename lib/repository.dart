import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:http_tiga/person.dart';

class Repository {
  final uri = 'https://61b20d4dc8d4640017aaf15d.mockapi.io/person';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(uri));
      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<Person> person = it.map((e) => Person.fromJson(e)).toList();
        return person;
      } else {
        throw Exception('Failed to getData');
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future postData(String firstName, String lastName, String message) async {
    try {
      final response = await http.post(Uri.parse(uri), body: {
        'first_name': firstName,
        'last_name': lastName,
        'message': message
      });

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return e.toString();
    }
  }
}
