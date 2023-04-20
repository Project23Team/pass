import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/const/app_colors.dart';
import 'package:myapp/const/app_string.dart';
import 'package:myapp/web_admin/data/data_resource/api_resource.dart';
import 'package:myapp/web_admin/data/models/form_new_passport_model.dart';
import 'package:myapp/web_admin/entity/form_entity.dart';
import 'package:myapp/web_admin/presentation/new_passport_page/controller/new_passport_controller.dart';
import 'package:myapp/web_admin/presentation/form/form.dart';
import 'package:myapp/web_admin/presentation/widgets/cusotm_container_card_form.dart';
import 'package:myapp/web_admin/presentation/widgets/custom_text_form.dart';

class NewPassportAdmin extends StatelessWidget {
  NewPassportAdmin({super.key});
  NewPassportController newPassportController =
      Get.put(NewPassportController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundAppBar,
          elevation: 0,
          title: Text(
            "New Passport",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            CustomTextForm(
                onChanged: (number) {
                  newPassportController.searchByName(number);
                },
                hintText: "Search for user",
                prefixIcon: const Icon(Icons.search)),
            SizedBox(
              width: Get.width * 0.05,
            )
          ],
        ),
        body: GetBuilder<NewPassportController>(builder: (controller) {
          return ListView.builder(
              itemCount: controller.getFormNewPassportModel.length,
              itemBuilder: (contex, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomContainerCardForm(
                    onTap: () {
                      Get.to(() => FormPassport(
                          formEntity: controller.getFormNewPassportModel[index],
                          typeStatus: AppString.newPassport));
                    },
                    onHover: (value) =>
                        controller.setOnHoverContainer(index, value),
                    isHoverContainer: controller.getIsOnHoverContainer[index],
                    index: index,
                    formEntity: controller.getFormNewPassportModel[index],
                  ),
                );
              });
        }));
  }
}
