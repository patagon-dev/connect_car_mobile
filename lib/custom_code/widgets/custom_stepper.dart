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

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:flutter_svg/svg.dart';

import 'index.dart'; // Imports other custom widgets

import 'index.dart'; // Imports other custom widgets

import 'package:easy_stepper/easy_stepper.dart';

class CustomStepper extends StatefulWidget {
  const CustomStepper({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          EasyStepper(
              activeStep: FFAppState().stepperIndex,
              //for line decoration
              //for lower version
              // lineStyle: LineStyle(
              lineLength: 35,
              lineSpace: 0,
              // lineThickness: 3,
              lineType: LineType.normal,
              defaultLineColor: Colors.grey,
              finishedLineColor: FlutterFlowTheme.of(context).primary,
              // ),

              disableScroll: true,
              //for tapping or not
              enableStepTapping: FFAppState().stepperIndex != 5,
              steppingEnabled: FFAppState().stepperIndex != 5,
              //for steps decoration
              stepShape: StepShape.circle,
              unreachedStepBorderColor: Colors.grey,
              activeStepBackgroundColor: Colors.white,
              borderThickness: 5,
              stepRadius: 10,
              defaultStepBorderType: BorderType.normal,
              stepBorderRadius: 5,
              finishedStepBorderColor: const Color(0xff4F46E5),
              finishedStepBackgroundColor: const Color(0xff4F46E5),
              activeStepBorderColor: const Color(0xff4F46E5),
              showLoadingAnimation: false,
              steps: [
                EasyStep(
                  customStep: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: FFAppState().stepperIndex >= 0 ? 1 : 0.3,
                      child: FFAppState().stepperIndex > 0
                          ? customRightIcon()
                          : Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: FFAppState().stepperIndex >= 0
                                      ? const Color(0xff4F46E5)
                                      : Colors.grey,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                            ),
                    ),
                  ),
                  customTitle: Text(
                    'Datos',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: FFAppState().stepperIndex > 0
                          ? const Color(0xff4F46E5)
                          : FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                ),
                EasyStep(
                  customStep: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: FFAppState().stepperIndex >= 0 ? 1 : 0.3,
                      child: FFAppState().stepperIndex > 1
                          ? customRightIcon()
                          : Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: FFAppState().stepperIndex >= 1
                                      ? const Color(0xff4F46E5)
                                      : Colors.grey,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                            ),
                    ),
                  ),
                  customTitle: Text(
                    'Siniestro',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: FFAppState().stepperIndex > 1
                          ? const Color(0xff4F46E5)
                          : FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                ),
                EasyStep(
                  customStep: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: FFAppState().stepperIndex >= 0 ? 1 : 0.3,
                      child: FFAppState().stepperIndex > 2
                          ? customRightIcon()
                          : Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: FFAppState().stepperIndex >= 2
                                      ? const Color(0xff4F46E5)
                                      : Colors.grey,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                            ),
                    ),
                  ),
                  customTitle: Text(
                    'Terceros',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: FFAppState().stepperIndex > 2
                          ? const Color(0xff4F46E5)
                          : FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                ),
                EasyStep(
                  customStep: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: FFAppState().stepperIndex >= 0 ? 1 : 0.3,
                      child: FFAppState().stepperIndex > 3
                          ? customRightIcon()
                          : Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: FFAppState().stepperIndex >= 3
                                      ? const Color(0xff4F46E5)
                                      : Colors.grey,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                            ),
                    ),
                  ),
                  customTitle: Text(
                    'Aviso',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: FFAppState().stepperIndex > 3
                          ? const Color(0xff4F46E5)
                          : FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                ),
                EasyStep(
                  customStep: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Opacity(
                      opacity: FFAppState().stepperIndex >= 0 ? 1 : 0.3,
                      child: FFAppState().stepperIndex > 4
                          ? customRightIcon()
                          : Container(
                              height: 10,
                              width: 10,
                              decoration: BoxDecoration(
                                  color: FFAppState().stepperIndex >= 4
                                      ? const Color(0xff4F46E5)
                                      : Colors.grey,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(30))),
                            ),
                    ),
                  ),
                  customTitle: Text(
                    'Declaración',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: FFAppState().stepperIndex > 4
                          ? const Color(0xff4F46E5)
                          : FlutterFlowTheme.of(context).secondaryText,
                    ),
                  ),
                ),
              ],
              onStepReached: (index) {
                if (FFAppState().stepperIndex > index) {
                  FFAppState().update(() {
                    FFAppState().stepperIndex = index;
                  });
                }
              }),
        ],
      ),
    );
  }

  ClipRRect customRightIcon() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: SvgPicture.network(
        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/connect-car-v1-2i59cm/assets/vhmg53n89hom/right_white.svg',
        width: 20,
        height: 20,
        fit: BoxFit.cover,
      ),
    );
  }
}
