import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/app.dart';
import 'package:bloc/bloc.dart';

void main() {
  BlocSupervisor().delegate = SimpleBlocDelegate();

  runApp(App());
}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  onTransition(Transition transition) {
    print(transition);
  }
}