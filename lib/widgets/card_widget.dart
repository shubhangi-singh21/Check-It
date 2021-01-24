import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';

class TaskCardWidget extends StatelessWidget {
  final String title;
  final String desc;
  final int index;
  final List<dynamic> items;

  TaskCardWidget({this.title, this.desc, this.items, this.index});

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
        direction: AnimatedCardDirection.left,
        initDelay: Duration(milliseconds: 50), //Delay to initial animation
        duration: Duration(milliseconds: 500), //Initial animation duration
        onRemove: () => items.removeAt(index),
        curve: Curves.easeInOutCubic,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 32.0,
          horizontal: 24.0,
        ),
        margin: EdgeInsets.only(
          bottom: 20.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title ?? "Unnamed Task",
              style: TextStyle(
                color: Color(0XFF900C3F),
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                desc ?? "No description available :(",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color(0XFF900C3F),
                  height: 1.5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
  final String text;
  final bool isDone;

  TodoWidget({this.text, @required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 6.0,
      ),
      child: Row(
        children: [
          Container(
              width: 20.0,
              height: 20.0,
              margin: EdgeInsets.only(
                right: 12.0,
              ),
              decoration: BoxDecoration(
                color: isDone ? Color(0XFFFC9D9D) : Colors.transparent,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Icon(
                Icons.check_circle_outline,
                size: 20.0,
              )),
          Flexible(
            child: Text(
              text ?? "Add more tasks!",
              style: TextStyle(
                  color: isDone ? Color(0XFF900C3F) : Color(0XFF868290),
                  fontSize: 16.0,
                  fontWeight: isDone ? FontWeight.bold : FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
