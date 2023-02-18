// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_firebase/style/app_style.dart';

Widget todoCard(Function()? onTap, QueryDocumentSnapshot documentSnapshot) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[documentSnapshot['color_id']],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(documentSnapshot["title"], style: AppStyle.mainTitle),
          SizedBox(height: 5.0),
          Text(documentSnapshot["creation_date"], style: AppStyle.dateTitle),
          SizedBox(height: 8.0),
          Text(
            documentSnapshot["content"],
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
