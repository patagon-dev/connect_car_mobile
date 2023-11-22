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

class LoadingIndecator extends StatefulWidget {
  const LoadingIndecator({
    Key? key,
    this.width,
    this.height,
    this.color,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? color;

  @override
  _LoadingIndecatorState createState() => _LoadingIndecatorState();
}

class _LoadingIndecatorState extends State<LoadingIndecator> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: CircularProgressIndicator(
          color: widget.color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
