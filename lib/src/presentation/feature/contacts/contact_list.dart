import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/data/remote/model/contact.dart';
import 'package:flutter_contacts/src/domain/bloc/contacts_provider.dart';
import 'package:flutter_contacts/src/presentation/feature/contacts/contact_state.dart';

class ContactList extends StatelessWidget {
  Widget build(context) {
    final bloc = ContactsProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Contacts'),
      ),
      body: buildList(bloc),
    );
  }

  Widget buildList(ContactsBloc bloc) {
    return StreamBuilder(
        stream: bloc.contactsList,
        builder: (context, snapshot) {
          final data = snapshot.data;

          if (data is ContactLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (data is ContactPopulated) {
            return ListView(
                padding: new EdgeInsets.symmetric(vertical: 8.0),
                children: _buildContactList(data.contacts));
          }
        });
  }

  List<_ContactListItem> _buildContactList(List<Contact> _contacts) {
    return _contacts
        .map((contact) => new _ContactListItem(
            contact: contact,
            onTap: () {
              print(contact.fullName);
            }))
        .toList();
  }
}

class _ContactListItem extends ListTile {
  _ContactListItem({Contact contact, GestureTapCallback onTap})
      : super(
            title: new Text(contact.fullName),
            subtitle: new Text(contact.email),
            leading: new CircleAvatar(child: new Text(contact.fullName[0])),
            onTap: onTap);
}
