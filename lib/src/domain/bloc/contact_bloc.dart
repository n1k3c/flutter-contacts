import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_contacts/src/data/remote/model/contact.dart';
import 'package:flutter_contacts/src/di/injection.dart';
import 'package:flutter_contacts/src/domain/contacts/get_contacts.dart';
import 'package:flutter_contacts/src/presentation/contacts/contact_event.dart';
import 'package:flutter_contacts/src/presentation/contacts/contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  GetContacts getContacts;

  ContactBloc({this.getContacts}) {
    if (getContacts == null) {
      getContacts = Injector().getContacts;
    }
  }

  @override
  ContactState get initialState => ContactStateEmpty();

  @override
  Stream<ContactState> mapEventToState(
      ContactState currentState, ContactEvent event) async* {
    if (event is FetchContacts) {
      yield ContactStateLoading();

      try {
        final List<Contact> contacts = await getContacts.fetchContacts();
        if (contacts.isEmpty) {
          yield ContactStateEmpty();
        } else {
          yield ContactStatePopulated(contacts);
        }
      } catch (error) {
        yield ContactStateError(error.toString());
      }
    }
  }
}
