import 'package:check_it/widgets.dart';
import 'package:flutter/cupertino.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 24.0,
                  bottom: 6.0,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image(
                          image: AssetImage('assets/images/back.png'),
                          height: 25.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: 12.0,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: "Enter your task here!",
                              border: InputBorder.none),
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF900C3F),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                    hintText: "Enter the description for the task",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 24.0,
                    )),
              ),
              TodoWidget(),
              TodoWidget(),
              TodoWidget(),
              TodoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
