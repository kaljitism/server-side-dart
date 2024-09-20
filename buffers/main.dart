import 'dart:typed_data';

import 'src/byteData.dart';
import 'src/byteList.dart';
import 'src/bytesBuilder.dart';
import 'src/endianness.dart';

void main() {
  print('/// ---------- ByteData ------------- ///');
  final testBuffer = ByteData(10);
  testBuffer.setFloat32(0, 124);
  testBuffer.setFloat32(4, 224);
  byteData(testBuffer: testBuffer.buffer);

  print('\n/// ---------- ByteLists ------------- ///');
  final byteLists = byteList(lengthInBytes: 20);
  print(byteLists);

  print('\n/// ---------- BytesBuilder ------------- ///');
  bytesBuilder();

  print('\n/// ---------- Endianness ------------- ///');
  endianness();
}
