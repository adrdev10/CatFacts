

import 'dart:convert';
import 'dart:io';

import 'CatFacts.dart';

class CatFactsClient {
  final baseUrl = "https://cat-fact.herokuapp.com/";

  final HttpClient httpClient = new HttpClient();

  Future<CatFacts> requestCatFacts(String endpoint) async {
    final url = baseUrl + endpoint;
    final request = await httpClient.getUrl(Uri.parse(url));
    final response = await request.close();

    if (response.statusCode == HttpStatus.ok) {
      String data = await response.transform(utf8.decoder).join();
      Map<String, dynamic> json = JsonCodec().decode(data);
      return CatFacts.fromJson(json);
    }else {
      throw new Exception("Failed to fetch");
    }
  }
}