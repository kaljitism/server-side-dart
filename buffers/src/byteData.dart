import 'dart:typed_data';

/// ByteData is a fixed-length buffer in dart that allows random and unsigned
/// access to the sequence of fixed-width ints(uint8, int8, int16, int32,
/// int64) and floats(float32, float64)
///
/// ByteData is used to read/ write data in streams, coming from either file
/// system or network.
///
/// Its more efficient and performant than ordinary [List] implementation.
void byteData({required ByteBuffer testBuffer}) {
  // We can create a buffer in memory in Dart using following
  // constructors -
  // ByteData(bufferLength)
  // ByteData.view(byteBuffer, offsetInBytes, length)
  // ByteData.view(byteBuffer, start, end)
  var buffer = ByteData(5);
  var bufferView = ByteData.view(testBuffer, 0, 10);

  // ByteData objects could be traversed through iteration.

  // For assignment, byteData.set<DataType><bitSize>(offset, value) method
  for (int i = 0; i < buffer.lengthInBytes; i++) {
    buffer.setUint8(i, 12 * i);
  }

  // For access, byteData.get<DataType><bitSize>(offset, value) method
  for (int i = 0; i < buffer.lengthInBytes; i++) {
    print('buffer.getUint8($i): ${buffer.getUint8(i)}');
  }

  // One could set different data types within the same ByteData buffer.
  buffer.setFloat32(0, 24);
  buffer.setUint8(4, 12);

  // However, to access these elements, we have to remember the offsets of
  // different data types we have used for one entity.
  print('\nbuffer.getFloat32(0): ${buffer.getFloat32(0)}');
  print('buffer.getUint8(4): ${buffer.getUint8(4)}');
  print('bufferView.getFloat32(0): ${bufferView.getFloat32(0)}');
  print('bufferView.getFloat32(4): ${bufferView.getFloat32(4)}');

  /// Properties

  // type
  print('\nbuffer.runtimeType: ${buffer.runtimeType}');
  // buffer associated
  print('buffer.buffer: ${buffer.buffer}');
  // size of single element in bytes
  print('buffer.elementSizeInBytes ${buffer.elementSizeInBytes}');
  // size of ByteData in bytes
  print('buffer.lengthInBytes ${buffer.lengthInBytes}');
  // Offset of the view in bytes
  print('buffer.offsetInBytes ${buffer.offsetInBytes}');
}
