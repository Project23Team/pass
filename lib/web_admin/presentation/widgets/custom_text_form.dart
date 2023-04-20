import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextForm extends StatelessWidget {
  String hintText;
  Widget? prefixIcon;
  TextEditingController? controller;
  Color? fillColor;
  Color? colorBorder;
  double? width;
  void Function(String)? onChanged;
  CustomTextForm(
      {Key? key,
      this.onChanged,
      required this.hintText,
      this.width,
      this.prefixIcon,
      this.controller,
      this.fillColor,
      this.colorBorder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? Get.width * 0.3,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: hintText,
          hintText: hintText,
          contentPadding: const EdgeInsets.all(10),
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: fillColor ?? const Color(0xfff5fbf2),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 0.5),
            borderRadius: BorderRadius.circular(7),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: colorBorder ?? Colors.white, width: 0.5),
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
  }
}
