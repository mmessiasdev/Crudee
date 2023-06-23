import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

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
            height: 70,
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
    ;
  }
}
