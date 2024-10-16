import 'dart:io';

String hexRequest =
    '504f5354202f6372656174652d706f737420485454502f312e310d0a436f6e74656e742d'
    '547970653a206170706c69636174696f6e2f6a736f6e0d0a5472616e736665722d456e636f'
    '64696e673a206368756e6b65640d0a6e616d653a20617574686f72697a656455736572'
    '0d0a486f73743a206c6f63616c686f73743a383035310d0a436f6e6e656374696f6e3a206b6565702d616c6976650d0a0d0a7b227469746c65223a2244617274222c22626f6479223a2244617274206d616b6573206d7920686561727420466c7574746572227d';

void main() async {
  var socket = await Socket.connect(
    'localhost',
    8051,
  );

  socket
    ..write(hexRequest)
    ..flush();

  socket.listen(
    (event) {
      var response = String.fromCharCodes(event);
      print('[RESPONSE]: $response');
    },
    onDone: () {
      socket.close();
    },
    onError: (error) {
      print('[ERROR]: $error');
    },
  );
}
