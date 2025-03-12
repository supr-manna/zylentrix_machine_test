import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/post_response.dart';

class APIClient extends GetxService {
  List<PostResponse> posts = [];

  Future<List<PostResponse>> request(String uri, String method,  Map<String, dynamic>? params) async {
    Uri url = Uri.parse(uri);
    http.Response response;

    try {
      Map<String, String> headers = {
        "Accept": " */*",
        "Content-Type": "application/json",
        "XApiKey" : "1"
      };

      print("URL: $url \n Body: $params \n Headers: $headers");
      if  (method == 'get') {
        response = await http.get(url, headers: headers);
      } else {
        return posts;
      }

      posts = PostResponse.fromJsonList(response.body);
      print('Response: ${response.body}');

      if (response.statusCode == 200) {
        return posts;
      } else if (response.statusCode == 503) {
        return posts;
      } else {
        return posts;
      }
    } on SocketException {
      return posts;
    } on FormatException catch (e) {
      print("FormatException: ${e.toString()}");
      return posts;
    } catch (ex) {
      print("General Exception: ${ex.toString()}");
      return posts;
    }
  }
}