import 'package:flutter/material.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  final bool visible;

  const LoadingIndicatorWidget({this.visible});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: visible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 500),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
