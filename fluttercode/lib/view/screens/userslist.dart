import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttercode/view/components/colors.dart';
import 'package:fluttercode/view/components/header.dart';
import 'package:fluttercode/view/screens/userscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../model/students.dart';

class UsersList extends StatefulWidget {
  UsersList({super.key, required this.categ, required this.subText});
  String categ;
  String subText;

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  // ${dotenv.get('BASEURL').toString()}/api/complaints?sort=id:DESC
  Future<List<Attributes>> getStudentList() async {
    // TODO: implement getPostsList
    List<Attributes> listItens = [];
    var url =
        Uri.parse('http://localhost:1337/api/${widget.categ}?sort=id:DESC');
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
    return Expanded(
      child: ListView(
        children: [
          Header(
            title: 'Crudee',
          ),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 100),
              child: FutureBuilder<List<Attributes>>(
                  future: getStudentList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var renders = snapshot.data![index];
                              if (renders.name != null) {
                                return ContUser(
                                  subText: widget.subText,
                                  categ: widget.categ,
                                  name: renders.name.toString(),
                                  age: renders.age.toString(),
                                  avatar: renders.avatar.toString(),
                                  active: renders.active!,
                                  id: renders.id.toString(),
                                );
                              }
                            }),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: PrimaryColor,
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class ContUser extends StatelessWidget {
  ContUser(
      {super.key,
      required this.name,
      required this.age,
      required this.avatar,
      required this.active,
      required this.categ,
      required this.id,
      required this.subText});

  String name;
  String age;
  String avatar;
  bool active;
  String id;
  String categ;
  String subText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width * 1,
          height: 60,
          decoration: BoxDecoration(
              color: SecoundColor, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      child: Image.network(
                        avatar,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          Text(
                            age,
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                active == true ? Icon(Icons.check) : Icon(Icons.warning)
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserScreen(
                categ: categ,
                name: name,
                age: age,
                active: active,
                avatar: avatar,
                id: id,
                subText: subText,
              ),
            ),
          );
        },
      ),
    );
  }
}
