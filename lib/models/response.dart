import 'dart:convert';

String responseFromJson(String str) => json.decode(str);

String responseToJson(String data) => json.encode(data);
