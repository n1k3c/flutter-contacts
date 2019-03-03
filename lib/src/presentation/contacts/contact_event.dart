import 'package:meta/meta.dart';

abstract class ContactEvent {
  ContactEvent();
}

class FetchContacts extends ContactEvent {}