import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/const/app_string.dart';
import 'package:myapp/web_admin/data/data_resource/api_resource.dart';
import 'package:myapp/web_admin/data/models/form_new_passport_model.dart';
import 'package:myapp/web_admin/data/models/form_renew_passport_model.dart';
import 'package:myapp/web_admin/data/models/form_replacement_passport.dart';
import 'package:myapp/web_admin/data/models/form_replacement_vertion_passport.dart';
import 'package:myapp/web_admin/entity/form_entity.dart';
import 'package:myapp/web_admin/presentation/new_passport_page/controller/new_passport_controller.dart';
import 'package:myapp/web_admin/presentation/renew_passport_page/controller/renew_passport_contoller.dart';
import 'package:myapp/web_admin/presentation/replacement_passport_page/controller/replacment_passport_controller.dart';
import 'package:myapp/web_admin/presentation/replacement_vertion_passport_page/controller/replacement_vertion_passport_controler.dart';

class FormPassportController extends GetxController {
  FormEntity formEntity;
  FormPassportController({required this.formEntity});

  bool _isLoading = false;
  String _urlImage = "";
  String _urlImage2 = "";
  TextEditingController _firstname = TextEditingController();
  TextEditingController _fathersName = TextEditingController();
  TextEditingController _grandfatherName = TextEditingController();
  TextEditingController _surname = TextEditingController();
  TextEditingController _motherName = TextEditingController();
  TextEditingController _motherFather = TextEditingController();
  TextEditingController _typeOfmarrige = TextEditingController();
  TextEditingController _sex = TextEditingController();
  TextEditingController _dateOfbirth = TextEditingController();
  TextEditingController _provinceCountry = TextEditingController();
  TextEditingController _maritalStatus = TextEditingController();
  TextEditingController _profession = TextEditingController();
  TextEditingController _nationaliIDNumber = TextEditingController();
  TextEditingController _placeOforder = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();

  NewPassportController newPassportController = Get.find();
  ReNewPassportController reNewPassportController = Get.find();
  ReplacementPassportController replacementPassportController = Get.find();
  ReplacementVertionPassportController replacementVertionPassportController =
      Get.find();
  @override
  void onInit() {
    setVarablesForm();
    super.onInit();
  }

  setVarablesForm() {
    _firstname.text = formEntity.firstname;
    _fathersName.text = formEntity.fathersName;
    _grandfatherName.text = formEntity.grandfatherName;
    _surname.text = formEntity.surname;
    _motherName.text = formEntity.motherName;
    _motherFather.text = formEntity.motherFather;
    _typeOfmarrige.text = formEntity.typeOfmarrige;
    _sex.text = formEntity.sex;
    _dateOfbirth.text = formEntity.dateOfbirth;
    _provinceCountry.text = formEntity.provinceCountry;
    _maritalStatus.text = formEntity.maritalStatus;
    _profession.text = formEntity.profession;
    _nationaliIDNumber.text = formEntity.nationaliIDNumber;
    _placeOforder.text = formEntity.placeOforder;
    _address.text = formEntity.address;
    _phone.text = formEntity.phone.toString();
    _email.text = formEntity.email;
    _urlImage = formEntity.image;
    _urlImage2 = formEntity.image2 ?? '';

    update();
  }

  Future<String> updateForm(String typeStatus) async {
    if (typeStatus == AppString.newPassport) {
      return await _updateNewPassport();
    } else if (typeStatus == AppString.renewPassport) {
      return await _updateRenewPassport();
    } else if (typeStatus == AppString.replacementPassport) {
      return await _repalcementPassport();
    } else if (typeStatus == AppString.replacementVertionPassport) {
      return await _repalcementVertionPassport();
    }

    return "";
  }

  Future<String> deleteForm(String typeStatus) async {
    if (typeStatus == AppString.newPassport) {
      String massage = await ApiResource.deleteFormNewPassportByID(
          formEntity.idForm.toString());
      newPassportController.initFormNewPassportModel();
      return massage;
    } else if (typeStatus == AppString.renewPassport) {
      String massage = await ApiResource.deleteFormReNewPassportByID(
          formEntity.idForm.toString());
      reNewPassportController.initFormReNewPassportModel();
      return massage;
    } else if (typeStatus == AppString.replacementPassport) {
      String massage = await ApiResource.deleteFormReplacementPassportByID(
          formEntity.idForm.toString());
      replacementPassportController.initFormReplacementPassportModel();
      return massage;
    } else if (typeStatus == AppString.replacementVertionPassport) {
      String massage =
          await ApiResource.deleteFormReplacementVertionPassportByID(
              formEntity.idForm.toString());
      replacementVertionPassportController
          .initFormReplacemntVertionPassportModel();
      return massage;
    }

    return "";
  }

  Future<String> _updateNewPassport() async {
    FormNewPassportModel formNewPassportModel = FormNewPassportModel(
        idForm: formEntity.idForm,
        email: _email.text,
        placeOforder: _placeOforder.text,
        typeOfmarrige: _typeOfmarrige.text,
        sex: _sex.text,
        placeOfbirth: _placeOforder.text,
        firstname: firstname.text,
        fathersName: _fathersName.text,
        grandfatherName: _grandfatherName.text,
        surname: _surname.text,
        motherName: _motherName.text,
        motherFather: _motherFather.text,
        provinceCountry: _provinceCountry.text,
        maritalStatus: _maritalStatus.text,
        profession: _profession.text,
        dateOfbirth: _dateOfbirth.text,
        nationaliIDNumber: _nationaliIDNumber.text,
        address: _address.text,
        image: formEntity.image,
        image2: formEntity.image2,
        phone: "0");

    String massage =
        await ApiResource.updateFormNewPassport(formNewPassportModel);
    newPassportController.initFormNewPassportModel();
    return massage;
  }

  Future<String> _updateRenewPassport() async {
    FormReNewPassportModel formReNewPassportModel = FormReNewPassportModel(
        idForm: formEntity.idForm,
        email: _email.text,
        placeOforder: _placeOforder.text,
        typeOfmarrige: _typeOfmarrige.text,
        sex: _sex.text,
        placeOfbirth: _placeOforder.text,
        firstname: firstname.text,
        fathersName: _fathersName.text,
        grandfatherName: _grandfatherName.text,
        surname: _surname.text,
        motherName: _motherName.text,
        motherFather: _motherFather.text,
        provinceCountry: _provinceCountry.text,
        maritalStatus: _maritalStatus.text,
        profession: _profession.text,
        dateOfbirth: _dateOfbirth.text,
        nationaliIDNumber: _nationaliIDNumber.text,
        address: _address.text,
        image: formEntity.image,
        phone: "0");
    String massage =
        await ApiResource.updateFormReNewPassport(formReNewPassportModel);
    reNewPassportController.initFormReNewPassportModel();
    return massage;
  }

  Future<String> _repalcementPassport() async {
    FormReplacementPassportModel formReplacementPassportModel =
        FormReplacementPassportModel(
            idForm: formEntity.idForm,
            email: _email.text,
            placeOforder: _placeOforder.text,
            typeOfmarrige: _typeOfmarrige.text,
            sex: _sex.text,
            placeOfbirth: _placeOforder.text,
            firstname: firstname.text,
            fathersName: _fathersName.text,
            grandfatherName: _grandfatherName.text,
            surname: _surname.text,
            motherName: _motherName.text,
            motherFather: _motherFather.text,
            provinceCountry: _provinceCountry.text,
            maritalStatus: _maritalStatus.text,
            profession: _profession.text,
            dateOfbirth: _dateOfbirth.text,
            nationaliIDNumber: _nationaliIDNumber.text,
            address: _address.text,
            image: formEntity.image,
            phone: phone.text);

    String massage = await ApiResource.updateFormReplacementPassport(
        formReplacementPassportModel);
    replacementPassportController.initFormReplacementPassportModel();
    return massage;
  }

  Future<String> _repalcementVertionPassport() async {
    FormReplacemntVertionPassportModel formReplacemntVertionPassportModel =
        FormReplacemntVertionPassportModel(
            idForm: formEntity.idForm,
            email: _email.text,
            placeOforder: _placeOforder.text,
            typeOfmarrige: _typeOfmarrige.text,
            sex: _sex.text,
            placeOfbirth: _placeOforder.text,
            firstname: firstname.text,
            fathersName: _fathersName.text,
            grandfatherName: _grandfatherName.text,
            surname: _surname.text,
            motherName: _motherName.text,
            motherFather: _motherFather.text,
            provinceCountry: _provinceCountry.text,
            maritalStatus: _maritalStatus.text,
            profession: _profession.text,
            dateOfbirth: _dateOfbirth.text,
            nationaliIDNumber: _nationaliIDNumber.text,
            address: _address.text,
            image: formEntity.image,
            phone: phone.text);
    String massage = await ApiResource.updateFormReplacementVertionPassport(
        formReplacemntVertionPassportModel);
    replacementVertionPassportController
        .initFormReplacemntVertionPassportModel();
    return massage;
  }

  changeIsLoading(bool isload) {
    _isLoading = isload;
    update();
  }

  bool get getIsloading => _isLoading;
  String get getUrlImage => _urlImage;
  String get getUrlImage2 => _urlImage2;
  TextEditingController get firstname => _firstname;
  TextEditingController get fathersName => _fathersName;
  TextEditingController get grandfatherName => _grandfatherName;
  TextEditingController get surname => _surname;
  TextEditingController get motherName => _motherName;
  TextEditingController get motherFather => _motherFather;
  TextEditingController get typeOfmarrige => _typeOfmarrige;
  TextEditingController get sex => _sex;
  TextEditingController get dateOfbirth => _dateOfbirth;
  TextEditingController get provinceCountry => _provinceCountry;
  TextEditingController get maritalStatus => _maritalStatus;
  TextEditingController get profession => _profession;
  TextEditingController get nationaliIDNumber => _nationaliIDNumber;
  TextEditingController get placeOforder => _placeOforder;
  TextEditingController get address => _address;
  TextEditingController get phone => _phone;
  TextEditingController get email => _email;
}
