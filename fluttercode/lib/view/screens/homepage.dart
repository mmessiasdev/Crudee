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
          Header(
            title: 'Crudee',
          ),
          InitialBanner(),
          CardContainer(
            subText: "Idade",
            categ: "students",
            title: "Alunos",
            categPush: "students",
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CardContainer(
              subText: "Matéria",
              categ: "teachers",
              title: "Professores",
              categPush: "teachers",
            ),
          ),
          SizedBox(
            height: 50,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        highlightElevation: 3,
        backgroundColor: TerciaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            context: context,
            builder: (context) => AddUser(),
          );
        },
      ),
    );
  }
}
