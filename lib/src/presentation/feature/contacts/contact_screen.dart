import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/domain/bloc/contacts_provider.dart';
import 'package:flutter_contacts/src/presentation/common/loading_indicator_widget.dart';
import 'package:flutter_contacts/src/presentation/common/text_widget.dart';
import 'package:flutter_contacts/src/presentation/feature/contacts/contact_list.dart';
import 'package:flutter_contacts/src/presentation/feature/contacts/contact_state.dart';

class ContactScreen extends StatefulWidget {
  @override
  ContactScreenState createState() {
    return new ContactScreenState();
  }
}

class ContactScreenState extends State<ContactScreen> {
  ContactsBloc bloc;

  @override
  void initState() {
    super.initState();
    LoadingIndicatorWidget(visible: true);
  }

  Widget build(context) {
    bloc = ContactsProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Contacts'),
      ),
      body: _ContactsList(bloc),
    );
  }

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }
}

class _ContactsList extends StatelessWidget {
  final ContactsBloc bloc;

  const _ContactsList(this.bloc);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.contactsList,
        builder: (context, snapshot) {
          final data = snapshot.data;
          return Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    LoadingIndicatorWidget(
                      visible: data is ContactStateLoading,
                    ),
                    ContactListWidget(
                      visible: data is ContactStatePopulated,
                      contactList:
                          data is ContactStatePopulated ? data.contacts : [],
                    ),
                    TextWidget(
                      visible: data is ContactStateError,
                      message: 'Something went wrong. Try again!',
                    ),
                    TextWidget(
                      visible: data is ContactStateEmpty,
                      message: 'Contact list is empty.',
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
