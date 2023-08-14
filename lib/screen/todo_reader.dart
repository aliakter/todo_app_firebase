// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names, unused_local_variable, prefer_typing_uninitialized_variables, unused_field, await_only_futures, invalid_return_type_for_catch_error, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_firebase/style/app_style.dart';

class TodoReader extends StatefulWidget {
  QueryDocumentSnapshot documentSnapshot;
  TodoReader({super.key, required this.documentSnapshot});

  @override
  State<TodoReader> createState() => _TodoReaderState();
}

class _TodoReaderState extends State<TodoReader> {
  delete(id) async {
    await FirebaseFirestore.instance.collection("todo").doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    int color_id = widget.documentSnapshot['color_id'];

    return Scaffold(
      backgroundColor: AppStyle.bgColor,
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
          "ToDo Read",
          style: TextStyle(
            fontSize: 27.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              delete(widget.documentSnapshot.id);
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.white60,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.documentSnapshot["title"],
                style: AppStyle.mainTitle,
              ),
              SizedBox(height: 5.h),
              Text(
                widget.documentSnapshot["creation_date"],
                style: AppStyle.dateTitle,
              ),
              SizedBox(height: 20.h),
              Text(
                widget.documentSnapshot["content"],
                style: AppStyle.mainContent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
