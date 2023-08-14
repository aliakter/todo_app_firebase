// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field, invalid_return_type_for_catch_error, avoid_print, avoid_unnecessary_containers, prefer_typing_uninitialized_variables

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app_firebase/style/app_style.dart';

class TodoEditor extends StatefulWidget {
  const TodoEditor({super.key});

  @override
  State<TodoEditor> createState() => _TodoEditorState();
}

class _TodoEditorState extends State<TodoEditor> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);
  String date = DateTime.now().toString();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  static var DateFormat;
  static var datetime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.bgColor,
      appBar: AppBar(
        backgroundColor: AppStyle.appColors,
        elevation: 0,
        title: Text(
          "Add a new ToDo",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60.h,
                width: 350.w,
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextField(
                  controller: _titleController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  style: AppStyle.mainTitle,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Note Title',
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(date, style: AppStyle.dateTitle),
              SizedBox(height: 20.h),
              Container(
                height: 260.h,
                width: 350.w,
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TextField(
                  controller: _mainController,
                  style: AppStyle.mainContent,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  maxLines: null,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Note content',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.orangeColor,
        onPressed: () async {
          FirebaseFirestore.instance.collection("todo").add({
            "title": _titleController.text,
            "creation_date": date,
            "content": _mainController.text,
            "color_id": color_id
          }).then(
            (value) {
              print(value.id);
              Navigator.pop(context);
            },
          ).catchError(
              (error) => print("Failed to add new Note due to $error"));
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
