import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercode/view/components/colors.dart';
import 'package:fluttercode/view/screens/homepage.dart';

Future main() async {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: PrimaryColor, // cor da barra superior
    statusBarIconBrightness: Brightness.dark, // ícones da barra superior
    systemNavigationBarColor: SecoundColor, // cor da barra inferior
    systemNavigationBarIconBrightness:
        Brightness.dark, // ícones da barra inferior
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crudee',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const HomePage(),
    );
  }
}
