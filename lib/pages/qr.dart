import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';

class QrCodeScreen extends StatefulWidget {
  final String userId;

  QrCodeScreen({required this.userId});

  @override
  _QrCodeScreenState createState() => _QrCodeScreenState();
}

class _QrCodeScreenState extends State<QrCodeScreen> {
  String _qrCodeUrl = '';

  @override
  void initState() {
    super.initState();
    _generateQrCode();
  }
var litems = [];
  var name=[];
  var phone=[];
  void _generateQrCode() async {
    var url = Uri.parse('http://localhost:4000/generate_qr/:n_firstname');
    final response = await http.get(url);
     String body =response.body;
    List<dynamic> list1=json.decode(body);

    setState(() {
      _qrCodeUrl = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Screen'),
      ),
      body: Center(
        child: _qrCodeUrl.isNotEmpty
            ? QrImage(data:_qrCodeUrl)
            : CircularProgressIndicator(),
      ),
    );
  }
}