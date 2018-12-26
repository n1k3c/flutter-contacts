import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/domain/bloc/contacts_bloc.dart';

export 'contacts_bloc.dart';

class ContactsProvider extends InheritedWidget {
  final ContactsBloc bloc;

  ContactsProvider({Key key, Widget child})
      : bloc = ContactsBloc(),
        super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static ContactsBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ContactsProvider)
            as ContactsProvider)
        .bloc;
  }
}
