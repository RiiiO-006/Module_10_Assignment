import 'package:flutter/material.dart';

void main() {
  runApp(const ContactListApp());
}

class ContactListApp extends StatelessWidget {
  const ContactListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contact List UI',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        // Set the default font size for better readability
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16.0),
        ),
      ),
      home: const ContactListPage(),
    );
  }
}

class ContactListPage extends StatelessWidget {
  const ContactListPage({super.key});

  // Placeholder data for the contact list
  final List<Map<String, String>> contacts = const [
    {'name': 'Jawad', 'number': '01877-777777'},
    {'name': 'Ferdous', 'number': '01673-777777'},
    {'name': 'Hasan', 'number': '01745-777777'},
    {'name': 'Hasan', 'number': '01745-777777'},
    {'name': 'Hasan', 'number': '01745-777777'},
    // Add a few more to make the list scrollable
    {'name': 'Ayesha', 'number': '01912-345678'},
    {'name': 'Karim', 'number': '01555-123456'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[700],
        centerTitle: true,
        // The image shows a darker blue/grey background for the AppBar
      ),
      body: Column(
        children: <Widget>[
          // --- Contact Input Section ---
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                // Name Input Field
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Hasan',
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  ),
                ),
                const SizedBox(height: 10),

                // Number Input Field
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: '01745-777777',
                    border: const OutlineInputBorder(),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  ),
                ),
                const SizedBox(height: 15),

                // Add Button
                SizedBox(
                  width: double.infinity, // Makes the button take full width
                  child: ElevatedButton(
                    onPressed: () {
                      // Functionality is not required, so we leave this empty
                      debugPrint('Add button pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey, // Button color
                      foregroundColor: Colors.white, // Text color
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // A subtle separator
          const Divider(height: 1, thickness: 1, color: Colors.grey),

          // --- Contact List Section ---
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ContactItem(
                  name: contacts[index]['name']!,
                  number: contacts[index]['number']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final String name;
  final String number;

  const ContactItem({
    super.key,
    required this.name,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    // The image shows the contacts in a list format, which can be achieved with ListTile.
    // It also resembles a Card/Container with padding and a bottom line.

    // We'll use a ListTile wrapped in a Padding and align the design to the image.
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
      child: ListTile(
        leading: const Icon(
          Icons.person,
          color: Colors.grey,
          size: 30.0,
        ),
        title: Text(
          name,
          style: TextStyle(
            color: Colors.red[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          number,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14.0,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.call,
            color: Colors.blue,
          ),
          onPressed: () {
            // Call functionality not required
            debugPrint('Call button pressed for $name');
          },
        ),
        // Add a horizontal line at the bottom of each item to mimic the look
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      ),
    );
  }
}