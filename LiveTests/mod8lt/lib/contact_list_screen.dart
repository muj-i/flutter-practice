import 'package:flutter/material.dart';

class ContactListScreen extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(
      name: 'John Doe',
      email: 'johndoe@example.com',
      phoneNumber: '1234567890',
    ),
    Contact(
      name: 'Jane Smith',
      email: 'janesmith@example.com',
      phoneNumber: '9876543210',
    ),
    Contact(
      name: 'Robert Johnson',
      email: 'robertjohnson@example.com',
      phoneNumber: '48474445894',
    ),
    Contact(
      name: 'Tim Steven',
      email: 'timsteven@example.com',
      phoneNumber: '4567567456',
    ),
    Contact(
      name: 'Robert Doglas',
      email: 'robertdoglas@example.com',
      phoneNumber: '2555649464',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 25,
        title: Text('Contact List'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green.shade200,
            ),
            child: ListTile(
              title: Text(contact.name),
              onTap: () {
                _showContactDetails(context, contact);
              },
            ),
          );
        },
      ),
    );
  }

  void _showContactDetails(BuildContext context, Contact contact) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Name: ${contact.name}',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Email: ${contact.email}',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Phone: ${contact.phoneNumber}',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade300,
                    foregroundColor: Colors.black87),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Contact {
  final String name;
  final String email;
  final String phoneNumber;

  Contact({
    required this.name,
    required this.email,
    required this.phoneNumber,
  });
}
