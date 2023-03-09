import 'package:flutter/material.dart';

import '../../resources/colors.dart';


class ButtonColor extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Function onPressed;
  final Color color;
  final double radius;
  final double blurRadius;
  final bool isRadius;

  const ButtonColor(
      { Key? key,
      required this.child,
      this.width = double.infinity,
      this.height = 50.0,
      required this.onPressed,
      this.color = const Color(0xff2A4A97),
      this.radius = 7.0,
      this.blurRadius = 1.0,
      this.isRadius = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              //color: isRadius ? Colors.grey[500] : Colors.transparent,
              blurRadius: blurRadius,
            ),
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(radius),
            //onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}

class ButtonBlackBroder extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Function onPressed;
  final double radius;
  final Color broderColor;
  final double broderWidth;
  final double blurRadius;

  const ButtonBlackBroder(
      {Key? key,
      required this.child,
      this.width = double.infinity,
      this.height = 50.0,
      required this.onPressed,
      required this.broderColor,
      this.radius = 7.0,
      this.broderWidth = 2,
      this.blurRadius = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(
              width: broderWidth, color: broderColor ?? Colors.black),
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              //color: Colors.grey[500],
              blurRadius: blurRadius,
            ),
          ]),
      child: Material(
        borderRadius: BorderRadius.circular(radius),
        color: ColorsHelper.blueColor(),
        child: InkWell(
            borderRadius: BorderRadius.circular(radius),
            //onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
