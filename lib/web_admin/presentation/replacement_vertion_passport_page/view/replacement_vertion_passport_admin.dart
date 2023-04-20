import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/const/app_string.dart';
import 'package:myapp/web_admin/data/data_resource/api_resource.dart';
import 'package:myapp/web_admin/data/models/form_new_passport_model.dart';
import 'package:myapp/web_admin/entity/form_entity.dart';
import 'package:myapp/web_admin/presentation/new_passport_page/controller/new_passport_controller.dart';
import 'package:myapp/web_admin/presentation/replacement_vertion_passport_page/controller/replacement_vertion_passport_controler.dart';
import 'package:myapp/web_admin/presentation/form/form.dart';
import 'package:myapp/web_admin/presentation/widgets/cusotm_container_card_form.dart';
import 'package:myapp/web_admin/presentation/widgets/custom_text_form.dart';

import '../../../../const/app_colors.dart';

class ReplacementVertionPassportAdmin extends StatelessWidget {
  ReplacementVertionPassportAdmin({super.key});
  ReplacementVertionPassportController controller =
      Get.put(ReplacementVertionPassportController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        appBar: AppBar(
          backgroundColor: AppColors.backgroundAppBar,
          elevation: 0,
          title: const Text(
            "Replacement vertion Passport",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            CustomTextForm(
                onChanged: (number) {
                  controller.searchByName(number);
                },
                hintText: "Search for user",
                prefixIcon: const Icon(Icons.search)),
            SizedBox(
              width: Get.width * 0.05,
            )
          ],
        ),
        body: GetBuilder<ReplacementVertionPassportController>(
            init: ReplacementVertionPassportController(),
            builder: (controller) {
              return ListView.builder(
                  itemCount:
                      controller.getformReplacemntVertionPassportModel.length,
                  itemBuilder: (contex, index) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: CustomContainerCardForm(
                        onTap: () {
                          Get.to(() => FormPassport(
                              formEntity: controller
                                  .getformReplacemntVertionPassportModel[index],
                              typeStatus:
                                  AppString.replacementVertionPassport));
                        },
                        onHover: (value) =>
                            controller.setOnHoverContainer(index, value),
                        isHoverContainer:
                            controller.getIsOnHoverContainer[index],
                        index: index,
                        formEntity: controller
                            .getformReplacemntVertionPassportModel[index],
                      ),
                    );
                  });
            }));
  }
}
