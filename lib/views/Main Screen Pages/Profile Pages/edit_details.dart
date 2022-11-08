import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EditDetailsPage extends StatefulWidget {
  const EditDetailsPage({super.key});

  @override
  State<EditDetailsPage> createState() => _EditDetailsPageState();
}

class _EditDetailsPageState extends State<EditDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.navigate_before,
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Profile",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(34, 34, 59, 1),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Logout"),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(74, 78, 105, 1),
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      shadowColor: Colors.grey),
                ),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: Image.network(
                      "https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o="),
                ),
                Column(
                  children: [
                    Text("Tooba Nadeem"),
                    Text("View Profile and Edit Profile"),
                  ],
                )
              ],
            ),
            Container(
              height: 300,
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white, // Your desired background color
                        // borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5),
                        ]),
                    child: ListTile(
                      leading: Icon(
                        Icons.wallet,
                        color: Color.fromRGBO(34, 34, 59, 1),
                      ),
                      title: Text(
                        "My Orders and Products",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(34, 34, 59, 1),
                        ),
                      ),
                      subtitle: Text(
                        "Your Products, Orders, billing and invoices",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 0, 0, 0.44),
                        ),
                      ),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: Color.fromRGBO(34, 34, 59, 1),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    subtitle: Text("Privacy and manage accounts"),
                    trailing: Icon(Icons.navigate_next),
                  ),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text("Help and Support"),
                    subtitle: Text("Help Center and Legal Terms "),
                    trailing: Icon(Icons.navigate_next),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.network(
                          "https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o="),
                    ),
                    title: Text("Switch Accounts"),
                    subtitle: Text("Switch between profiles"),
                    trailing: Icon(Icons.navigate_next),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
