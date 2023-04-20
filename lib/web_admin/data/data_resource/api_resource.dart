import 'dart:convert';

import 'package:myapp/const/api.dart';
import 'package:myapp/web_admin/data/models/form_new_passport_model.dart';
import 'package:myapp/web_admin/data/models/form_renew_passport_model.dart';
import 'package:myapp/web_admin/data/models/form_replacement_passport.dart';
import 'package:myapp/web_admin/data/models/form_replacement_vertion_passport.dart';
import 'package:http/http.dart' as http;

class ApiResource {
  static Future<List<FormNewPassportModel>> getFormNewPassport() async {
    try {
      var url = Uri.parse(AppApis.getNewPassportUrl);
      var response = await http.get(url);
      List<dynamic> data = jsonDecode(response.body);
      List<FormNewPassportModel> formNewPassport = data.map((e) {
        return FormNewPassportModel.fromMap(e);
      }).toList();
      return formNewPassport;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<FormReNewPassportModel>> getFormReNewPassport() async {
    try {
      var url = Uri.parse(AppApis.getRenewPassportUrl);
      var response = await http.get(url);
      List<dynamic> data = jsonDecode(response.body);
      List<FormReNewPassportModel> form = data.map((e) {
        return FormReNewPassportModel.fromMap(e);
      }).toList();
      return form;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<FormReplacementPassportModel>>
      getFormReplacementPassport() async {
    try {
      var url = Uri.parse(AppApis.getReplacementPassportUrl);
      var response = await http.get(url);
      List<dynamic> data = jsonDecode(response.body);
      print(data);
      List<FormReplacementPassportModel> form = data.map((e) {
        return FormReplacementPassportModel.fromMap(e);
      }).toList();
      return form;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<List<FormReplacemntVertionPassportModel>>
      getFormReplacementVertionPassport() async {
    try {
      var url = Uri.parse(AppApis.getReplacementVertionPassportUrl);
      var response = await http.get(url);
      List<dynamic> data = jsonDecode(response.body);
      print(data);
      List<FormReplacemntVertionPassportModel> form = data.map((e) {
        return FormReplacemntVertionPassportModel.fromMap(e);
      }).toList();
      return form;
    } catch (e) {
      print(e);
      return [];
    }
  }

  static Future<String> updateFormNewPassport(
      FormNewPassportModel formNewPassportModel) async {
    try {
      var url = Uri.parse(AppApis.updateNewPassportUrl);
      var response = await http.put(url, body: formNewPassportModel.toMap());
      Map<String, dynamic> data = jsonDecode(response.body);
      return data["massage"];
    } catch (e) {
      print("%" * 23 + e.toString());
      return "bad";
    }
  }

  static Future<String> updateFormReNewPassport(
      FormReNewPassportModel formReNewPassportModel) async {
    try {
      var url = Uri.parse(AppApis.updateRenewPassportUrl);
      var response = await http.put(url, body: formReNewPassportModel.toMap());
      Map<String, dynamic> data = jsonDecode(response.body);
      return data["massage"];
    } catch (e) {
      print(e);
      return "bad";
    }
  }

  static Future<String> updateFormReplacementPassport(
      FormReplacementPassportModel formReplacementPassportModel) async {
    try {
      var url = Uri.parse(AppApis.updateReplacementPassportUrl);
      var response =
          await http.put(url, body: formReplacementPassportModel.toMap());
      Map<String, dynamic> data = jsonDecode(response.body);

      return data["massage"];
    } catch (e) {
      print(e);
      return "bad";
    }
  }

  static Future<String> updateFormReplacementVertionPassport(
      FormReplacemntVertionPassportModel
          formReplacemntVertionPassportModel) async {
    try {
      var url = Uri.parse(AppApis.updateReplacementVertionPassportUrl);
      var response =
          await http.put(url, body: formReplacemntVertionPassportModel.toMap());
      Map<String, dynamic> data = jsonDecode(response.body);

      return data["massage"];
    } catch (e) {
      print(e);
      return "bad";
    }
  }

  static Future<String> deleteFormNewPassportByID(String id) async {
    try {
      var url = Uri.parse(AppApis.deleteNewPassportUrl);
      var response = await http.delete(url, body: {"id": id});
      Map<String, dynamic> data = jsonDecode(response.body);
      return data["massage"];
    } catch (e) {
      print(e);
      return "bad";
    }
  }

  static Future<String> deleteFormReNewPassportByID(String id) async {
    try {
      var url = Uri.parse(AppApis.deleteRenewPassportUrl);
      var response = await http.delete(url, body: {"id": id});
      Map<String, dynamic> data = jsonDecode(response.body);
      return data["massage"];
    } catch (e) {
      print(e);
      return "bad";
    }
  }

  static Future<String> deleteFormReplacementVertionPassportByID(
      String id) async {
    try {
      var url = Uri.parse(AppApis.deleteReplacementVertionPassportUrl);
      var response = await http.delete(url, body: {"id": id});
      Map<String, dynamic> data = jsonDecode(response.body);
      return data["massage"];
    } catch (e) {
      print(e);
      return "bad";
    }
  }

  static Future<String> deleteFormReplacementPassportByID(String id) async {
    try {
      print("30" * 30 + id);
      var url = Uri.parse(AppApis.deleteReplacementPassportUrl);
      var response = await http.delete(url, body: {"id": id});
      Map<String, dynamic> data = jsonDecode(response.body);
      print(data["massage"]);
      return data["massage"];
    } catch (e) {
      print(e);
      return "bad";
    }
  }
}
