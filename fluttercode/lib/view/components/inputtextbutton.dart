import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextButton extends StatelessWidget {
  final String title;
  final Function onClick;
  final Color? color;
  const InputTextButton(
      {Key? key, required this.title, required this.onClick, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: color ?? Color.fromRGBO(19, 68, 90, 1),
        minimumSize: const Size(double.maxFinite, 50),
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
        ),
      ),
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onClick();
      },
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 255, 255, 255),
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}