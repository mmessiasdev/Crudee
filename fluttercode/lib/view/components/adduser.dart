import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttercode/view/components/colors.dart';
import 'package:fluttercode/view/components/header.dart';
import 'package:google_fonts/google_fonts.dart';

class AddUser extends StatefulWidget {
  AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

enum Avatar { one, two, three, four, five }

class _AddUserState extends State<AddUser> {
  Avatar? selectAvatar;
  bool value = false;
  String type = "";
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
          Header(),
          OpcMenu(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
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
                            type =
                                "https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038881-ac39566c-2fa5-4bcb-9c18-2df751b0abd2.png";
                            print(type);
                          });
                        },
                      )
                    ],
                  ),
                ),
                Center(
                  child: TextField(
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
                        value: this.value,
                        onChanged: (bool? value) {
                          setState(() {
                            this.value = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: GestureDetector(
                    child: Container(
                      child: Center(
                        child: Text(
                          'Adicionar',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 255, 255, 255),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      height: 70,
                      decoration: BoxDecoration(
                          color: TerciaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.of(context).size.width * 1,
                    ),
                    onTap: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OpcMenu extends StatelessWidget {
  const OpcMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: Center(
              child: Text(
                'Aluno',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: Center(
              child: Text(
                'Professor',
                style: GoogleFonts.montserrat(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtomCont extends StatelessWidget {
  ButtomCont(
      {super.key,
      required this.url,
      required this.onClick,
      required this.border});

  String url;
  final Function onClick;
  final Color border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: AvatarColor,
          border: Border.all(
            width: 2,
            color: border,
          ),
        ),
        child: Image.network(
          url,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        onClick();
      },
    );
  }
}

// https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038881-ac39566c-2fa5-4bcb-9c18-2df751b0abd2.png

// https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038927-28b4047a-fcf1-4ed1-943d-bcf35c8f30d9.png

// https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038909-572f9365-9a98-4818-bfbb-90ab9bb1604a.png

// https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038922-327de286-991a-4bce-afce-0f68ab971bb9.png

// https://github-production-user-asset-6210df.s3.amazonaws.com/78608382/248038869-545ff5ef-b3da-40c6-a910-bab595d0f0a8.png
