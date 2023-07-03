import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Contact Lists',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contact> contacts = [
    Contact('Mukarrom Hosain', 'mukarrom21@gmail.com', '8801909037017'),
    Contact('Abdullah', 'abdullah@gmail.com', '8801512312388'),
    Contact('Atik Hasan', 'atik@gmail.com', '8801999665377'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              showModalBottomSheet(
                  constraints: const BoxConstraints(
                      maxHeight: 200, minWidth: double.infinity),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Contact Details',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 28,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Name: ${contacts[index].name}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Email: ${contacts[index].email}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Phone Number: ${contacts[index].phone}',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            title: Text(contacts[index].name),
          );
        },
      ),
    );
  }
}

/// tasks model
class Contact {
  String name, email, phone;
  Contact(this.name, this.email, this.phone);
}
