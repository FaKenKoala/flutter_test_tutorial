import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_tutorial/domain/model/album.dart';
import 'package:flutter_test_tutorial/unit_test/fetch_album.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'fetch_album_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient client;
  setUpAll(() {
    client = MockClient();
  });

  group('fetchAlbum', () {
    test('returns an Album if the http call completes successfully', () async {
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((realInvocation) async =>
              http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));
      expect(await fetchAlbum(client), isA<Album>());
    });

    test('throws an exception if the http call completes with an error', () {
      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer(
              (realInvocation) async => http.Response('Not Found', 404));

      expect(fetchAlbum(client), throwsException);
    });
  });
}
