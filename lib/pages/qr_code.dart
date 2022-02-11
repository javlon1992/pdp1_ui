import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatefulWidget {
  static String id="qr_code";
  const QRCode({Key? key}) : super(key: key);

  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Code"),
        centerTitle: true,
      ),
      body: Center(
        child: QrImage(
          data: "http://onelink.to/nfq396",
          version: QrVersions.auto,
          size: 250.0,
        ),
      ),
    );
  }
}
