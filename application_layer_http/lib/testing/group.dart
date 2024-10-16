import 'package:test/test.dart';

class Cake {
  late int layers;
  late int slices;
  late String shape;
  late String type;

  int size(int layers, int slices) => layers * slices;

  void celebration(shape) {
    if (shape == 'round') {
      type = 'birthday';
    } else if (shape == 'square') {
      type = 'wedding';
    } else if (shape == 'rectangle') {
      type = 'party';
    } else {
      type = 'conference';
    }
  }
}

void main() {
  group('Cake Quality Check', () {
    Cake cake = Cake();

    test('Birthday Cake', () {
      cake.celebration('round');
      expect(cake.type, equals('birthday'));
    });
    test('Wedding Cake', () {
      cake.celebration('square');
      expect(cake.type, equals('wedding'));
    });
    test('Party Cake', () {
      cake.celebration('rectangle');
      expect(cake.type, equals('party'));
    });
    test('Conference Cake', () {
      cake.celebration('someCake');
      expect(cake.type, equals('conference'));
    });
  });
}
