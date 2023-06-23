import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttercode/view/components/colors.dart';
import 'package:fluttercode/view/components/header.dart';
import 'package:fluttercode/view/components/inputtextbutton.dart';
import 'package:fluttercode/view/screens/useredit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../model/students.dart';

class UserScreen extends StatefulWidget {
  UserScreen({
    super.key,
    required this.name,
    required this.age,
    required this.avatar,
    required this.active,
    required this.id,
    required this.categ,
    required this.subText
  });

  String name;
  String age;
  String avatar;
  bool active;
  String id;
  String categ;
  String subText;

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  Future<List<Attributes>> getStudentList() async {
    // TODO: implement getPostsList
    List<Attributes> listItens = [];
    var url = Uri.parse('http://localhost:1337/api/students/${widget.id}');
    var response = await http.get(url);
    var body = jsonDecode(response.body);
    // parse
    var itemCount = body["data"];
    for (var i = 0; i < itemCount.length; i++) {
      listItens.add(Attributes.fromJson(itemCount[i]));
    }
    return listItens;
  }

  Future<void> getData() async {
    await Future.delayed(const Duration(seconds: 2));
    getStudentList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(
            title: widget.name,
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: Image.network(widget.avatar),
                ),
                Text(
                  widget.name,
                  style: GoogleFonts.montserrat(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                Text(
                  widget.age,
                  style: GoogleFonts.montserrat(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ativado',
                        style: GoogleFonts.montserrat(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Checkbox(
                        value: this.widget.active,
                        onChanged: (bool? active) {
                          setState(() {
                            this.widget.active = widget.active;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                InputTextButton(
                    title: "Editar",
                    color: TerciaryColor,
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditUser(
                                  id: widget.id,
                                  categ: widget.categ,
                                  subText: widget.subText,
                                )),
                      );
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
