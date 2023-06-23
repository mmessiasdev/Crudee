import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/auth.dart';
import '../../model/students.dart';
import '../components/buttomcont.dart';
import '../components/colors.dart';
import '../components/header.dart';
import '../components/inputtextbutton.dart';
import 'package:http/http.dart' as http;

class EditUser extends StatefulWidget {
  EditUser(
      {super.key,
      required this.id,
      required this.categ,
      required this.subText});
  String id;
  String categ;
  String subText;

  @override
  State<EditUser> createState() => _EditUserState();
}

enum Avatar { one, two, three, four, five }

class _EditUserState extends State<EditUser> {
  Avatar? selectAvatar;
  bool active = false;
  String url =
      "https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038881-ac39566c-2fa5-4bcb-9c18-2df751b0abd2.png";
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  // ${dotenv.get('BASEURL').toString()}/api/complaints?sort=id:DESC
  Future<List<Attributes>> getStudentList() async {
    // TODO: implement getPostsList
    List<Attributes> listItens = [];
    var url =
        Uri.parse('http://localhost:1337/api/${widget.categ}/${widget.id}');
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AvatarColor,
      body: ListView(
        children: [
          Header(
            title: 'Editar',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 210,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 80,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 80,
                    ),
                    children: [
                      ButtomCont(
                        url:
                            'https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038881-ac39566c-2fa5-4bcb-9c18-2df751b0abd2.png',
                        border: selectAvatar == Avatar.one
                            ? PrimaryColor
                            : SecoundColor,
                        onClick: () {
                          setState(() {
                            selectAvatar = Avatar.one;
                            url =
                                "https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038881-ac39566c-2fa5-4bcb-9c18-2df751b0abd2.png";
                            print(url);
                          });
                        },
                      ),
                      ButtomCont(
                        url:
                            'https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038927-28b4047a-fcf1-4ed1-943d-bcf35c8f30d9.png',
                        border: selectAvatar == Avatar.two
                            ? PrimaryColor
                            : SecoundColor,
                        onClick: () {
                          setState(() {
                            selectAvatar = Avatar.two;
                            url =
                                "https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038927-28b4047a-fcf1-4ed1-943d-bcf35c8f30d9.png";
                            print(url);
                          });
                        },
                      ),
                      ButtomCont(
                        url:
                            'https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038909-572f9365-9a98-4818-bfbb-90ab9bb1604a.png',
                        border: selectAvatar == Avatar.three
                            ? PrimaryColor
                            : SecoundColor,
                        onClick: () {
                          setState(() {
                            selectAvatar = Avatar.three;
                            url =
                                "https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038909-572f9365-9a98-4818-bfbb-90ab9bb1604a.png";
                            print(url);
                          });
                        },
                      ),
                      ButtomCont(
                        url:
                            'https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038922-327de286-991a-4bce-afce-0f68ab971bb9.png',
                        border: selectAvatar == Avatar.four
                            ? PrimaryColor
                            : SecoundColor,
                        onClick: () {
                          setState(() {
                            selectAvatar = Avatar.four;
                            url =
                                "https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038922-327de286-991a-4bce-afce-0f68ab971bb9.png";
                            print(url);
                          });
                        },
                      ),
                      ButtomCont(
                        url:
                            'https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038869-545ff5ef-b3da-40c6-a910-bab595d0f0a8.png',
                        border: selectAvatar == Avatar.five
                            ? PrimaryColor
                            : SecoundColor,
                        onClick: () {
                          setState(() {
                            selectAvatar = Avatar.five;
                            url =
                                "https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038869-545ff5ef-b3da-40c6-a910-bab595d0f0a8.png";
                            print(url);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Center(
                  child: TextField(
                    controller: nameController,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Nome'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: TextField(
                    controller: ageController,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: widget.subText),
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
                        value: this.active,
                        onChanged: (bool? active) {
                          setState(() {
                            this.active = active!;
                          });
                          print(active);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: InputTextButton(
                      onClick: () {
                        print(widget.id);
                        authController().editUsers(
                          categ: widget.categ,
                          name: nameController.text,
                          age: ageController.text,
                          url: url,
                          id: widget.id,
                          active: active,
                        );
                      },
                      title: 'Concluido',
                      color: PrimaryColor,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

          // FutureBuilder<List<Attributes>>(
          //   future: getStudentList(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return ListView.builder(
          //         shrinkWrap: true,
          //         scrollDirection: Axis.vertical,
          //         itemCount: snapshot.data!.length,
          //         itemBuilder: (context, index) {
          //           var renders = snapshot.data![index];
          //           if (renders.name != null) {}
          //         },
          //       );
          //     }
          //     return Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   },
          // ),

