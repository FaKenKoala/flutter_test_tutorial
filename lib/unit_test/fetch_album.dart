import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test_tutorial/domain/model/album.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum(http.Client client) async {
  try {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Faild to load album');
    }
  } catch (e) {
    print('错误: $e');
    throw e;
  }
}
