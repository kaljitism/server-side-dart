## Converting between Data Representations.

`dart:convert` exposes APIs for built-in encoders & decoders that facilitate
conversion between several data representations defined in 
`dart:typed_data`, json, utf-8, etc and support for implementing custom encoders.

Library also exposes top-level instances json and utf8, of type JsonCodec and
Utf8Codec respectively.

In Dart, `Codec<S, T>` is a base abstract class that provides -

1. Encoder that encodes `s` of `S` Type into `t` of `T` Type, through

```dart
Codec.encode(s) => t
```

2. Decoder that decodes `t` of `T` Type into `s` of `S` Type, through 

```dart
Codec.decode(t) => s
```

3. 

### JSON

According
to [Dart API Reference](api.dart.dev/dart-convert/dart-convert-library.html),
JSON is a simple text format for
representing structured objects and collections.

`JsonCodec` converter has an **Encoder** Json Objects(Map, Dart Data Structures/
Objects except String), Json String or
string.   
