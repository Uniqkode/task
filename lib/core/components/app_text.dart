import 'package:flutter/material.dart';
import 'package:task/core/constant/colors.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  double size;
  final String text;
  Color? color;
  final FontWeight weight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final TextOverflow? overflow;
  final int? maxLines;
  final List<Shadow>? shadow;
  final FontStyle? fontStyle;

  AppText({
    super.key,
    this.size = 16,
    required this.text,
    this.color,
    this.textAlign = TextAlign.start,
    this.weight = FontWeight.w500,
    this.textDecoration = TextDecoration.none,
    this.overflow,
    this.maxLines,
    this.shadow,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
          color: color ?? AppColor.greyText,
          fontSize: size,
          overflow: overflow,
          fontWeight: weight,
          fontFamily: 'Proxima-Nova',
          decoration: textDecoration,
          fontStyle: fontStyle,
          shadows: shadow),
    );
  }
}
