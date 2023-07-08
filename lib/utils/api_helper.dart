import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class Api {
  static Future<Map<String, dynamic>> postData(
    {String? username,
    String? password,
    bool encode = false,
    required String urlHttp}) async {
    late Map<String, dynamic> responseData;
    late Map<String, dynamic> kosong = {};
    Map<String, dynamic> dataMap = {};
    if (username != null) {
      dataMap['username'] = username;
    }
    if (password != null) {
      dataMap['password'] = password;
    }
    debugPrint("dataMap encode");

    debugPrint(jsonEncode(dataMap));
    debugPrint("urlHttp");
    debugPrint(urlHttp);
    final url = Uri.parse(urlHttp);
    await http
    .post(url, body: (encode) ? json.encode(dataMap) : dataMap)
    .timeout(const Duration(seconds: 40),
    onTimeout: () {
      debugPrint("Waktu Habis");
      return http.Response('Error', 500);
    },
    ).then((response) {
      try {
        log('body');
        log(response.body.toString());
        log(response.statusCode.toString());
        responseData = json.decode(response.body);
        debugPrint(responseData.toString());
        debugPrint("aman");
      } catch (error) {
        debugPrint("error ${response.statusCode}");
      }
    });
    try {
      return responseData;
    } catch (error) {
      debugPrint("error Get Data $urlHttp = $error");
      return kosong;
    }
  }

  static Future<Uint8List> getByteArrayFromUrl(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
    return response.bodyBytes;
  }
}