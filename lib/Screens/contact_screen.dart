// import 'package:day2_contactapp/Database/database.dart';
import 'package:day2_contactapp/Database/database.dart';
import 'package:flutter/material.dart';
// import 'package:line_icons/line_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:unicons/unicons.dart';
// import 'package:day2_contactapp/Database/database.dart';
import 'about_screen.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.photo,
  });
  final String name;
  final String phoneNumber;
  final String photo;
  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("contacts"),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 156, 192, 220),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 20, right: 8.0),
                      child: Icon(Icons.search),
                    ),
                    hintText: "search"),
              ),
            ),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Row(
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
                        )),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'MyGroup',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Icon(Icons.arrow_forward_ios_outlined),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (BuildContext context, index) {
                  return Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            // backgroundColor: Colors.green,
                            radius: 30,
                            backgroundImage: AssetImage(
                              widget.photo,
                            ),
                          ),
                          title: Text(contacts[index][widget.name]),
                          subtitle: Text(contacts[index][widget.phoneNumber]),
                          trailing: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 20,
                                  child: Icon(
                                    EvaIcons.messageCircleOutline,
                                    // UniconsLine.comment_alt_message,

                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: 20,
                                  child: Icon(
                                    Icons.call,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutScreen(
                                  name: contacts[index][widget.name],
                                  phoneNumber: contacts[index]
                                      [widget.phoneNumber],
                                  photo: contacts[index][widget.photo],
                                ),
                              ),
                            );
                          },
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          //? Container
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
