import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/const/app_colors.dart';

import 'package:myapp/web_admin/entity/form_entity.dart';
import 'package:myapp/web_admin/presentation/form/controller/form_controller.dart';
import 'package:myapp/web_admin/presentation/widgets/custom_text_form.dart';

class FormPassport extends StatelessWidget {
  FormEntity formEntity;
  String typeStatus;
  FormPassport({
    Key? key,
    required this.formEntity,
    required this.typeStatus,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundAppBar,
        elevation: 0,
        title: const Text(
          "Form Passport",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<FormPassportController>(
            init: FormPassportController(formEntity: formEntity),
            builder: (controller) {
              if (controller.getIsloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Center(
                  child: SizedBox(
                    width: Get.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.backgroundAppBar,
                                        blurRadius: 8)
                                  ],
                                  color: Colors.white),
                              child: Image.network(
                                controller.getUrlImage,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.backgroundAppBar,
                                        blurRadius: 8)
                                  ],
                                  color: Colors.white),
                              child: Image.network(
                                controller.getUrlImage2,
                              ),
                            ),
                          ],
                        ),
                        // Container(
                        //   width: Get.width,
                        //   alignment: Alignment.center,
                        //   child: Container(
                        //     height: 200,
                        //     width: 200,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(75),
                        //         image: const DecorationImage(
                        //           image: AssetImage(
                        //             "images/logo.png",
                        //           ),
                        //           fit: BoxFit.cover,
                        //         ),
                        //         boxShadow: [
                        //           BoxShadow(
                        //               color: AppColors.backgroundAppBar,
                        //               blurRadius: 8)
                        //         ],
                        //         color: Colors.white),
                        //   ),
                        // ),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.firstname,
                          hintText: "First name",
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.fathersName,
                          hintText: "Father name",
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.grandfatherName,
                          hintText: "Grand father name",
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.surname,
                          hintText: "Surname",
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.motherName,
                          hintText: "Mother name",
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.motherFather,
                          hintText: "Mother's father name",
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.typeOfmarrige,
                          hintText: "Type of marrige",
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.sex,
                          hintText: "Sex",
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.dateOfbirth,
                          hintText: "Birthday",
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.provinceCountry,
                          hintText: "Province Country",
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.maritalStatus,
                          hintText: "Marital Status",
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.profession,
                          hintText: "Profession",
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.nationaliIDNumber,
                          hintText: "Nationali ID number",
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.placeOforder,
                          hintText: "Place of order",
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.address,
                          hintText: "Address",
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.phone,
                          hintText: "phone",
                        ),
                        SizedBox(
                          width: Get.width * 0.02,
                        ),
                        CustomTextForm(
                          width: Get.width * 4,
                          fillColor: Colors.white,
                          colorBorder: Colors.black,
                          controller: controller.email,
                          hintText: "email",
                        ),

                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: SizedBox(
                                width: Get.width * 0.2,
                                height: Get.height * 0.08,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      controller.changeIsLoading(true);
                                      String massage = await controller
                                          .deleteForm(typeStatus);
                                      controller.changeIsLoading(false);
                                      if (massage == "good") {
                                        Get.back();
                                      } else {
                                        Get.snackbar("Error", massage);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red),
                                    child: const Text("DELETE")),
                              ),
                            ),
                            Center(
                              child: SizedBox(
                                width: Get.width * 0.2,
                                height: Get.height * 0.08,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.backgroundAppBar),
                                    onPressed: () async {
                                      controller.changeIsLoading(true);
                                      String massage = await controller
                                          .updateForm(typeStatus);
                                      controller.changeIsLoading(false);
                                      if (massage == "good") {
                                        Get.back();
                                      } else {
                                        Get.snackbar("Error", massage);
                                      }
                                    },
                                    child: const Text("UPDATE")),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
