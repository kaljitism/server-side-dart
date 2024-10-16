import 'package:test/test.dart';

void main() {
  String mail = 'user@mail.com';

  test('If email is valid', () {
    expect(validateMailString(mail), equals(true));
  });
}

bool validateMailString(String mail) {
  if (mail.contains('@')) return true;
  return false;
}
