import 'package:flutter_contacts/src/domain/contacts/contact_bloc.dart';
import 'package:flutter_contacts/src/domain/contacts/get_contacts.dart';
import 'package:flutter_contacts/src/domain/contacts/contact_event.dart';
import 'package:flutter_contacts/src/domain/contacts/contact_state.dart';
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

  ContactBloc contactBloc;

  setUp(() {
    getContacts = MockGetContacts();

    contactBloc = ContactBloc(getContacts: getContacts);
  });

  group('check correct order of states', () {
    test('emits a empty state as init state', () {
      expect(contactBloc.initialState, ContactsStateEmpty);
    });

    test('check correct order of emits states on success', () {
      when(getContacts.fetchContacts())
          .thenAnswer((_) async => dummyContactList());

      contactBloc.dispatch(FetchContacts());

      expect(
          contactBloc.state,
          emitsInOrder([
            ContactsStateEmpty,
            ContactsStateLoading,
            ContactsStatePopulated
          ]));
    });

    test('check correct order of emits states when list is empty', () {
      when(getContacts.fetchContacts())
          .thenAnswer((_) async => dummyContactEmptyList());

      contactBloc.dispatch(FetchContacts());

      expect(
          contactBloc.state,
          emitsInOrder(
              [ContactsStateEmpty, ContactsStateLoading, ContactsStateEmpty]));
    });

    test('check correct order of emits states on error', () {
      when(contactBloc.getContacts.fetchContacts())
          .thenThrow(Exception('Your error message is here.'));

      contactBloc.dispatch(FetchContacts());

      expect(
          contactBloc.state,
          emitsInOrder(
              [ContactsStateEmpty, ContactsStateLoading, ContactsStateError]));
    });
  });
}
