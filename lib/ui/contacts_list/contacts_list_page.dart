import 'package:business_contacts_app/data/contact.dart';
import 'package:business_contacts_app/ui/contact/contact_create_page.dart';
import 'package:business_contacts_app/ui/contacts_list/widget/contact_tile.dart';
import 'package:business_contacts_app/ui/model/contacts_model.dart';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart' as faker;
import 'package:scoped_model/scoped_model.dart';

//Homepage Widget class
class ContactsListPage extends StatefulWidget {
  @override
  _ContactsListPageState createState() => _ContactsListPageState();
}

class _ContactsListPageState extends State<ContactsListPage> {
  @override
  //Builds the contact page
  Widget build(BuildContext context) {
    //Scaffold is a container for the entire page
    return Scaffold(
      appBar: AppBar(
        title: Text('Viritech Contacts List'),
      ),
      body: ScopedModelDescendant<ContactsModel>(
          builder: (context, child, model) {
        if (model.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              itemCount: model.contacts.length,
              itemBuilder: (context, index) {
                return ContactTile(
                  contactIndex: index,
                );
              });
        }
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => ContactCreatePage()),
          );
        },
      ),
    );
  }
}
