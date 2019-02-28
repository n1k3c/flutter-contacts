class Location {
  final String street;

  final String city;

  const Location({this.street, this.city});

  Location.fromMap(Map<String, dynamic> map)
      : street = map['street'],
        city = map['city'];
}
