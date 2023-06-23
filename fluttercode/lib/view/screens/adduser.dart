import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttercode/controller/auth.dart';
import 'package:fluttercode/view/components/colors.dart';
import 'package:fluttercode/view/components/header.dart';
import 'package:fluttercode/view/components/inputtextbutton.dart';
import 'package:fluttercode/view/components/studentpost.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/teacherpost.dart';

class AddUser extends StatefulWidget {
  AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

enum Avatar { one, two, three, four, five }

class _AddUserState extends State<AddUser> {
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
    final PageController controller = PageController();
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 0),
      body: DraggableScrollableSheet(
          initialChildSize: 0.75,
          builder: (_, controller) => Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Center(
                            child: Text(
                          'Adicioanar Usuário',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                          ),
                        )),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      InputTextButton(
                          color: TerciaryColor,
                          title: 'Aluno',
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentPost(),
                              ),
                            );
                          }),
                      SizedBox(
                        height: 40,
                      ),
                      InputTextButton(
                          color: TerciaryColor,
                          title: 'Professor',
                          onClick: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TeacherPost(),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              )),
    );
  }
}




// https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038881-ac39566c-2fa5-4bcb-9c18-2df751b0abd2.png

// https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038927-28b4047a-fcf1-4ed1-943d-bcf35c8f30d9.png

// https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038909-572f9365-9a98-4818-bfbb-90ab9bb1604a.png

// https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038922-327de286-991a-4bce-afce-0f68ab971bb9.png

// https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038869-545ff5ef-b3da-40c6-a910-bab595d0f0a8.png
