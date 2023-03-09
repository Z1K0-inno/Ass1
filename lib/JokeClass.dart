import 'dart:convert';

import 'package:http/http.dart' as http;

Future<JokeClass> getJoke() async {
  var response =
      await http.get(Uri.https('api.chucknorris.io', '/jokes/random'));
  if (response.statusCode != 200) throw Exception("SOMETHING WENT WRONG");
  return JokeClass.fromJson(jsonDecode(response.body));
}

class JokeClass {
  var iconUrl = "";
  var id = "";
  var url = "";
  var value = "";

  JokeClass(
      {required this.iconUrl,
      required this.id,
      required this.url,
      required this.value});

  factory JokeClass.fromJson(Map<String, dynamic> json) => JokeClass(
        iconUrl: json['icon_url'] as String,
        id: json['id'] as String,
        url: json['url'] as String,
        value: json['value'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'icon_url': iconUrl,
        'id': id,
        'url': url,
        'value': value,
      };
}
