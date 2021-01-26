import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  double height = 100;
  String barTitle;
  CustomAppBar(this.height, this.barTitle);
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      child: SafeArea(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          alignment: Alignment.center,
          height: this.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0XFF900C3F),
                    Color(0XFFFC9D9D)
                  ],
                  begin: Alignment(0.0, -1.0),
                  end: Alignment(0.0, 1.0)),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100))),
          child: ClipRRect(
            // borderRadius: BorderRadius.vertical(bottom: Radius.circular(100)),
            child: Container(
              color: Colors.transparent,
              child: Text(
                this.barTitle,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    shadows: [
                      BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.pinkAccent.withOpacity(.5),
                          blurRadius: 3.0)
                    ]),
              ),
            ),
          ),
        ),
      ),
      preferredSize: preferredSize,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(this.height);
}
