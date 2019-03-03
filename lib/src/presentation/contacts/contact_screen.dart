import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/src/domain/contacts/contact_bloc.dart';
import 'package:flutter_contacts/src/presentation/common/loading_indicator_widget.dart';
import 'package:flutter_contacts/src/presentation/common/text_widget.dart';
import 'package:flutter_contacts/src/presentation/contacts/contact_event.dart';
import 'package:flutter_contacts/src/presentation/contacts/contact_list.dart';
import 'package:flutter_contacts/src/presentation/contacts/contact_state.dart';
import 'package:flutter_contacts/src/util/constants.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
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
        title: Text(appTitle),
      ),
      body: BlocBuilder(
        bloc: contactBloc,
        builder: (context, ContactState state) {
          return Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    LoadingIndicatorWidget(
                      visible: state is ContactStateLoading,
                    ),
                    ContactListWidget(
                      visible: state is ContactStatePopulated,
                      contactList:
                          state is ContactStatePopulated ? state.contacts : [],
                    ),
                    TextWidget(
                      visible: state is ContactStateError,
                      message: state is ContactStateError
                          ? state.error
                          : errorMessage,
                    ),
                    TextWidget(
                      visible: state is ContactStateEmpty,
                      message: emptyList,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
