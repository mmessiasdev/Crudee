import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttercode/view/components/colors.dart';
import 'package:fluttercode/view/screens/userscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCont extends StatelessWidget {
  CardCont({
    super.key,
    required this.name,
    required this.age,
    required this.avatar,
    required this.active,
    required this.categ,
    required this.id,
    required this.subText,
  });

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
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 217, 217, 217),
              borderRadius: BorderRadius.circular(15)),
          width: 130,
          height: 215,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: PrimaryColor,
                child: Image.network(
                  avatar,
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    age,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              active == true ? const Icon(Icons.check) : const Icon(Icons.warning)
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserScreen(
                subText: subText,
                categ: categ,
                name: name,
                age: age,
                active: active,
                avatar: avatar,
                id: id,
              ),
            ),
          );
        },
      ),
    );
  }
}
