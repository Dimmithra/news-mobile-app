import 'package:http/http.dart' as http;
// import 'dart:developer' as dev;

class CommonHttp {
  // final String searchType;

  CommonHttp();

  Future<dynamic> get(String endpoint, String searchType) async {
    final response = await http.get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      // dev.log(response.body);
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
