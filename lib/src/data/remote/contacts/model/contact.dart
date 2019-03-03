import 'package:flutter_contacts/src/data/remote/contacts/model/location.dart';
import 'package:flutter_contacts/src/data/remote/contacts/model/phone.dart';

class Contact {
  final String fullName;
  final String gender;
  final String email;
  final String imageUrl;
  final String birthday;
  final Location location;
  final List<Phone> phones;

  const Contact(
      {this.fullName,
      this.gender,
      this.email,
      this.imageUrl,
      this.birthday,
      this.location,
      this.phones});

  Contact.fromJson(Map<String, dynamic> json)
      : fullName = "${json['name']['first']} ${json['name']['last']}",
        gender = json['gender'],
        email = json['email'],
        imageUrl = json['picture']['large'],
        birthday = "Birthday ${json['dob']}",
        location = new Location.fromMap(json['location']),
        phones = <Phone>[
          new Phone(type: 'Home', number: json['phone']),
          new Phone(type: 'Mobile', number: json['cell'])
        ];
}
