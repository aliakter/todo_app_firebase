// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:todo_app_firebase/page/about.dart';
import 'package:todo_app_firebase/page/contact.dart';
import 'package:todo_app_firebase/screen/home_screen.dart';
import 'package:todo_app_firebase/style/app_style.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppStyle.appColors,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Ali Akter"),
            accountEmail: Text("aliakter176162@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/IMG_20211217_125612.png"),
            ),
          ),
          ListTile(
            selectedColor: Colors.amber,
            leading: Icon(Icons.home, color: Colors.white),
            title: Text(
              "Home",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box, color: Colors.white),
            title: Text(
              "About",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => About(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.contact_mail,
              color: Colors.white,
            ),
            title: Text(
              "Contact",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Contact(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
