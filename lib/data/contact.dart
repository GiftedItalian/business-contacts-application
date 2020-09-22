import 'dart:io';
import 'package:meta/meta.dart';

class Contact {
  int id;

  String name;
  String email;
  String phoneNumber;
  bool isFavourite;
  File imageFile;

  //Constructor with optional named parameters
  Contact({
    @required this.name,
    @required this.email,
    this.phoneNumber,
    this.isFavourite = false,
    this.imageFile,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'isFavourite': isFavourite ? 1 : 0,
      'imageFilePath': imageFile?.path,
    };
  }

  static Contact fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      isFavourite: map['isFavourite'] == 1 ? true : false,
      imageFile:
          map['imageFilePath'] != null ? File(map['imageFilePath']) : null,
    );
  }
}
