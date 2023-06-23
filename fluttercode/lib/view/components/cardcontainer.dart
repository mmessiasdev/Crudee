import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttercode/view/screens/userslist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../model/students.dart';
import 'card.dart';
import 'colors.dart';

class CardContainer extends StatefulWidget {
  CardContainer({
    super.key,
    required this.categ,
    required this.title,
    required this.categPush,
    required this.subText,
  });
  String categ;
  String title;
  String categPush;
  String subText;

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  // ${dotenv.get('BASEURL').toString()}/api/complaints?sort=id:DESC
  Future<List<Attributes>> getStudentList() async {
    // TODO: implement getPostsList
    List<Attributes> listItens = [];
    var url = Uri.parse('http://localhost:1337/api/${widget.categ}');
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
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'Ver Todos',
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UsersList(
                          subText: widget.subText,
                          categ: widget.categPush,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 240,
            child: FutureBuilder<List<Attributes>>(
                future: getStudentList(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          var renders = snapshot.data![index];
                          if (renders.name != null) {
                            return CardCont(
                              subText: widget.subText,
                                categ: widget.categ,
                                id: renders.id.toString(),
                                name: renders.name.toString(),
                                age: renders.age.toString(),
                                avatar: renders.avatar.toString(),
                                active: renders.active!);
                          }
                        });
                  }
                  return CircularProgressIndicator(
                    color: PrimaryColor,
                  );
                }),
          )
        ],
      ),
    );
  }
}
