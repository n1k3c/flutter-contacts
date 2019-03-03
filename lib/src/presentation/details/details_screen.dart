import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/data/remote/model/contact.dart';
import 'package:flutter_contacts/src/domain/bloc/bloc_provider.dart';
import 'package:flutter_contacts/src/domain/bloc/contacts_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final Contact contact;

  DetailsScreen({this.contact});

  @override
  Widget build(BuildContext context) {
    ContactsBloc bloc = BlocProvider.of<ContactsBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.fullName),
      ),
      body: _DetailsBody(bloc),
    );
  }
}

class _DetailsBody extends StatelessWidget {
  final ContactsBloc bloc;

  const _DetailsBody(this.bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.contactsList,
        builder: (context, snapshot) {
          final data = snapshot.data;
          return Container(
            child: Text(data.toString()),
          );
        });
  }
}
