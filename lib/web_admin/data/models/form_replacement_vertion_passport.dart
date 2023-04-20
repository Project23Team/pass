import 'package:myapp/web_admin/entity/form_entity.dart';

class FormReplacemntVertionPassportModel extends FormEntity {
  FormReplacemntVertionPassportModel(
      {required super.idForm,
      required super.email,
      super.image2 = "",
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
      'v_email': email,
      'v_placeOforder': placeOforder,
      'v_typeOfmarrige': typeOfmarrige,
      'v_sex': sex,
      'v_placeOfbirth': placeOfbirth,
      'v_firstname': firstname,
      'v_fathersName': fathersName,
      'v_grandfatherName': grandfatherName,
      'v_surname': surname,
      'v_motherName': motherName,
      'v_motherFather': motherFather,
      'v_provinceCountry': provinceCountry,
      'v_maritalStatus': maritalStatus,
      'v_profession': profession,
      'v_dateOfbirth': dateOfbirth,
      'v_nationaliIDNumber': nationaliIDNumber,
      'v_address': address,
      'v_image': image,
      'v_phone': phone,
    };
  }

  factory FormReplacemntVertionPassportModel.fromMap(Map<String, dynamic> map) {
    return FormReplacemntVertionPassportModel(
      idForm: map['id']?.toInt() ?? 0,
      email: map['v_email'] ?? '',
      placeOforder: map['v_placeOforder'] ?? '',
      typeOfmarrige: map['v_typeOfmarrige'] ?? '',
      sex: map['v_sex'] ?? '',
      placeOfbirth: map['v_placeOfbirth'] ?? '',
      firstname: map['v_firstname'] ?? '',
      fathersName: map['v_fathersName'] ?? '',
      grandfatherName: map['v_grandfatherName'] ?? '',
      surname: map['v_surname'] ?? '',
      motherName: map['v_motherName'] ?? '',
      motherFather: map['v_motherFather'] ?? '',
      provinceCountry: map['v_provinceCountry'] ?? '',
      maritalStatus: map['v_maritalStatus'] ?? '',
      profession: map['v_profession'] ?? '',
      dateOfbirth: map['v_dateOfbirth'] ?? '',
      nationaliIDNumber: map['v_nationaliIDNumber'] ?? '',
      address: map['v_address'] ?? '',
      image: map['v_image'] ?? '',
      phone: map['v_phone']?.toString() ?? '',
    );
  }
}
