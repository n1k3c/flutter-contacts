import 'dart:async';

import 'package:flutter_contacts/src/data/remote/model/contact.dart';
import 'package:flutter_contacts/src/di/injection.dart';
import 'package:flutter_contacts/src/domain/contacts/get_contacts.dart';
import 'package:flutter_contacts/src/presentation/feature/contacts/contact_state.dart';
import 'package:rxdart/rxdart.dart';

class ContactsBloc {
  GetContacts _getContacts;

  ContactPopulated contactPopulated = ContactPopulated([]);

//  // Sinks
//  Sink get fetchContacts => _fetchContactsController.sink;
//
//  final _fetchContactsController = StreamController();

  // Streams
  Stream<ContactState> get contactsList => _contactsSubject.stream;

  final _contactsSubject = PublishSubject<ContactState>();

  ContactsBloc() {
    _getContacts = Injector().getContacts;

    _contactsSubject.addStream(fetchContacts());
  }

  Stream<ContactState> fetchContacts() async* {
    if (_hasNoExistingData()) {
      yield ContactLoading();
    }

    try {
      final List<Contact> contacts = await _getContacts.fetchContacts().timeout(Duration(seconds: 10));
      yield contactPopulated.update(newContacts: contacts);
    } catch (error) {
      print('error occured - ' + error);
      yield ContactError(error);
    }
  }

  bool _hasNoExistingData() => contactPopulated.contacts?.isEmpty ?? true;

  dispose() {
    // _fetchContactsController.close();
    _contactsSubject.close();
  }
}
