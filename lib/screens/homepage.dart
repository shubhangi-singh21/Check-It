import 'package:check_it/screens/taskpage.dart';
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
          ),
          color: Color(0XFFF6F6F6),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 32.0,
                      bottom: 32.0,
                    ),
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: 50.0,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        TaskCardWidget(
                          title: "Get Started!",
                          desc:
                              "Welcome to Check-It! Keep a track of all your daily task here. This is a default task that you can edit or delete to start using Check-It!",
                        ),
                        TaskCardWidget(),
                        TaskCardWidget(),
                        TaskCardWidget(),
                      ],
                    ),
                  )
                ],
              ),
              Positioned(
                bottom: 20.0,
                right: 0.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Taskpage(),
                        ));
                  },
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
