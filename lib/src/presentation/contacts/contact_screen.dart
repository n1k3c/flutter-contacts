import 'package:flutter/material.dart';
import 'package:flutter_contacts/src/domain/bloc/bloc_provider.dart';
import 'package:flutter_contacts/src/domain/bloc/contacts_bloc.dart';
import 'package:flutter_contacts/src/presentation/common/loading_indicator_widget.dart';
import 'package:flutter_contacts/src/presentation/common/text_widget.dart';
import 'package:flutter_contacts/src/presentation/contacts/contact_list.dart';
import 'package:flutter_contacts/src/presentation/contacts/contact_state.dart';
import 'package:flutter_contacts/src/util/constants.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(context) {
    ContactsBloc bloc = BlocProvider.of<ContactsBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: _ContactsList(bloc),
    );
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
                      visible: data is ContactStateError || snapshot.hasError,
                      message:
                          data is ContactStateError ? data.error : errorMessage,
                    ),
                    TextWidget(
                      visible: data is ContactStateEmpty,
                      message: emptyList,
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
