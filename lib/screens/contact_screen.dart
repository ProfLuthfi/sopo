import 'package:flutter/material.dart';
import 'package:sopo/screens/loginsimple.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  // Dummy data for contact list
  List<ContactItem> contacts = [
    ContactItem(name: 'Muhammad Luthfi', phone: '+62 08998992856'),
    ContactItem(name: 'Muhammad Irgi', phone: '+62 08998992856'),
    ContactItem(name: 'Irvan Febriawan', phone: '+62 08998992856'),
    ContactItem(name: 'Faisal', phone: '+62 08998992856'),
    ContactItem(name: 'Jhon Sky', phone: '+62 08998992856'),
    // Add more contact items as needed
  ];

  int? _editingIndex; // Index of the contact being edited

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    _openAddContactForm();
                  },
                  child: const Text("Add Contact"),
                ),
                const SizedBox(height: 16),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text(contacts[index].name[0]),
                        ),
                        title: Text(contacts[index].name),
                        subtitle: Text(contacts[index].phone),
                        onTap: () =>
                            _navigateToProfile(context, contacts[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                _openEditContactForm(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openAddContactForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add Contact"),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _addContactToList();
                  _formKey.currentState?.reset();
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _openEditContactForm(int index) {
    _editingIndex = index;
    _nameController.text = contacts[index].name;
    _phoneController.text = contacts[index].phone;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Contact"),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _editContactInList();
                  _formKey.currentState?.reset();
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _addContactToList() {
    final String name = _nameController.text;
    final String phone = _phoneController.text;

    setState(() {
      contacts.add(ContactItem(name: name, phone: phone));
    });
  }

  void _editContactInList() {
    final String name = _nameController.text;
    final String phone = _phoneController.text;

    if (_editingIndex != null) {
      setState(() {
        contacts[_editingIndex!] = ContactItem(name: name, phone: phone);
        _editingIndex = null;
      });
    }
  }

  void _navigateToProfile(BuildContext context, ContactItem contact) {
    // Navigate to the profile screen for the selected contact
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginSimple()),
    );
  }
}

class ContactItem {
  final String name;
  final String phone;

  ContactItem({
    required this.name,
    required this.phone,
  });
}
