import 'package:myapp/web_admin/entity/form_entity.dart';

class FormReNewPassportModel extends FormEntity {
  FormReNewPassportModel(
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
      'rn_email': email,
      'rn_placeOforder': placeOforder,
      'rn_typeOfmarrige': typeOfmarrige,
      'rn_sex': sex,
      'rn_placeOfbirth': placeOfbirth,
      'rn_firstname': firstname,
      'rn_fathersName': fathersName,
      'rn_grandfatherName': grandfatherName,
      'rn_surname': surname,
      'rn_motherName': motherName,
      'rn_motherFather': motherFather,
      'rn_provinceCountry': provinceCountry,
      'rn_maritalStatus': maritalStatus,
      'rn_profession': profession,
      'rn_dateOfbirth': dateOfbirth,
      'rn_nationaliIDNumber': nationaliIDNumber,
      'rn_address': address,
      'rn_image': image,
      'rn_phone': phone,
    };
  }

  factory FormReNewPassportModel.fromMap(Map<String, dynamic> map) {
    return FormReNewPassportModel(
      idForm: map['id']?.toInt() ?? 0,
      email: map['rn_email'] ?? '',
      placeOforder: map['rn_placeOforder'] ?? '',
      typeOfmarrige: map['rn_typeOfmarrige'] ?? '',
      sex: map['rn_sex'] ?? '',
      placeOfbirth: map['rn_placeOfbirth'] ?? '',
      firstname: map['rn_firstname'] ?? '',
      fathersName: map['rn_fathersName'] ?? '',
      grandfatherName: map['rn_grandfatherName'] ?? '',
      surname: map['rn_surname'] ?? '',
      motherName: map['rn_motherName'] ?? '',
      motherFather: map['rn_motherFather'] ?? '',
      provinceCountry: map['rn_provinceCountry'] ?? '',
      maritalStatus: map['rn_maritalStatus'] ?? '',
      profession: map['rn_profession'] ?? '',
      dateOfbirth: map['rn_dateOfbirth'] ?? '',
      nationaliIDNumber: map['rn_nationaliIDNumber'] ?? '',
      address: map['rn_address'] ?? '',
      image: map['rn_image'] ?? '',
      phone: map['rn_phone']?.toString() ?? '',
    );
  }
}
