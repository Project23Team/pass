import 'package:myapp/web_admin/entity/form_entity.dart';

class FormReplacementPassportModel extends FormEntity {
  FormReplacementPassportModel(
      {required super.idForm,
      super.image2 = "",
      required super.email,
      required super.placeOforder,
      required super.typeOfmarrige,
      required super.sex,
      required super.placeOfbirth,
      required super.firstname,
      required super.fathersName,
      required super.grandfatherName,
      required super.surname,
      required super.motherName,
      required super.motherFather,
      required super.provinceCountry,
      required super.maritalStatus,
      required super.profession,
      required super.dateOfbirth,
      required super.nationaliIDNumber,
      required super.address,
      required super.image,
      required super.phone});
  Map<String, dynamic> toMap() {
    return {
      'id': idForm.toString(),
      'L_email': email,
      'L_placeOforder': placeOforder,
      'L_typeOfmarrige': typeOfmarrige,
      'L_sex': sex,
      'L_placeOfbirth': placeOfbirth,
      'L_firstname': firstname,
      'L_fathersName': fathersName,
      'L_grandfatherName': grandfatherName,
      'L_surname': surname,
      'L_motherName': motherName,
      'L_motherFather': motherFather,
      'L_provinceCountry': provinceCountry,
      'L_maritalStatus': maritalStatus,
      'L_profession': profession,
      'L_dateOfbirth': dateOfbirth,
      'L_nationaliIDNumber': nationaliIDNumber,
      'L_address': address,
      'L_image': image,
      'L_phone': phone,
    };
  }

  factory FormReplacementPassportModel.fromMap(Map<String, dynamic> map) {
    return FormReplacementPassportModel(
      idForm: map['id']?.toInt() ?? 0,
      email: map['L_email'] ?? '',
      placeOforder: map['L_placeOforder'] ?? '',
      typeOfmarrige: map['L_typeOfmarrige'] ?? '',
      sex: map['L_sex'] ?? '',
      placeOfbirth: map['L_placeOfbirth'] ?? '',
      firstname: map['L_firstname'] ?? '',
      fathersName: map['L_fathersName'] ?? '',
      grandfatherName: map['L_grandfatherName'] ?? '',
      surname: map['L_surname'] ?? '',
      motherName: map['L_motherName'] ?? '',
      motherFather: map['L_motherFather'] ?? '',
      provinceCountry: map['L_provinceCountry'] ?? '',
      maritalStatus: map['L_maritalStatus'] ?? '',
      profession: map['L_profession'] ?? '',
      dateOfbirth: map['L_dateOfbirth'] ?? '',
      nationaliIDNumber: map['L_nationaliIDNumber'] ?? '',
      address: map['L_address'] ?? '',
      image: map['L_image'] ?? '',
      phone: map['L_phone']?.toString() ?? '',
    );
  }
}
