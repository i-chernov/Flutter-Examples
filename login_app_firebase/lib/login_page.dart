import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final formKey = new GlobalKey<FormState>();

  static String email = "";
  static String password = "";

  static bool validateAndSave() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save(); // Сохраняет значение каждой формы
      debugPrint("[validateAndSave] Form is valid.");
      return true;
    }
    debugPrint("[validateAndSave] Form is invalid");
    return false;
  }

  static void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        final UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        // debugPrint("[validateAnsSubmit] Signed in: ${user.user?.uid}");
      }
      catch (error) {
        debugPrint("[validateAnsSubmit] Error: $error");
      }
    }

  }

  Widget emailField = new TextFormField(
    decoration: new InputDecoration(labelText: "Email"),
    validator: (value) => value!.isEmpty ? "Email can't be empty" : null,
    onSaved: (value) => email = value!,
  );

  Widget passwordField = new TextFormField(
    decoration: new InputDecoration(labelText: "Password"),
    validator: (value) => value!.isEmpty ? "Password can't be empty" : null,
    onSaved: (value) => password = value!,
    obscureText: true,
  );

  Widget loginButton = new ElevatedButton(
    child: new Text("Login", style: new TextStyle(fontSize: 20.0)),
    onPressed: validateAndSubmit,
  );

  @override
  Widget build(BuildContext context) => new Scaffold(
    appBar: new AppBar(title: new Text("Login App Firebase")),
    body: new Container(
      padding: new EdgeInsets.all(16.0),
      child: new Form(
        key: formKey, // Проверяет состояние всех полей
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Расстягивает элементы по всей ширине
          children: <Widget>[
            emailField,
            passwordField,
            loginButton
          ]
        )
      )
    ),
  );
}
