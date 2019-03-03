import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/src/data/remote/model/contact.dart';
import 'package:flutter_contacts/src/domain/bloc/contact_bloc.dart';
import 'package:flutter_contacts/src/presentation/contacts/contact_event.dart';
import 'package:flutter_contacts/src/presentation/contacts/contact_state.dart';

class DetailsScreen extends StatefulWidget {
  final Contact contact;

  DetailsScreen({@required this.contact});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ContactBloc contactBloc;

  @override
  void initState() {
    super.initState();
    contactBloc = ContactBloc();
    contactBloc.dispatch(FetchContacts());
  }

  @override
  void dispose() {
    contactBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contact.fullName),
      ),
      body: BlocBuilder(
        bloc: contactBloc,
        builder: (context, ContactState state) {
          return Text(state.toString());
        },
      ),
    );
  }
}
