import 'package:get/get.dart';
import 'package:myapp/web_admin/data/data_resource/api_resource.dart';
import 'package:myapp/web_admin/data/models/form_new_passport_model.dart';
import 'package:myapp/web_admin/data/models/form_replacement_passport.dart';

class ReplacementPassportController extends GetxController {
  List<bool> _isOnHoverContainer = [];

  List<FormReplacementPassportModel> _formReplacementPassportModel = [];
  List<FormReplacementPassportModel> _formReplacementPassportModelCopy = [];
  searchByName(String number) {
    if (number.isEmpty) {
      _formReplacementPassportModelCopy = _formReplacementPassportModel;
      update();
      return;
    }
    _formReplacementPassportModelCopy = _formReplacementPassportModel
        .where((element) => element.nationaliIDNumber.startsWith(number))
        .toList();
    update();
  }

  @override
  void onInit() {
    initFormReplacementPassportModel();
    super.onInit();
  }

  setOnHoverContainer(int index, bool val) {
    _isOnHoverContainer[index] = val;
    update();
  }

  initFormReplacementPassportModel() async {
    _formReplacementPassportModel =
        await ApiResource.getFormReplacementPassport();
    _formReplacementPassportModelCopy = _formReplacementPassportModel;

    _isOnHoverContainer = _formReplacementPassportModel
        .map(
          (e) => false,
        )
        .toList();
    update();
  }

  List<bool> get getIsOnHoverContainer => _isOnHoverContainer;

  List<FormReplacementPassportModel> get getFormReplacementPassportModel =>
      _formReplacementPassportModelCopy;
}
