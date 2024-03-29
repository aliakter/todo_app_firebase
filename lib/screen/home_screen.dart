// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_firebase/screen/drawer.dart';
import 'package:todo_app_firebase/screen/todo_editor.dart';
import 'package:todo_app_firebase/screen/todo_reader.dart';
import 'package:todo_app_firebase/style/app_style.dart';
import 'package:todo_app_firebase/widget/todo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.appColors,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
          ),
        ),
        title: Text(
          "ToDo",
          style: TextStyle(
            fontSize: 27.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: NavigationDrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your recent Notes",
              style: GoogleFonts.roboto(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('todo').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasData) {
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      children: snapshot.data!.docs
                          .map(
                            (todo) => todoCard(
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TodoReader(
                                      documentSnapshot: todo,
                                    ),
                                  ),
                                );
                              },
                              todo,
                            ),
                          )
                          .toList(),
                    );
                  }
                  return Text(
                    "There's no Notes",
                    style: GoogleFonts.nunito(color: Colors.white),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TodoEditor()));
        },
        label: Text('Add Note', style: TextStyle(fontWeight: FontWeight.bold)),
        icon: Icon(Icons.add),
        backgroundColor: AppStyle.appColors,
      ),
    );
  }
}
