import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:http_tiga/person.dart';

class Repository {
  final apiUrl = 'https://61b0d4613c954f001722a69f.mockapi.io/example';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
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
}
