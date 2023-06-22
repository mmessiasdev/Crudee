import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttercode/view/components/card.dart';
import 'package:fluttercode/view/screens/userslist.dart';
import 'package:google_fonts/google_fonts.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({super.key});

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
                  'Alunos',
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
                        builder: (context) => UsersList(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 240,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CardCont(),
                CardCont(),
                CardCont(),
                CardCont(),
                CardCont(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
