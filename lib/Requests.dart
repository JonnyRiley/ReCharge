import 'dart:io';
import 'dart:async';
import 'dart:convert';

main() async {
  Uri apiUrl = Uri.parse("https://obscure-savannah-61382.herokuapp.com/users");

  HttpClientRequest request = await new HttpClient().getUrl(apiUrl);
  HttpClientResponse response = await request.close();

  Stream resStream = response.transform(utf8.decoder);

  await for (var data in resStream) {
    print(data);
  }
}
