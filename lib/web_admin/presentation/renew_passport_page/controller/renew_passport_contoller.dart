import 'package:get/get.dart';
import 'package:myapp/web_admin/data/data_resource/api_resource.dart';
import 'package:myapp/web_admin/data/models/form_new_passport_model.dart';
import 'package:myapp/web_admin/data/models/form_renew_passport_model.dart';

class ReNewPassportController extends GetxController {
  List<bool> _isOnHoverContainer = [];

  List<FormReNewPassportModel> _formReNewPassportModel = [];
  List<FormReNewPassportModel> _formReNewPassportModelCopy = [];
  searchByName(String number) {
    if (number.isEmpty) {
      _formReNewPassportModelCopy = _formReNewPassportModel;
      update();
      return;
    }
    _formReNewPassportModelCopy = _formReNewPassportModel
        .where((element) => element.nationaliIDNumber.startsWith(number))
        .toList();
    update();
  }

  @override
  void onInit() {
    initFormReNewPassportModel();
    super.onInit();
  }

  setOnHoverContainer(int index, bool val) {
    _isOnHoverContainer[index] = val;
    update();
  }

  initFormReNewPassportModel() async {
    _formReNewPassportModel = await ApiResource.getFormReNewPassport();
    _formReNewPassportModelCopy = _formReNewPassportModel;
    _isOnHoverContainer = _formReNewPassportModel
        .map(
          (e) => false,
        )
        .toList();
    update();
  }

  List<bool> get getIsOnHoverContainer => _isOnHoverContainer;

  List<FormReNewPassportModel> get getReFormNewPassportModel =>
      _formReNewPassportModelCopy;
}
