import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/web_admin/presentation/new_passport_page/view/new_passport_admin.dart';
import 'package:myapp/web_admin/presentation/renew_passport_page/view/renew_passport_admin.dart';
import 'package:myapp/web_admin/presentation/replacement_passport_page/view/replacement_passport_admin.dart';
import 'package:myapp/web_admin/presentation/replacement_vertion_passport_page/view/replacement_vertion_passport_admin.dart';

class MainPageController extends GetxController {
  int _currentIndex = 0;
  bool _isOnHover = false;

  setOnHover(bool val) {
    _isOnHover = val;
    update();
  }

  setCurrentIndex(int index) {
    _currentIndex = index;
    update();
  }

  Widget getPages() {
    return Stack(
        children: [
      NewPassportAdmin(),
      ReNewPassportAdmin(),
      ReplacementPassportAdmin(),
      ReplacementVertionPassportAdmin()
    ]
            .asMap()
            .map((index, screen) {
              return MapEntry(
                index,
                Offstage(
                  offstage: getCurrentIndex != index,
                  child: screen,
                ),
              );
            })
            .values
            .toList());
  }

  int get getCurrentIndex => _currentIndex;
  bool get getIsOnHover => _isOnHover;
}
