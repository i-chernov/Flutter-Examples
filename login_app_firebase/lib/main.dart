import 'package:flutter/material.dart';
import 'login_page.dart';

main(List<String> args) => runApp(new MyApp());

// Класс приложения
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new MaterialApp(
    title: "Flutter Login Demo",
    theme: new ThemeData(primarySwatch: Colors.blue),
    home: new LoginPage(),
  );
}
