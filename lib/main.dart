import 'package:business_contacts_app/ui/contact/contact_create_page.dart';
import 'package:business_contacts_app/ui/contacts_list/contacts_list_page.dart';
import 'package:business_contacts_app/ui/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ContactsModel()..loadContacts(),
      child: MaterialApp(
        title: 'Viritech Contacts List',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ContactsListPage(),
      ),
    );
  }
}
