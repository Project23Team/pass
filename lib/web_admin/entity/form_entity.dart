import 'dart:convert';

class FormEntity {
  int idForm;
  String email;
  String placeOforder;
  String typeOfmarrige;
  String sex;
  String placeOfbirth;
  String firstname;
  String fathersName;
  String grandfatherName;
  String surname;
  String motherName;
  String motherFather;
  String provinceCountry;
  String maritalStatus;
  String profession;
  String dateOfbirth;
  String nationaliIDNumber;
  String address;
  String image;
  String? image2;
  String phone;
  FormEntity(
      {required this.idForm,
      required this.email,
      required this.placeOforder,
      required this.typeOfmarrige,
      required this.sex,
      required this.placeOfbirth,
      required this.firstname,
      required this.fathersName,
      required this.grandfatherName,
      required this.surname,
      required this.motherName,
      required this.motherFather,
      required this.provinceCountry,
      required this.maritalStatus,
      required this.profession,
      required this.dateOfbirth,
      required this.nationaliIDNumber,
      required this.address,
      required this.image,
      required this.phone,
      required this.image2});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FormEntity &&
        other.idForm == idForm &&
        other.email == email &&
        other.placeOforder == placeOforder &&
        other.typeOfmarrige == typeOfmarrige &&
        other.sex == sex &&
        other.placeOfbirth == placeOfbirth &&
        other.firstname == firstname &&
        other.fathersName == fathersName &&
        other.grandfatherName == grandfatherName &&
        other.surname == surname &&
        other.motherName == motherName &&
        other.motherFather == motherFather &&
        other.provinceCountry == provinceCountry &&
        other.maritalStatus == maritalStatus &&
        other.profession == profession &&
        other.dateOfbirth == dateOfbirth &&
        other.nationaliIDNumber == nationaliIDNumber &&
        other.address == address &&
        other.image == image &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return idForm.hashCode ^
        email.hashCode ^
        placeOforder.hashCode ^
        typeOfmarrige.hashCode ^
        sex.hashCode ^
        placeOfbirth.hashCode ^
        firstname.hashCode ^
        fathersName.hashCode ^
        grandfatherName.hashCode ^
        surname.hashCode ^
        motherName.hashCode ^
        motherFather.hashCode ^
        provinceCountry.hashCode ^
        maritalStatus.hashCode ^
        profession.hashCode ^
        dateOfbirth.hashCode ^
        nationaliIDNumber.hashCode ^
        address.hashCode ^
        image.hashCode ^
        phone.hashCode;
  }
}
