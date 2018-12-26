import 'package:flutter_contacts/src/data/remote/model/contact.dart';

class ContactState {
  ContactState();
}

class ContactLoading extends ContactState {}

class ContactError extends ContactState {
  final String error;
  ContactError(this.error);
}

class ContactNoResults extends ContactState {}

class ContactPopulated extends ContactState {
  final List<Contact> contacts;

  update({List<Contact> newContacts}) {
    return this..contacts.addAll(newContacts ?? this.contacts);
  }

  ContactPopulated(this.contacts);
}

class ContactEmpty extends ContactState {}