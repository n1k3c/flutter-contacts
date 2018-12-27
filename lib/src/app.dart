import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/domain/bloc/bloc_provider.dart';
import 'package:flutter_contacts/src/domain/bloc/contacts_bloc.dart';
import 'package:flutter_contacts/src/presentation/feature/contacts/contact_screen.dart';
import 'package:flutter_contacts/src/util/constants.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: appTitle,
      home: BlocProvider<ContactsBloc>(
        bloc: ContactsBloc(),
        child: ContactScreen(),
      ),
    );
  }
}
