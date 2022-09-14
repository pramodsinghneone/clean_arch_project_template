import 'package:http/http.dart' as http;

const String baseUrl = 'https://reqres.in/api/users?page=2';

class NetworkService {
  var client = http.Client();
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);
    var headers = {
      'Authorisation': 'Bearer token',
      'api_key': 'apikey',
    };
    var response = await client.get(url, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // throw exception
    }
  }

  Future<dynamic> post(String api) async {}

  Future<dynamic> put(String api) async {}

  Future<dynamic> delete(String api) async {}
}
