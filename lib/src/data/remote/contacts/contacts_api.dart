import 'dart:convert';
import 'dart:io';

import 'package:flutter_contacts/src/data/remote/contacts/model/contacts_response.dart';
import 'package:http/http.dart' as http;

const String _baseUrl = 'http://api.randomuser.me/';

const String _results = 'results';

const int _perPage = 25;

class ContactsApi {
  final JsonDecoder _decoder = new JsonDecoder();

  Future<ContactsResponse> fetchContacts() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    final isConnected = await _checkConnectivity();

    if (isConnected) {
      final response = await http.get(
          '$_baseUrl?$_results=${_perPage.toString()}',
          headers: requestHeaders);

      if (response.statusCode == 200) {
        return ContactsResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to fetch data from API.');
      }
    } else
      throw Exception('Check your internet connection.');
  }
}

Future<bool> _checkConnectivity() async {
  bool connect;
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      connect = true;
    }
  } on SocketException catch (_) {
    connect = false;
  }
  return connect;
}
