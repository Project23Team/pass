import 'package:myapp/web_admin/entity/form_entity.dart';

class FormNewPassportModel extends FormEntity {
  FormNewPassportModel(
      {required super.image2,
      required super.idForm,
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
      'n_email': email,
      'n_placeOforder': placeOforder,
      'n_typeOfmarrige': typeOfmarrige,
      'n_sex': sex,
      'n_placeOfbirth': placeOfbirth,
      'n_firstname': firstname,
      'n_fathersName': fathersName,
      'n_grandfatherName': grandfatherName,
      'n_surname': surname,
      'n_motherName': motherName,
      'n_motherFather': motherFather,
      'n_provinceCountry': provinceCountry,
      'n_maritalStatus': maritalStatus,
      'n_profession': profession,
      'n_dateOfbirth': dateOfbirth,
      'n_nationaliIDNumber': nationaliIDNumber,
      'n_address': address,
      'n_image': image,
      'n_image2': phone,
    };
  }

  factory FormNewPassportModel.fromMap(Map<String, dynamic> map) {
    return FormNewPassportModel(
        idForm: map['id']?.toInt() ?? 0,
        email: map['n_email'] ?? '',
        placeOforder: map['n_placeOforder'] ?? '',
        typeOfmarrige: map['n_typeOfmarrige'] ?? '',
        sex: map['n_sex'] ?? '',
        placeOfbirth: map['n_placeOfbirth'] ?? '',
        firstname: map['n_firstname'] ?? '',
        fathersName: map['n_fathersName'] ?? '',
        grandfatherName: map['n_grandfatherName'] ?? '',
        surname: map['n_surname'] ?? '',
        motherName: map['n_motherName'] ?? '',
        motherFather: map['n_motherFather'] ?? '',
        provinceCountry: map['n_provinceCountry'] ?? '',
        maritalStatus: map['n_maritalStatus'] ?? '',
        profession: map['n_profession'] ?? '',
        dateOfbirth: map['n_dateOfbirth'] ?? '',
        nationaliIDNumber: map['n_nationaliIDNumber'] ?? '',
        address: map['n_address'] ?? '',
        image: map['n_image'] ?? '',
        image2: map['n_image2'] ?? '',
        phone: "0" //map['n_phone'] ?? '',
        );
  }
}
