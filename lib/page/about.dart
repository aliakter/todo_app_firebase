// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:todo_app_firebase/style/app_style.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppStyle.appColors,
        title: Text('About'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('About this app',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              SizedBox(height: 20),
              Text(
                  'Stop procrastinating and be productive with DoDay! DoDay is a To Do List app to help you organize and manage tasks. Make DoDay your morning routine so you can accomplish more every day. List your chores, homework, paying bills, appointments, work related tasks, and everything you need to complete every day. Add due dates (or deadlines) and notes to each task to help you set priorities. DoDay is an intuitive and daily planner for you, whether you are a freelancer, a professional, a businessman, a student, or a mom. We will help you to stop procrastinating and achieve your goals.'),
              SizedBox(height: 10),
              Text(
                  "FEATURES OF DODAY – TO DO LIST, MANAGE TASK & DAILY PLANNER:"),
              Text(
                  "1. Sort out your priorities by assigning tasks to specific days."),
              Text(
                  "2. Color-code tasks to help you sort priorities and types of tasks"),
              Text("3. Sort your things to do by swiping them left or right."),
              Text("4. Create habits for recurring tasks"),
              Text(
                  "5. Monitor your accomplishments from the Done Today section."),
              Text("6. Multiple languages available."),
              SizedBox(height: 10),
              Text(
                  "How to use DoDay – To Do List, Manage Task & Daily Planner:"),
              Text("- Add a task anytime using the Add New Task Button."),
              Text("- Add more info such as deadlines or additional notes."),
              Text("- Add a color code to categorize your task."),
              Text(
                  "- Open DoDay as part of your morning routine and move things todo for that day to Tasks for Today."),
              Text(
                  "- Swipe a task to the left to move it to your Tasks for Today."),
              Text("- Swipe a task to the right to mark it as done."),
              Text(
                  "- Mark completed tasks as Done and let us help you track your progress and accomplishment."),
              SizedBox(height: 8),
              Text(
                  "It’s not easy to stop procrastinating and build a better, more productive daily habit. Start with DoDay and make us an integral part of your morning routine. Through this simple app, we are confident that you can accomplish more every day and complete all projects in time for their deadlines."),
              SizedBox(height: 10),
              Text(
                  'This Flutter based To-do app is available on: https://github.com/aliakter/todo_app_firebase'),
              SizedBox(height: 10),
              Text('Enjoy en learn!'),
              SizedBox(height: 10),
              Text(
                  "Do you need a new App or help with extending your current (Flutter-based) App, don't hesitate to contact us."),
            ],
          ),
        ),
      ),
    );
  }
}
