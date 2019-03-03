import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/data/remote/model/contact.dart';
import 'package:flutter_contacts/src/presentation/details/details_screen.dart';
import 'package:flutter_contacts/src/util/constants.dart';

class ContactListWidget extends StatelessWidget {
  final bool visible;

  final List<Contact> contactList;

  const ContactListWidget({this.visible, this.contactList});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? opacityVisible : opacityInvisible,
      duration: Duration(milliseconds: defaultAnimationDuration),
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(contact: item),
          ),
        );
      },
    );
  }
}
