import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttercode/view/components/card.dart';
import 'package:fluttercode/view/screens/adduser.dart';
import 'package:fluttercode/view/components/banner.dart';
import 'package:fluttercode/view/components/cardcontainer.dart';
import 'package:fluttercode/view/components/colors.dart';
import 'package:fluttercode/view/components/header.dart';

import '../../model/students.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(title: 'Crudee',),
          InitialBanner(),
          CardContainer(
            categ: "students",
            title: "Alunos",
            categPush: "students",
          ),
          CardContainer(
            categ: "teachers",
            title: "Professores",
            categPush: "teachers",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        highlightElevation: 3,
        backgroundColor: TerciaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddUser(),
            ),
          );
        },
      ),
    );
  }
}
