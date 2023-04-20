import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/const/app_colors.dart';
import 'package:myapp/web_admin/presentation/main_page/controller/main_page_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(builder: (controller) {
      return MouseRegion(
        onEnter: (event) => controller.setOnHover(true),
        onExit: (event) => controller.setOnHover(false),
        child: NavigationRail(
          extended: controller.getIsOnHover,
          elevation: 10,
          backgroundColor: AppColors.backgroundAppBar,
          leading: Container(
            height: 60,
            width: 60,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                image: DecorationImage(
                  image: AssetImage(
                    "images/logo.png",
                  ),
                  fit: BoxFit.cover,
                ),
                color: Colors.white),
          ),
          onDestinationSelected: (index) => controller.setCurrentIndex(index),
          selectedLabelTextStyle: TextStyle(color: Colors.white),
          unselectedLabelTextStyle: TextStyle(color: Colors.grey),
          destinations: [
            NavigationRailDestination(
              icon: Icon(
                Icons.home,
                color: controller.getCurrentIndex != 0
                    ? Colors.grey
                    : Colors.white,
              ),
              label: Text("New Passport"),
            ),
            NavigationRailDestination(
              icon: Icon(
                Icons.cabin,
                color: controller.getCurrentIndex != 1
                    ? Colors.grey
                    : Colors.white,
              ),
              label: Text("Renew Passport"),
            ),
            NavigationRailDestination(
              icon: Icon(
                Icons.safety_check,
                color: controller.getCurrentIndex != 2
                    ? Colors.grey
                    : Colors.white,
              ),
              label: Text("Replacement Passport"),
            ),
            NavigationRailDestination(
              icon: Icon(
                Icons.vaccines,
                color: controller.getCurrentIndex != 3
                    ? Colors.grey
                    : Colors.white,
              ),
              label: Text(
                "Repalcement Vertion Passport",
              ),
            ),
          ],
          selectedIndex: controller.getCurrentIndex,
        ),
      );
      ;
    });
  }
}
