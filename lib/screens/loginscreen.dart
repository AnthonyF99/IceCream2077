import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xffB81736), Color(0xff281537)])),
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 22),
            child: Text('Hello\nSign in!',
                style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          )),
      Padding(
        padding: const EdgeInsets.only(top: 200.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              TextField(),
              TextField(),
            ],
          ),
        ),
      )
    ]));
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
