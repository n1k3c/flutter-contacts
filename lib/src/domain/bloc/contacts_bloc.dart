import 'dart:async';

import 'package:flutter_contacts/src/data/remote/model/contact.dart';
import 'package:flutter_contacts/src/di/injection.dart';
import 'package:flutter_contacts/src/domain/bloc/bloc_base.dart';
import 'package:flutter_contacts/src/domain/contacts/get_contacts.dart';
import 'package:flutter_contacts/src/presentation/contacts/contact_state.dart';
import 'package:rxdart/rxdart.dart';

class ContactsBloc extends BlocBase {
  GetContacts getContacts;

  ContactStatePopulated contactPopulated = ContactStatePopulated([]);

  Stream<ContactState> get contactsList => _contactsSubject.stream;

  final _contactsSubject = BehaviorSubject<ContactState>();

  ContactsBloc({this.getContacts}) {
    if (getContacts == null) {
      getContacts = Injector().getContacts;
    }

    _contactsSubject.addStream(fetchContacts());
  }

  Stream<ContactState> fetchContacts() async* {
    yield ContactStateLoading();

    try {
      final List<Contact> contacts = await getContacts.fetchContacts();
      if (contacts.isEmpty) {
        yield ContactStateEmpty();
      } else {
        yield ContactStatePopulated(contacts);
      }
    } catch (error) {
      yield ContactStateError(error.toString());
    }
  }

  @override
  dispose() {
    _contactsSubject.close();
  }
}
