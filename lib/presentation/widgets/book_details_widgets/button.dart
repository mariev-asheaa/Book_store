import 'package:bookly_app/core/helper/styels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.backgroundcolor,
    required this.textcolor, this.borderRadius, required this.text,this.onPressed});
final Color backgroundcolor;
final Color textcolor;
final BorderRadius? borderRadius;
final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: SizedBox(
      height: 48,
      child: TextButton(
          onPressed:onPressed,

          style: TextButton.styleFrom(
            backgroundColor: backgroundcolor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius??BorderRadius.circular(16),
            )
          ),
          child: Text(text,style: Styles.textStyle18.copyWith(
            color: textcolor,
            fontWeight: FontWeight.w900,
          ),)),
    ));
  }
}
