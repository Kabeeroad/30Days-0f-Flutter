import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                    fillColor:
                        const Color.fromARGB(255, 156, 192, 220), // Background color for the text field

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
           const  Divider(),
            const Row(
              // mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 8.0),
                  child:CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 137, 189, 231),
                    radius: 20,
                    child: Icon(Icons.groups_2_rounded,color: Colors.blue,),
                  )
                  
                  
                  //  Icon(Icons.groups_2_sharp),
                  
                ),
                SizedBox(
                  width: 8,
                ),
                Text('MyGroup',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                Padding(
                  padding: EdgeInsets.all(0),
                  child: Icon(Icons.arrow_forward_ios_outlined),
                )
              ],
            ),
            Divider(),
          ],
          // crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}



// // final contactname ;
// class ContactApp extends StatelessWidget {
//   @overrid
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
