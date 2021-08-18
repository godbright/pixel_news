import 'dart:convert';
import 'dart:convert' as convert;

import 'package:business_app/model/News.dart';
import 'package:business_app/services/String.dart/string.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class CrunchService {
  Future<News> crunches() async {
    var client = http.Client();
    var news = null;
    try {
      var url = Uri.parse(Strings.url);
      var response = await client.get(url);
      var jsonMap = json.decode(response.body);
      news = News.fromJson(jsonMap);
    } catch (e) {
      return news;
    }
    return news;
  }
}
