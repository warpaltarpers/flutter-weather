import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future<void> getData() async {
    http.Response response = await http.get(url);
    
    if(response.statusCode == 200) {
      String data = response.body;
      print('Data set');
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}