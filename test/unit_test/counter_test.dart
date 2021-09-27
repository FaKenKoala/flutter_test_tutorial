import 'package:flutter_test_tutorial/unit_test/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Counter counter;
  setUpAll(() {
    counter = Counter();
  });

  group('test counter function: ', () {
    test('test counter add function', () {
      var result = counter.add(2, 2);
      expect(result, 4);
    });

    test('test counter sub function', () {
      var result = counter.sub(2, 2);
      expect(result, isNot(4));
    });
  });

  tearDownAll(() {
    counter.reset();
  });
}
