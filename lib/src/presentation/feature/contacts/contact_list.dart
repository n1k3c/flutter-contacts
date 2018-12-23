import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/data/remote/model/contact.dart';
import 'package:flutter_contacts/src/domain/bloc/contacts_provider.dart';

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
      builder: (context, AsyncSnapshot<List<Contact>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
            padding: new EdgeInsets.symmetric(vertical: 8.0),
            children: _buildContactList(snapshot.data));
      },
    );
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
