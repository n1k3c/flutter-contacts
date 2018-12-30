import 'package:flutter_contacts/src/data/remote/model/contact.dart';
import 'package:flutter_contacts/src/data/remote/model/info.dart';

class ContactsResponse {
  List<Contact> contacts;
  Info info;

  ContactsResponse({this.contacts, this.info});

  ContactsResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      contacts = new List<Contact>();
      json['results'].forEach((v) {
        contacts.add(new Contact.fromJson(v));
      });
    }
    info = json['info'] != null ? new Info.fromJson(json['info']) : null;
  }
}