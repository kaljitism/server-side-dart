import 'dart:typed_data';

/// Builds a list of bytes, allowing bytes and list of bytes to be added at
/// the end. Used to efficiently collect bytes and lists of bytes.
void bytesBuilder() {
  /// If [copy] is true(default value):
  /// Builder will maintain its own internal buffer and copies the data we
  /// add to the Builder to its internal buffer.
  /// Use Copying Builder when you need Data Isolation and Growable-length
  /// sequence.
  final bytesBuilder = BytesBuilder(copy: true);

  /// If [copy] is false:
  /// Builder will not create an internal buffer and thus the buffer
  /// available will be a fixed size buffer.

  /// Methods

  // addByte, when each will be truncated to an 8-bit value in the range 0 ..
  // 255.
  bytesBuilder.addByte(7);

  // add, used to add a list of bytes at the end of buffer
  bytesBuilder.add([0, 5, 25]);

  // toBytes, returns a copy of Uint8List without modifying the builder
  // contents.
  print('BytesBuilder\'s Buffer : ${bytesBuilder.toBytes()}');

  //takeBytes, clears the internal buffer and returns contents as Uint8List
  final list = bytesBuilder.takeBytes();
  print('BytesBuilder\'s Buffer '
      'after takeBytes() method: ${bytesBuilder.toBytes()}');
  bytesBuilder.add(list);

  // Clears the buffer
  bytesBuilder.clear();
  print('BytesBuilder\'s Buffer '
      'after clear() method: ${bytesBuilder.toBytes()}');
}
