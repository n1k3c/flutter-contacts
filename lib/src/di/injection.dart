import 'package:flutter_contacts/src/data/remote/api/contacts_api.dart';
import 'package:flutter_contacts/src/domain/contacts/get_contacts.dart';

class Injector {
  static final Injector _singleton = new Injector._internal();

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  ContactsApi get contactsApi {
    return ContactsApi();
  }

  GetContacts get getContacts {
    return GetContacts();
  }
}
