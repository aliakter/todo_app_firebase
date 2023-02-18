// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:todo_app_firebase/style/app_style.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppStyle.appColors,
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              height: 20,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/images/removebg-preview.png',
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 98, 136, 167),
            ),
          ),
        ],
      ),
    );
  }
}
