import 'dart:convert';

import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    final Response response = await get(Uri.parse(url));

    if (response.statusCode == 200) {
      final String data = response.body;
      return jsonDecode(data);
    } else {}
  }
}
