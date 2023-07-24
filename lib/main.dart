

// import 'package:contact_app/database.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(ContactApp());
// }



// // final contactname ;
// class ContactApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ContactScreen(),
//     );
//   }
// }

// class ContactScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Contacts",
//           style: TextStyle(),
//         ),
//       ),
//       body: Column(
//         children: [
//           // Search TextField
//           const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.search, color: Colors.blue),
//                 hintText: "Search contacts...",
//               ),
//             ),
//           ),
//           // Group icon and text
//           const Row(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Icon(
//                   Icons.group,
//                   color: Colors.blue,
//                 ),
//               ),
//               Text("MyGroup"),
//             ],
//           ),
//           // Contact List
//           Expanded(
//             child: Scrollbar(
//               thickness: 10,
//               interactive: true,
//               isAlwaysShown: true,
//               controller: ScrollController(),
//               child: ListView.builder(
//                 itemCount: 8, // Replace this with the actual number of contacts
//                 itemBuilder: (context, index) {
//                   return
//                       //    ListTile(
//                       //   // Show images from picsum.photos
//                       //   leading: CircleAvatar(
//                       //     backgroundImage: AssetImage('assets/images/logo$index.png') ,

//                       //   ),
//                       // title: Text(contactname[index]),
//                       // subtitle: Text('$contactnumber:0$index'),
//                       // );
//                       ContactCard(
//                     img: "assets/imgs/logo$index.png",
//                     name: "contactname $index",
//                     number: "contactnumber $index",
//                     onMessageTap: () {
//                       print("Message tapped for Contact $index");
//                     },
//                     onCallTap: () {
//                       // Implement action for call icon tap
//                       print("Call tapped for Contact $index");
//                     },
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const ContactApp());
}

class  ContactApp extends StatelessWidget {
  const ContactApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: ContactScreen(),
    );
  }
}

class Contact {
  final String name;
  final String number;
  final String img;

  Contact({
    required this.name,
    required this.number,
    required this.img,
  });
}

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();
    loadContacts();
  }

  Future<void> loadContacts() async {
    try {
      String jsonString = await rootBundle.loadString('assets/contact.json');
      List<dynamic> jsonList = jsonDecode(jsonString);
      List<Contact> loadedContacts = jsonList.map((e) => Contact(
        name: e['name'],
        number: e['number'],
        img: e['img'],
      )).toList();

      setState(() {
        contacts = loadedContacts;
      });
    } catch (e) {
      // print('Error loading contacts: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contacts",
          style: TextStyle(),
        ),
      ),
      body: Column(
        children: [
        
          // Contact List
          Expanded(
            child: Scrollbar(
              thickness: 10,
              interactive: true,
              // isAlwaysShown: true,
              controller: ScrollController(),
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return ContactCard(
                    img: contacts[index].img,
                    name: contacts[index].name,
                    number: contacts[index].number,
                    onMessageTap: () {
                      // print("Message tapped for Contact ${contacts[index].name}");
                    },
                    onCallTap: () {
                      // print("Call tapped for Contact ${contacts[index].name}");
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
     

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon:
                Icon(Icons.home, color: Colors.blue), // Replace with your icon1
            label: "Screen 1", // Replace with the label for screen 1
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken,
                color: Colors.blue), // Replace with your icon2
            label: "Screen 2", // Replace with the label for screen 2
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.heart_broken), // Replace with your icon2
            label: "Screen 2", // Replace with the label for screen 2
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner_rounded,
                color: Colors.blue), // Replace with your icon2
            label: "Screen 3", // Replace with the label for screen 2
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sim_card_download,
                color: Colors.blue), // Replace with your icon2
            label: "Screen 4", // Replace with the label for screen 2
          ),
        ],
      ),
      // Floating Action Buttons
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Replace this with your FAB action
          // For example, you can show a dialog, navigate to a new screen, etc.
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Floating Action Button Clicked!'),
              content: const Text(
                  'You clicked the FAB in the bottom navigation bar.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          );

          //  setState(() {
          //   contactname.add('New Chat');
          //   contactnumber.add(7585369838);
          // });
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String img;
  final String name;
  final String number;
  final VoidCallback onMessageTap;
  final VoidCallback onCallTap;

  const ContactCard({super.key, 
    required this.img,
    required this.name,
    required this.number,
    required this.onMessageTap,
    required this.onCallTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/logo.png')),
        // title: Text(contactname[index]),
        // subtitle: Text(contactnumber[index]),

        title:const Text('contactname'),
        subtitle:const Text('contactnumber'),

        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.message, color: Colors.blue),
              onPressed: onMessageTap,
            ),
            IconButton(
              icon: const Icon(
                Icons.call,
                color: Colors.blue,
              ),
              onPressed: onCallTap,
            ),
          ],
        ),
      ),
    );
  }
}
