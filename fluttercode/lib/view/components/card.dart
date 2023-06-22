import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttercode/view/screens/userscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class CardCont extends StatelessWidget {
  const CardCont({super.key});

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
              CircleAvatar(),
              Column(
                children: [
                  Text(
                    'Nome',
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Text(
                    'Idade',
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Icon(Icons.check)
            ],
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserScreen(),
            ),
          );
        },
      ),
    );
  }
}
