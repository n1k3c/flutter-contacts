import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/domain/bloc/contacts_provider.dart';
import 'package:flutter_contacts/src/presentation/feature/contacts/contact_screen.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return MaterialApp(
      title: 'News!',
      onGenerateRoute: routes,
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (context) {
          return ContactsProvider(
            child: ContactScreen(),
          );
        },
      );
    }
  }
}
