import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/data/remote/model/contact.dart';

class ContactListWidget extends StatelessWidget {
  final bool visible;

  final List<Contact> contactList;

  const ContactListWidget({this.visible, this.contactList});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context, position) {
          return BuildListTile(
            item: contactList[position],
          );
        },
      ),
    );
  }
}

class BuildListTile extends StatelessWidget {
  final Contact item;

  const BuildListTile({this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.fullName),
      subtitle: Text(item.email),
      leading: CircleAvatar(child: Text(item.fullName[0])),
      onTap: () {
        print(item.fullName);
      },
    );
  }
}
