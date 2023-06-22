import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttercode/view/components/banner.dart';
import 'package:fluttercode/view/components/cardcontainer.dart';
import 'package:fluttercode/view/components/colors.dart';
import 'package:fluttercode/view/components/header.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Header(),
        InitialBanner(),
        CardContainer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: CardContainer(),
        )
      ],
    );
  }
}
