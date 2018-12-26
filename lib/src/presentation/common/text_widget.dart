import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final bool visible;

  final String message;

  const TextWidget({this.visible, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        child: Text(message),
      ),
    );
  }
}
