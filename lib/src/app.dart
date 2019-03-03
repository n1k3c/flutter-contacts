import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/domain/contacts/get_contacts.dart';
import 'package:flutter_contacts/src/presentation/contacts/contact_screen.dart';
import 'package:flutter_contacts/src/util/constants.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: appTitle,
      home: ContactScreen(),
    );
  }
}