import 'package:check_it/widgets.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 32.0,
          ),
          color: Color(0XFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 32.0,
                    ),
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: 50.0,
                    ),
                  ),
                  TaskCardWidget(
                    title: "Get Started!",
                    desc:
                        "Welcome to Check-It! Keep a track of all your daily task here. This is a default task that you can edit or delete to start using Check-It!",
                  ),
                  TaskCardWidget(),
                ],
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      color: Color(0XFF900C3F),
                      borderRadius: BorderRadius.circular(55.0),
                    ),
                    child: Image(
                      image: AssetImage("assets/images/plus.png"),
                      height: 40.0,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
