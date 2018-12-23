import 'package:flutter_contacts/src/data/remote/api/contacts_api.dart';
import 'package:flutter_contacts/src/di/injection.dart';
import 'package:flutter_contacts/src/data/remote/model/contact.dart';

class GetContacts {
  ContactsApi _contactsApi;

  GetContacts() {
    _contactsApi = Injector().contactsApi;
  }

  Future<List<Contact>> fetchContacts() {
    return _contactsApi.fetchContacts();
  }
}