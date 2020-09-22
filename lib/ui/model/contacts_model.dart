import 'package:business_contacts_app/data/contact.dart';
import 'package:business_contacts_app/data/db/contact_dao.dart';
import 'package:faker/faker.dart' as faker;
import 'package:scoped_model/scoped_model.dart';

class ContactsModel extends Model {
  final ContactDao _contactDao = ContactDao();

  List<Contact> _contacts;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  List<Contact> get contacts => _contacts;

  Future loadContacts() async {
    _isLoading = true;
    notifyListeners();
    _contacts = await _contactDao.getAllInSortedOrder();
    _isLoading = false;
    notifyListeners();
  }

  Future addContact(Contact contact) async {
    await _contactDao.insert(contact);
    await loadContacts();
    notifyListeners();
  }

  Future updateContact(Contact contact) async {
    await _contactDao.update(contact);
    await loadContacts();
    notifyListeners();
  }

  Future deleteContact(Contact contact) async {
    await _contactDao.delete(contact);
    await loadContacts();
    notifyListeners();
  }

  Future changeFavoriteStatus(Contact contact) async {
    contact.isFavourite = !contact.isFavourite;
    await _contactDao.update(contact);
    _contacts = await _contactDao.getAllInSortedOrder();
    notifyListeners();
  }
}
