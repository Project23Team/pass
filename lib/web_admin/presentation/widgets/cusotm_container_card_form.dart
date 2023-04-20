import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:myapp/web_admin/entity/form_entity.dart';
import 'package:myapp/web_admin/presentation/main_page/controller/main_page_controller.dart';
import 'package:myapp/web_admin/presentation/new_passport_page/controller/new_passport_controller.dart';
import 'package:myapp/web_admin/presentation/widgets/text_responsive.dart';

class CustomContainerCardForm extends StatelessWidget {
  FormEntity formEntity;
  int index;
  void Function()? onTap;
  bool isHoverContainer;
  void Function(bool) onHover;
  CustomContainerCardForm({
    Key? key,
    required this.formEntity,
    required this.index,
    required this.onTap,
    required this.isHoverContainer,
    required this.onHover,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewPassportController>(builder: (controller) {
      return InkWell(
        onTap: onTap,
        onHover: onHover,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: isHoverContainer
                  ? Color.fromARGB(255, 240, 244, 255)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextResponsive(
                title: "First name: ${formEntity.firstname}",
              ),
              TextResponsive(
                title: "Father name: ${formEntity.fathersName}",
              ),
              TextResponsive(
                title: "Grand father name: ${formEntity.grandfatherName}",
              ),
            ],
          ),
        ),
      );
    });
  }
}
