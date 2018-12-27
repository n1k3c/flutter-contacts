import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/util/constants.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final bool visible;

  const LoadingIndicatorWidget({this.visible});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: visible ? opacityVisible : opacityInvisible,
        duration: Duration(milliseconds: defaultAnimationDuration),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
