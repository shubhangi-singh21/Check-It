import 'package:flutter/material.dart';

class Taskpage extends StatefulWidget {
  @override
  _TaskpageState createState() => _TaskpageState();
}

class _TaskpageState extends State<Taskpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage('assets/images/back.png'),
                    height: 25.0,
                  ),
                  Expanded(
                    child: TextField(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
