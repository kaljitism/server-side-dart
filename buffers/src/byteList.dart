import 'dart:typed_data';

/// Following are a fixed-length list of integers and floats
/// but unlike ByteData, they can only hold a single datatype
/// They are more space and time efficient than default [List]
(
  Uint8List uint8List,
  Uint8ClampedList uint8ClampedList,
  Uint16List uint16List,
  Uint32List uint32List,
  Uint64List uint64List,
  Int8List int8List,
  Int32List int32List,
  Int32x4List int32x4List,
  Int64List int64List,
  Float32List float32List,
  Float32x4List float32x4List,
  Float64List float64List,
  Float64x2List float64x2List,
) byteList({required int lengthInBytes}) {
  final uint8List = Uint8List(lengthInBytes);
  final uint16List = Uint16List(lengthInBytes);
  final uint32List = Uint32List(lengthInBytes);
  final uint64List = Uint64List(lengthInBytes);

  final int8List = Int8List(lengthInBytes);
  final int32List = Int32List(lengthInBytes);
  final int64List = Int64List(lengthInBytes);

  /// [Int32x4] Stores 4 32-bit bit-masks in lanes.
  /// These lanes are "x", "y", "z", and "w" respectively.
  /// [Int32x4List] is a fixed length list of [Int32x4].
  final int32x4List = Int32x4List(lengthInBytes);

  final float32List = Float32List(lengthInBytes);
  final float64List = Float64List(lengthInBytes);

  /// [Float32x4] Stores 4 32-bit floating points in lanes.
  /// These lanes are "x", "y", "z", and "w" respectively.
  /// [Float32x4List] is a fixed length list of [Float32x4].
  final float32x4List = Float32x4List(lengthInBytes);

  /// [Float64x2] Stores 2 64-bit floating points in lanes.
  /// These lanes are "x" and "y" respectively.
  /// [Float64x2List] is a fixed length list of [Float64x2].
  final float64x2List = Float64x2List(lengthInBytes);

  // Integers used inside this list are clamped to an unsigned 8 bit value
  final uint8ClampedList = Uint8ClampedList(lengthInBytes);

  // byteList.add; (ERROR): Unsupported operation: Cannot add to a fixed-length list

  return (
    uint8List,
    uint8ClampedList,
    uint16List,
    uint32List,
    uint64List,
    int8List,
    int32List,
    int32x4List,
    int64List,
    float32List,
    float32x4List,
    float64List,
    float64x2List,
  );
}
