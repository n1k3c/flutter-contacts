import 'package:flutter_contacts/src/data/remote/api/contacts_api.dart';
import 'package:flutter_contacts/src/domain/bloc/contact_bloc.dart';
import 'package:flutter_contacts/src/domain/contacts/get_contacts.dart';
import 'package:flutter_contacts/src/presentation/contacts/contact_state.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../factory/contacts_factory.dart';

const ContactsStateLoading = TypeMatcher<ContactStateLoading>();
const ContactsStateEmpty = TypeMatcher<ContactStateEmpty>();
const ContactsStateError = TypeMatcher<ContactStateError>();
const ContactsStatePopulated = TypeMatcher<ContactStatePopulated>();

class MockGetContacts extends Mock implements GetContacts {}

void main() {
  MockGetContacts getContacts;

  ContactBloc contactsBloc;

  setUp(() {
    getContacts = MockGetContacts();

    contactsBloc = ContactBloc(getContacts: getContacts);
  });

  test('emits a loading state and then a populated state', () {
    when(contactsBloc.getContacts.fetchContacts()).thenAnswer((_) async => dummyContactList());
    expect(contactsBloc.contactsList, emitsInOrder([ContactsStateLoading, ContactsStatePopulated]));
  });

  test('emits a loading state and then a empty state', () {
    when(contactsBloc.getContacts.fetchContacts()).thenAnswer((_) async => dummyContactEmptyList());
    expect(contactsBloc.contactsList, emitsInOrder([ContactsStateLoading, ContactsStateEmpty]));
  });

  test('emits a loading state and then a error state', () {
    when(contactsBloc.getContacts.fetchContacts()).thenThrow(Exception('Your error message is here.'));
    expect(contactsBloc.contactsList, emitsInOrder([ContactsStateLoading, ContactsStateError]));
  });
}