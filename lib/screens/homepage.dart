import 'package:check_it/database_helper.dart';
import 'package:check_it/icons.dart';
import 'package:check_it/screens/taskpage.dart';
import 'package:check_it/widgets/card_widget.dart';
import 'package:check_it/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  DatabaseHelper _dbHelper = DatabaseHelper();
  final String title = 'Check It';
  double barHeight = 100.0;
  bool upDirection = true, flag = true;
  ScrollController _controller;
  var statusbarHeight;

  @override
  void initState() {
    super.initState();
    statusbarHeight=100;
    _controller = ScrollController()
      ..addListener(() {
        upDirection =
            _controller.position.userScrollDirection == ScrollDirection.forward;

        // makes sure we don't call setState too much, but only when it is needed
        if (upDirection != flag)
          // setState(() {});
          flag = upDirection;
      });
  }

  @override
  Widget build(BuildContext context) {
    upDirection == true ? statusbarHeight = 25 : statusbarHeight = 50;
    return Scaffold(
      appBar: CustomAppBar(barHeight + statusbarHeight, title),
      body: SafeArea(
        child: Column(
          children: [
            // CustomAppBar(barHeight + statusbarHeight, title),
            Expanded(
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
                        SizedBox(
                          height: 20,
                        ),
                        // Container(
                        //   margin: EdgeInsets.only(
                        //     top: 32.0,
                        //     bottom: 32.0,
                        //   ),
                        //   child: SvgPicture.asset('assets/images/svg/notepad.svg'),
                        //   height: 50.0,
                        // ),
                        Expanded(
                          child: FutureBuilder(
                            initialData: [],
                            future: _dbHelper.getTasks(),
                            builder: (context, snapshot) {
                              return ScrollConfiguration(
                                behavior: NoGlowBehaviour(),
                                child: ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Taskpage(
                                              task: snapshot.data[index],
                                            ),
                                          ),
                                        ).then(
                                          (value) {
                                            setState(() {});
                                          },
                                        );
                                      },
                                      child: TaskCardWidget(
                                        title: snapshot.data[index].title,
                                        desc: snapshot.data[index].description,
                                        index: index,
                                        items: snapshot.data,
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      bottom: 25.0,
                      right: 0.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Taskpage(
                                      task: null,
                                    )),
                          ).then((value) {
                            setState(() {});
                          });
                        },
                        child: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Color(0XFF900C3F),
                                    Color(0XFFFC9D9D)
                                  ],
                                  begin: Alignment(0.0, -1.0),
                                  end: Alignment(0.0, 1.0)),
                              borderRadius: BorderRadius.circular(55.0),
                            ),
                            child: Icon(Icons.add,
                                size: 25.0, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
