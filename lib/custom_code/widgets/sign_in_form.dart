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

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
    this.width,
    this.height,
    required this.onTap,
    required this.navigate,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Function() onTap;
  final Function() navigate;

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _signInFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonText('Email'),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: TextFormField(
                validator: (v) {
                  if (v!.isEmpty) {
                    showErrorEmail = true;
                    setState(() {});
                    return 'El Email es requerido';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(v)) {
                    showErrorEmail = true;
                    setState(() {});
                    return "Email inválido";
                  }
                  showErrorEmail = false;
                  setState(() {});
                  return null;
                },
                onChanged: (value) {
                  FFAppState().signInEmail = value;
                },
                style: formTextStyle(),
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  isDense: true,
                  focusedBorder: border(),
                  border: border(),
                  enabledBorder: border(color: Color(0xFFCFD0D7)),
                  errorBorder: border(color: red),
                  errorStyle: TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontFamily:
                        FlutterFlowTheme.of(context).bodyMedium.fontFamily,
                  ),
                  contentPadding: const EdgeInsets.all(10),
                  suffixIcon: Icon(
                    Icons.warning_rounded,
                    color: showErrorEmail ? red : Colors.transparent,
                  ),
                ),
              ),
            ),
            commonText('Contraseña'),
            TextFormField(
              validator: (v) {
                if (v!.isEmpty) {
                  showErrorPassword = true;
                  setState(() {});
                  return "La Contraseña es requerida";
                } else if (v.toString().length < 6) {
                  showErrorPassword = true;
                  setState(() {});
                  return 'Password inválido';
                }
                showErrorPassword = false;
                setState(() {});
                return null;
              },
              onChanged: (value) {
                FFAppState().signInPassword = value;
              },
              style: formTextStyle(),
              obscureText: !visiblePassword,
              obscuringCharacter: '*',
              cursorColor: Colors.black,
              decoration: InputDecoration(
                focusedBorder: border(),
                isDense: true,
                border: border(),
                enabledBorder: border(color: Color(0xFFCFD0D7)),
                errorBorder: border(color: red),
                errorStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                ),
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: SizedBox(
                  width: 100,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onTap: () {
                            visiblePassword = !visiblePassword;
                            setState(() {});
                          },
                          child: Image.network(
                            !visiblePassword
                                ? 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/connect-car-v1-2i59cm/assets/myhdx9umz24z/visiblity.png'
                                : 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/connect-car-v1-2i59cm/assets/8udop47kdakz/visiblity_off.png',
                            height: 25,
                            width: 25,
                            color: Color(0xFF3330E8),
                          ),
                        ),
                      ),
                      if (showErrorPassword)
                        Icon(Icons.warning_rounded, color: red),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    widget.navigate();
                  },
                  child: Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF3330E8),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 45,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  if (_signInFormKey.currentState!.validate()) {
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
                    : Text(
                        'Ingresar',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                        ),
                      ),
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
          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
        ),
      ),
    );
  }

  TextStyle formTextStyle() => TextStyle(
        fontSize: 16,
        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
        fontWeight: FontWeight.normal,
        color: Color(0xFF1A203D),
      );

  bool showErrorEmail = false;
  bool showErrorPassword = false;
  bool visiblePassword = false;
  final _signInFormKey = GlobalKey<FormState>();

  Color red = Color(0xFFFF3654);

  OutlineInputBorder border({Color? color}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: color ?? Color(0xFF3485FE),
          width: 0.7,
        ),
      );
}
