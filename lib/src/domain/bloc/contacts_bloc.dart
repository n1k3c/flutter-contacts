import 'dart:async';
import 'package:flutter_contacts/src/data/remote/model/contact.dart';
import 'package:flutter_contacts/src/di/injection.dart';
import 'package:flutter_contacts/src/domain/contacts/get_contacts.dart';
import 'package:rxdart/rxdart.dart';

class ContactsBloc {
  GetContacts _getContacts;

//  // Sinks
//  Sink get fetchContacts => _fetchContactsController.sink;
//
//  final _fetchContactsController = StreamController();

  // Streams
  Stream<List<Contact>> get contactsList => _contactsSubject.stream;

  final _contactsSubject = BehaviorSubject<List<Contact>>();

  ContactsBloc() {
    _getContacts = Injector().getContacts;

    // _fetchContactsController.stream.listen(_fetchContacts)
  }

  void fetchContacts() async {
    final List<Contact>contacts = await _getContacts.fetchContacts();
    _contactsSubject.add(contacts);
  }

  dispose() {
    // _fetchContactsController.close();
    _contactsSubject.close();
  }
}