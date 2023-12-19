// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:signature/signature.dart';

class SignatureWidget extends StatefulWidget {
  const SignatureWidget({
    Key? key,
    this.width,
    this.height,
    required this.refresh,
  }) : super(key: key);

  final Function() refresh;
  final double? width;
  final double? height;

  @override
  _SignatureWidgetState createState() => _SignatureWidgetState();
}

class _SignatureWidgetState extends State<SignatureWidget> {
  late SignatureController _signatureController;

  Future<void> captureSignature() async {
    final Uint8List? signatureBytes = await _signatureController.toPngBytes();
    if (signatureBytes != null) {
      String base64Signature = base64Encode(signatureBytes);
      FFAppState().signBase64String = base64Signature;
    }
    setState(() {});
    widget.refresh();
  }

  @override
  void initState() {
    super.initState();

    _signatureController = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
      onDrawStart: () {
        widget.refresh();
      },
      onDrawEnd: () {
        captureSignature();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            splashRadius: 6.0,
            onPressed: () {
              FFAppState().signBase64String = "";
              _signatureController.clear();
              widget.refresh();
            },
            icon: Icon(Icons.restart_alt),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Color(0xFFCFD0D7)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Signature(
              height: 110,
              width: double.infinity,
              backgroundColor: Colors.white,
              controller: _signatureController,
            ),
          ),
        ),
      ],
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on top the right!
