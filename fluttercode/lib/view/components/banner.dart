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
          ImageBanner(
            urlBanner:
                "https://github.com/mmessiasdev/ImagesDeploy/assets/78608382/fee51e5b-fc06-4dbd-80dd-2cc371042b6e",
          ),
          ImageBanner(
            urlBanner:
                "https://github.com/mmessiasdev/ImagesDeploy/assets/78608382/fe16a8f0-f9df-4904-bdc2-a5b0e09581a4",
          ),
          ImageBanner(
            urlBanner:
                "https://github.com/mmessiasdev/ImagesDeploy/assets/78608382/4b16b356-71cf-472e-8d42-45db32e4c478",
          ),
        ],
      ),
    );
  }
}

class ImageBanner extends StatelessWidget {
  ImageBanner({super.key, required this.urlBanner});
  String urlBanner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.network(
          urlBanner,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
