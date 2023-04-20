import 'package:get/get.dart';
import 'package:myapp/web_admin/data/data_resource/api_resource.dart';
import 'package:myapp/web_admin/data/models/form_new_passport_model.dart';
import 'package:myapp/web_admin/data/models/form_replacement_passport.dart';
import 'package:myapp/web_admin/data/models/form_replacement_vertion_passport.dart';

class ReplacementVertionPassportController extends GetxController {
  List<bool> _isOnHoverContainer = [];

  List<FormReplacemntVertionPassportModel> _formReplacemntVertionPassportModel =
      [];
  List<FormReplacemntVertionPassportModel>
      _formReplacemntVertionPassportModelCopy = [];
  searchByName(String number) {
    if (number.isEmpty) {
      _formReplacemntVertionPassportModelCopy =
          _formReplacemntVertionPassportModel;
      update();
      return;
    }
    _formReplacemntVertionPassportModelCopy =
        _formReplacemntVertionPassportModel
            .where((element) => element.nationaliIDNumber.startsWith(number))
            .toList();
    update();
  }

  @override
  void onInit() {
    initFormReplacemntVertionPassportModel();
    super.onInit();
  }

  setOnHoverContainer(int index, bool val) {
    _isOnHoverContainer[index] = val;
    update();
  }

  initFormReplacemntVertionPassportModel() async {
    _formReplacemntVertionPassportModel =
        await ApiResource.getFormReplacementVertionPassport();
    _formReplacemntVertionPassportModelCopy =
        _formReplacemntVertionPassportModel;

    _isOnHoverContainer = _formReplacemntVertionPassportModel
        .map(
          (e) => false,
        )
        .toList();
    update();
  }

  List<bool> get getIsOnHoverContainer => _isOnHoverContainer;

  List<FormReplacemntVertionPassportModel>
      get getformReplacemntVertionPassportModel =>
          _formReplacemntVertionPassportModelCopy;
}
