import 'package:flutter/material.dart';

class TextResponsive extends StatelessWidget {
  String title;
  TextResponsive({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Text(
      title,
    ));
  }
}
