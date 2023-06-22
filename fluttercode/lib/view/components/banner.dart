import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

class InitialBanner extends StatelessWidget {
  const InitialBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 225,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ImageBanner(),
          ImageBanner(),
          ImageBanner(),
          ImageBanner(),
        ],
      ),
    );
  }
}

class ImageBanner extends StatelessWidget {
  const ImageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 217, 217, 217),
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.of(context).size.width * .8,
        child: Center(
          child: Text(
            'Text',
            style: GoogleFonts.montserrat(
              fontSize: 22,
              fontWeight: FontWeight.w400,
              color: Colors.black,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
