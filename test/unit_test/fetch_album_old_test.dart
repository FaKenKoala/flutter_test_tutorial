import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_tutorial/unit_test/fetch_album.dart';
import 'package:http/http.dart' as http;

void main() {
  late http.Client client;
  setUpAll(() {
    client = http.Client();
  });
  test('test fetch album test', () async {
    var result = await fetchAlbum(client);
    expect(result.id,1);
  });
}
