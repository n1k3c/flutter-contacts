import 'package:flutter_contacts/src/data/remote/model/contact.dart';

class ContactState {
  ContactState();
}

class ContactStateLoading extends ContactState {}

class ContactStateError extends ContactState {
  final String error;

  ContactStateError(this.error);
}

class ContactStatePopulated extends ContactState {
  final List<Contact> contacts;

  update({List<Contact> newContacts}) {
    return this..contacts.addAll(newContacts ?? this.contacts);
  }

  ContactStatePopulated(this.contacts);
}

class ContactStateEmpty extends ContactState {}
