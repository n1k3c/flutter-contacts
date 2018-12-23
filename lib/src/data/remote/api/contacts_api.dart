import 'dart:convert';
import 'package:flutter_contacts/src/data/remote/model/contact.dart';
import 'package:http/http.dart' as http;

const String _baseUrl = 'http://api.randomuser.me/';

const String _results = 'results';

const int _perPage = 25;

class ContactsApi {
  final JsonDecoder _decoder = new JsonDecoder();

  Future<List<Contact>> fetchContacts() {

    return http.get(_baseUrl + '?' + _results + '=' + _perPage.toString())
        .then((http.Response response) {
      final String jsonBody = response.body;
      final statusCode = response.statusCode;

//      if(statusCode < 200 || statusCode >= 300 || jsonBody == null) {
//        throw new FetchDataException("Error while getting contacts [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
//      }

      final contactsContainer = _decoder.convert(jsonBody);
      final List contactItems = contactsContainer['results'];

      return contactItems
          .map((contactRaw) => new Contact.fromMap(contactRaw))
          .toList();
    });
  }
}
