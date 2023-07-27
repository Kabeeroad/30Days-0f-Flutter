import 'package:flutter/material.dart';
// import 'package:icons_plus/icons_plus.dart';
import 'database.dart';

void main() {
  runApp(const MyContact());
}

class MyContact extends StatefulWidget {
  const MyContact({super.key});

  @override
  State<MyContact> createState() => _MyContactState();
}

class _MyContactState extends State<MyContact> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ContactApp',
      home: Scaffold(
        appBar: AppBar(
          title: const Text("contacts"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 156, 192,
                        220), // Background color for the text field

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          20.0), // Border radius for the text field
                      borderSide: BorderSide.none,
                    ), // Space between the text and the border
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 8.0),
                      child: Icon(Icons.search),
                    ),
                    hintText: "search"),
              ),
            ),
            const Divider(),
            const Row(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 8.0),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 137, 189, 231),
                      radius: 20,
                      child: Icon(
                        Icons.groups_2_rounded,
                        color: Colors.blue,
                      ),
                    )

                    //  Icon(Icons.groups_2_sharp),

                    ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'MyGroup',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Icon(Icons.arrow_forward_ios_outlined),
                )
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, index) {
                  //  const Divider();
                  return Expanded(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/img/logo$index.png'),
                      ),
                      title: Text(name[index]),
                      subtitle: Text(number[index].toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.message),
                            onPressed: () {
                              print('Message tapped for Contact $index');
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.call),
                            onPressed: () {
                              // print('Call tapped for Contact $index');
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.home),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {},
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.settings),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.home),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
     ), );
  }
}

       









// import 'package:flutter/material.dart';

// void main() {
//   runApp(ContactApp());
// }

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
//         title: Text("Contacts"),
//       ),
//       body: Column(
//         children: [
//           // Search TextField
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "Search contacts...",
//                 prefixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           // Group icon and text
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Icon(Icons.group),
//               ),
//               Text("MyGroup"),
//             ],
//           ),
//           // Contact List
//           Expanded(
//             child: ListView.builder(
//               itemCount: 10, // Replace this with the actual number of contacts
//               itemBuilder: (context, index) {
//                 return ContactCard(
//                   // Pass contact data to the card
//                   img: "contact_image_$index.jpg", // Replace with the actual image path
//                   name: "Contact Name $index",
//                   number: "Contact Number $index",
//                   onMessageTap: () {
//                     // Implement action for message icon tap
//                     print("Message tapped for Contact $index");
//                   },
//                   onCallTap: () {
//                     // Implement action for call icon tap
//                     print("Call tapped for Contact $index");
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//       // Bottom Navigation Bar
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.icon1), // Replace with your icon1
//             label: "Screen 1", // Replace with the label for screen 1
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.icon2), // Replace with your icon2
//             label: "Screen 2", // Replace with the label for screen 2
//           ),
//         ],
//       ),
//       // Floating Action Buttons
//       floatingActionButton: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               // Implement action for icon3
//               print("Icon3 tapped");
//             },
//             child: Icon(Icons.icon3), // Replace with your icon3
//           ),
//           SizedBox(height: 16),
//           FloatingActionButton(
//             onPressed: () {
//               // Implement action for icon4
//               print("Icon4 tapped");
//             },
//             child: Icon(Icons.icon4), // Replace with your icon4
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ContactCard extends StatelessWidget {
//   final String img;
//   final String name;
//   final String number;
//   final VoidCallback onMessageTap;
//   final VoidCallback onCallTap;

//   ContactCard({
//     required this.img,
//     required this.name,
//     required this.number,
//     required this.onMessageTap,
//     required this.onCallTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundImage: AssetImage(img),
//         ),
//         title: Text(name),
//         subtitle: Text(number),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               icon: Icon(Icons.message),
//               onPressed: onMessageTap,
//             ),
//             IconButton(
//               icon: Icon(Icons.call),
//               onPressed: onCallTap,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }