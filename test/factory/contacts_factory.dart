import 'package:flutter_contacts/src/data/remote/contacts/model/contact.dart';
import 'package:flutter_contacts/src/data/remote/contacts/model/location.dart';
import 'package:flutter_contacts/src/data/remote/contacts/model/phone.dart';

Contact contact1 = Contact(
  fullName: 'Full name 1',
  email: 'email1@email.com',
  location: location1,
  phones: dummyPhonesList(),
);

Contact contact2 = Contact(
  fullName: 'Full name 2',
  email: 'email2@email.com',
);

Contact contact3 = Contact(
  fullName: 'Full name 3',
  email: 'email3@email.com',
);

Location location1 = Location(
  street: 'Street 1',
  city: 'City 1',
);

Phone phone1 = Phone(
  type: 'Type 1',
  number: '0993434324',
);

Phone phone2 = Phone(
  type: 'Type 2',
  number: '0993434112',
);

List<Phone> dummyPhonesList() {
  return [phone1, phone2];
}

List<Contact> dummyContactList() {
  return [contact1, contact2, contact3];
}

List<Contact> dummyContactEmptyList() {
  return List<Contact>();
}
