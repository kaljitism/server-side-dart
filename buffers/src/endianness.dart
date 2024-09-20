import 'dart:typed_data';

void endianness() {
  /// When we are dealing directly with buffer ByteBuffer
  /// we have to keep the endianness in mind while dealing with bytes

  /// BE[BIG ENDIAN] => natural order of writing digits as humans and many
  /// places in your software do. Least Significant Digit is written last.
  /// One hundred five would be written as 105.

  /// LE[LITTLE ENDIAN] => order of digits/ ByteOrder used by processors and
  /// CPUs for faster computation.

  /// Both Apple Silicon and intel have Little Endian Architecture.

  /// a list of 4 bytes 00000000 00000001 00000010 00000011
  /// In a 32-bit chunkView/ bufferView in memory, we got -
  /// 00000011000000100000000100000000
  /// which is in LE format, in my system and probably yours too..
  ///
  /// Although Dart would still treat 00000011 as first, 00000010 as second
  /// and so on..
  Uint8List bytes = Uint8List.fromList([0, 1, 2, 3]);
  ByteBuffer byteBuffer = bytes.buffer;
  Uint32List thirtyTwoBitList = byteBuffer.asUint32List();

  /// Endianness of your machine
  Endian.host == Endian.little
      ? print('Endianness: Little Endian[LE]')
      : print('Endianness: Big Endian[BE]');

  /// toString() method call would result the interpreter to take
  /// 00000011000000100000000100000000 byteOrder/ endianness of the list as
  /// Big Endian. Thus, we see the entire decimalValue[50462976] of binary
  /// number 00000011000000100000000100000000 misinterpreted by DartVM as BE
  /// format.
  ///
  /// 50462976 => decimalValue of 00000011000000100000000100000000
  print('thirtyTwoBitList: $thirtyTwoBitList');

  Uint8List byteList = Uint8List.fromList([0, 1, 2, 3]);

  /// Sublist View is a **VIEW**, which could be used to __view__ buffers and
  /// work with endianness.
  ByteData byteData = ByteData.sublistView(byteList);

  /// 66051 => decimalValue of 00000000000000010000001000000011
  int bigEndianValue = byteData.getUint32(0, Endian.big);

  /// 50462976 => decimalValue of 00000011000000100000000100000000
  int littleEndianValue = byteData.getUint32(0, Endian.little);

  print('bigEndianValue: $bigEndianValue');
  print('littleEndianValue: $littleEndianValue');
}
