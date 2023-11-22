// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    Key? key,
    this.width,
    this.height,
    required this.onTap,
  }) : super(key: key);

  final double? width;
  final double? height;
  final VoidCallback onTap;

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((postCallBack) {
      email.text = '';
      password.text = '';
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _forgotPasswordFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText('Email'),
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: TextFormField(
                validator: (v) {
                  if (v!.isEmpty) {
                    showErrorEmail = true;
                    setState(() {});
                    return 'Email is required.';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(v)) {
                    showErrorEmail = true;
                    setState(() {});
                    return "Enter valid email";
                  }
                  showErrorEmail = false;
                  setState(() {});
                  return null;
                },
                onChanged: (value) {
                  FFAppState().resetEmail = value;
                },
                style: formTextStyle(),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  focusedBorder: border(),
                  border: border(),
                  enabledBorder: border(color: Color(0xFFCFD0D7)),
                  errorBorder: border(color: red),
                  errorStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontFamily: font400,
                  ),
                  contentPadding: const EdgeInsets.only(
                      left: 10, top: 10, bottom: 10, right: 10),
                  suffixIcon: Icon(
                    Icons.warning_amber_rounded,
                    color: showErrorEmail == true ? red : Colors.transparent,
                  ),
                ),
              ),
            ),
            Container(
              height: 45,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_forgotPasswordFormKey.currentState!.validate()) {
                    widget.onTap();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF131353),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: FFAppState().authLoader == true
                    ? Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Text('Enviar link de acceso'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget commonText(String name) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF5F6377),
          fontWeight: FontWeight.w400,
          fontFamily: font400,
        ),
      ),
    );
  }

  TextStyle formTextStyle() => TextStyle(
        fontSize: 16,
        fontFamily: font400,
        fontWeight: FontWeight.w400,
        color: Color(0xFF1A203D),
      );
  String font = 'Plus Jakarta Sans';
  String font400 = 'Plus Jakarta Sans Regular';
  bool showErrorEmail = false;

  final _forgotPasswordFormKey = GlobalKey<FormState>();

  Color red = Color(0xFFFF3654);

  OutlineInputBorder border({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: color ?? Color(0xFF3485FE),
          width: 0.7,
        ),
      );
}
