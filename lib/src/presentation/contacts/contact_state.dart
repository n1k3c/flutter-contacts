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

  ContactStatePopulated(this.contacts);
}

class ContactStateEmpty extends ContactState {}
