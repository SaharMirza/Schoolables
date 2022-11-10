//Seperate List View widget for Edit Profile Screen
import 'package:flutter/material.dart';
import 'package:flutterdemo/constants/fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/colors.dart';

class MyProfileListView extends StatelessWidget {
  const MyProfileListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        //Can add ListView here to make the list tiles scrollable
        children: [
          MyProfileListTile(
              icon: Icons.wallet,
              title: "My Orders and Products",
              subtitle: "Your Products, Orders, billing and invoices"),
          MyProfileListTile(
              icon: Icons.settings,
              title: "Settings",
              subtitle: "Privacy and manage accounts"),
          MyProfileListTile(
              icon: Icons.help,
              title: "Help and Support",
              subtitle: "Help Center and Legal Terms "),
          MyProfileListTile(
              icon: Icons.person,
              title: "Switch Accounts",
              subtitle: "Switch between profiles"),
        ],
      ),
    );
  }
}

//List Tiles widget used in MyProfileListView
class MyProfileListTile extends StatelessWidget {
  const MyProfileListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration:
          BoxDecoration(color: Colors.white, // Your desired background color
              // borderRadius: BorderRadius.circular(15),
              boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5),
          ]),
      child: ListTile(
        leading: Icon(
          icon,
          color: MyColors.textColor,
        ),
        title: Text(
          title,
          style: MyStyles.googleTextListTile,
        ),
        subtitle: Text(
          subtitle,
          style: MyStyles.googleTextSubtitleListTile,
        ),
        trailing: Icon(
          Icons.navigate_next,
          color: MyColors.textColor,
        ),
      ),
    );
  }
}

class MyProfileTextWidget extends StatelessWidget {
  const MyProfileTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: MyStyles.googleTitleText,
    );
  }
}

class LogoutBtnWidget extends StatelessWidget {
  const LogoutBtnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text("Logout"),
      style: ElevatedButton.styleFrom(
          backgroundColor: MyColors.buttonColor,
          textStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          shadowColor: Colors.grey),
    );
  }
}

class MyProfileNameCard extends StatelessWidget {
  const MyProfileNameCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.white,
            child: Image.network(
                "https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o="),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Tooba Nadeem",
                style: MyStyles.googleTextListTile,
              ),
              Text("View Profile and Edit Profile",
                  style: MyStyles.googleTextSubtitleListTile),
            ],
          )
        ],
      ),
    );
  }
}

class NavigateBackWidget extends StatelessWidget {
  const NavigateBackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.navigate_before,
      color: Colors.black,
    );
  }
}
