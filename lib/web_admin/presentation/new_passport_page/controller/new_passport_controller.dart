import 'package:get/get.dart';
import 'package:myapp/web_admin/data/data_resource/api_resource.dart';
import 'package:myapp/web_admin/data/models/form_new_passport_model.dart';

class NewPassportController extends GetxController {
  List<bool> _isOnHoverContainer = [];
  List<FormNewPassportModel> _formNewPassportModel = [];
  List<FormNewPassportModel> _formNewPassportModelCopy = [];

  searchByName(String number) {
    if (number.isEmpty) {
      _formNewPassportModelCopy = _formNewPassportModel;
      update();
      return;
    }
    _formNewPassportModelCopy = _formNewPassportModel
        .where((element) => element.nationaliIDNumber.startsWith(number))
        .toList();
    update();
  }

  @override
  void onInit() {
    initFormNewPassportModel();
    super.onInit();
  }

  setOnHoverContainer(int index, bool val) {
    _isOnHoverContainer[index] = val;
    update();
  }

  initFormNewPassportModel() async {
    _formNewPassportModel = await ApiResource.getFormNewPassport();
    _formNewPassportModelCopy = _formNewPassportModel;
    _isOnHoverContainer = _formNewPassportModel
        .map(
          (e) => false,
        )
        .toList();

    update();
  }

  List<bool> get getIsOnHoverContainer => _isOnHoverContainer;

  List<FormNewPassportModel> get getFormNewPassportModel =>
      _formNewPassportModelCopy;
}
