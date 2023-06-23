import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/auth.dart';
import 'buttomcont.dart';
import 'colors.dart';
import 'header.dart';
import 'inputtextbutton.dart';
import 'opcmenu.dart';

class StudentPost extends StatefulWidget {
  const StudentPost({super.key});

  @override
  State<StudentPost> createState() => _StudentPostState();
}

enum Avatar { one, two, three, four, five }

class _StudentPostState extends State<StudentPost> {
  Avatar? selectAvatar;
  bool active = false;
  String url = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Header(
            title: 'Add Aluno',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Column(
              children: [
                SizedBox(
                  height: 210,
                  child: GridView(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
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
                        border: OutlineInputBorder(), hintText: 'Idade'),
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
                        print(nameController.text);
                        authController().students(
                            name: nameController.text,
                            age: ageController.text,
                            url: url,
                            active: active);
                      },
                      title: 'Adicionar',
                      color: PrimaryColor,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
