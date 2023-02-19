// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:todo_app_firebase/style/app_style.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.appColors,
        title: Text('Contact'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 165.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('MD. ALI AKTER',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text('Email: aliakter176162@gmail.com',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                Text('Phone: 01784089436',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
                Text('',
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 15)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
