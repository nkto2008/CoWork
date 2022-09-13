import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomText extends StatelessWidget {
  final String text;
  double? size;
  Color? color;
  String? font;
  TextAlign? align;
  FontStyle? style;
  FontWeight? weight;

  CustomText({
    Key? key,
    required this.text,
    this.size,
    this.color,
    this.font,
    this.align,
    this.style,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      style: TextStyle(
          fontSize: size ?? 16,
          fontFamily: font ?? "Helvetica",
          fontStyle: style ?? FontStyle.normal,
          color: color ?? primaryColor,
          fontWeight: weight ?? FontWeight.normal),
    );
  }
}
