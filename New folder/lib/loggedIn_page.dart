import 'package:flutter/material.dart';

class LoggedInPage extends StatefulWidget {
  const LoggedInPage({Key? key}) : super(key: key);

  @override
  State<LoggedInPage> createState() => _LoggedInPageState();
}

class _LoggedInPageState extends State<LoggedInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Api"),
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
      ),

      body: Center(child: Text("Successfully Logged In",style: TextStyle(fontSize: 20),),),
    );
  }
}
