import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/util/constants.dart';

class TextWidget extends StatelessWidget {
  final bool visible;

  final String message;

  const TextWidget({this.visible, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: visible ? opacityVisible : opacityInvisible,
        duration: Duration(milliseconds: defaultAnimationDuration),
        child: Text(message),
      ),
    );
  }
}
