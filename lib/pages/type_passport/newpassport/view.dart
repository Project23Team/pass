import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:myapp/classes/language.dart';
import 'package:myapp/classes/language_constants.dart';
import 'package:myapp/const/api.dart';
import 'package:myapp/dataa.dart';
import 'package:myapp/main.dart';
import 'package:myapp/pages/home/view.dart';
import 'package:myapp/pages/login/view.dart';
import 'package:myapp/pages/registrationDone/view.dart';

import 'package:image_picker/image_picker.dart';

import '../../../services/firebase_storage.dart';
import '../../qr.dart';
import 'package:http/http.dart' as http;

 const status="1";
var c_emailController = TextEditingController();
var c_placeOforderController = TextEditingController();
var c_typeOfmarrigeController = TextEditingController();

var c_sexController = TextEditingController();
var c_placeOfbirthController = TextEditingController();
var c_firstnameController = TextEditingController();

var c_fathersNameController = TextEditingController();
var c_grandfatherNameController = TextEditingController();
var c_surnameController = TextEditingController();

var c_motherNameController = TextEditingController();
var c_motherFatherController = TextEditingController();
var c_provinceCountryController = TextEditingController();

var c_maritalStatusController = TextEditingController();
var c_professionController = TextEditingController();
var c_dateOfbirthController = TextEditingController();

var c_nationaliIDNumberController = TextEditingController();
TextEditingController c_phoneController = TextEditingController();
var c_addressController = TextEditingController();
var c_imageController = TextEditingController();
var c_image2Controller = TextEditingController();

TextEditingController controller = TextEditingController();

class Newpassport extends StatefulWidget {
  const Newpassport({Key? key}) : super(key: key);

  @override
  State<Newpassport> createState() => _NewpassportState();
}

class _NewpassportState extends State<Newpassport> {
  String? urlImage1;
  String? urlImage2;
  PickedFile? pickerImage1;
  PickedFile? pickerImage2;
String status = "";
 Future<void> addData() async {
  // Upload images to Firebase Storage
  final urlImage1 = await FirebaseStorageFiles.uploadImage(pickerImage1);
  final urlImage2 = await FirebaseStorageFiles.uploadImage(pickerImage2);

  // Create JSON object with form data and image URLs
  final data = {
    "n_email": email,
    "n_placeOforder": placeOforder,
    "n_typeOfmarrige": typeOfmarrige,
    "n_sex": sex,
    "n_placeOfbirth": placeOfbirth,
    "n_firstname": firstname,
    "n_fathersName": fathersName,
    "n_grandfatherName": grandfatherName,
    "n_surname": surname,
    "n_motherName": motherName,
    "n_motherFather": motherFather,
    "n_provinceCountry": provinceCountry,
    "n_maritalStatus": maritalStatus,
    "n_profession": profession,
    "n_dateOfbirth": dateOfbirth,
    "n_nationaliIDNumber": nationaliIDNumber,
    "n_address": address,
    "n_image": urlImage1,
    "n_image2": urlImage2,
  };
  final jsonData = json.encode(data);

  // Send POST request to server
  final url = Uri.parse("http://localhost:4000/ss");
  final headers = {"Content-type": "application/json"};
  final response = await http.post(url, headers: headers, body: jsonData);

  // Check response status code
  final statusCode = response.statusCode;

  // If the response status code is OK (200),
  // update the state with the response message
  if (statusCode == 200) {
    final body = response.body;
    final decodedBody = json.decode(body);
    final res = decodedBody["code"];

    if (res == null) {
      final message = decodedBody["message"];
      setState(() {
        status = message;
      });
    }
  }
}

/*
//org
  Future Add_data() async {
    var url = Uri.parse("http://localhost:4000/ss");
    urlImage1 = await FirebaseStorageFiles.uploadImage(pickerImage1);
    urlImage2 = await FirebaseStorageFiles.uploadImage(pickerImage2);

    Map<String, String> headers = {"Content-type": "application/json"};

    String json = '{"n_email": "$email",'
        ' "n_placeOforder": "$placeOforder",'
        ' "n_typeOfmarrige": "$typeOfmarrige",'
        ' "n_sex": "$sex",'
        ' "n_placeOfbirth": "$placeOfbirth",'
        ' "n_firstname": "$firstname",'
        ' "n_fathersName": "$fathersName",'
        ' "n_grandfatherName": "$grandfatherName",'
        ' "n_surname": "$surname",'
        ' "n_motherName": "$motherName",'
        ' "n_motherFather": "$motherFather",'
        ' "n_provinceCountry": "$provinceCountry",'
        ' "n_maritalStatus": "$maritalStatus",'
        ' "n_profession": "$profession",'
        ' "n_dateOfbirth": "$dateOfbirth",'
        ' "n_nationaliIDNumber": "$nationaliIDNumber",'
        ' "n_address": "$address",'
        ' "n_image": "$urlImage1",'
        ' "n_image2": "$urlImage2"}';
    // make POST request
    Response response = await post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body1 = response.body;
    var data = jsonDecode(body1);
    print(data);
    var res = data["code"];

    if (res == null) {}
  }
  */
  


Future Add_data2() async {
    var url = Uri.parse("http://localhost:4000/update");
    urlImage1 = await FirebaseStorageFiles.uploadImage(pickerImage1);
    urlImage2 = await FirebaseStorageFiles.uploadImage(pickerImage2);

    Map<String, String> headers = {"Content-type": "application/json"};

    String json = '{"status": "$status"}';
    // make POST request
    Response response = await put(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    String body1 = response.body;
    var data = jsonDecode(body1);
    print(data);
    var res = data["code"];

    if (res == null) {}
  }


Future updateData( String status) async {
  var url = Uri.parse('http://localhost:4000/status');
  var response = await http.put(url, body: {
    'status': status,
  });
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
  } else {
    throw Exception('Failed to update data');
  }
}





  String dropdownValue = "";
  String dropdownValue2 = '';
  String dropdownValueS = '';
  String dropdownValuepd = '';
  String dropdownValuepdIraq = '';
  String dropdownValuepdMaritalStatus = '';
  late String place;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  io.File? imageFile1;
  io.File? imageFile2;
  final imagepicked = ImagePicker();
  uploadImage1() async {
    var pickedimage = await imagepicked.getImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      setState(() {
        pickerImage1 = pickedimage;
        imageFile1 = io.File(pickedimage.path);
      });
    } else {}
  }

  uploadImage2() async {
    var pickedimage = await imagepicked.getImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      setState(() {
        pickerImage2 = pickedimage;
        imageFile2 = io.File(pickedimage.path);
      });
    } else {}
  }

  void _showSuccessDialog() {
    showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff003b57),
        title: GestureDetector(
          child: Text(
            translation(context).homePage,
            style: TextStyle(color: Colors.white),
          ),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Home()));
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff003b57),
      body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (BuildContext context, int i) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    translation(context).newPassport,
                    style: TextStyle(color: Color(0xff47B5FF), fontSize: 17),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 80, left: 10, right: 10, bottom: 150),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 650, //or MediaQuery.of(context).size.width+300
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                            )),
                        child: Form(
                          key: _key,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int i) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                 keyboardType: TextInputType.emailAddress,
                                        controller: c_emailController,
                                        validator: (c_emailController) {
                                          if (c_emailController != null &&
                                              c_emailController.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText: translation(context).email,
                                          hintText:
                                              translation(context).emailHint,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                translation(context)
                                                    .placeOfOrder,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black
                                                          .withOpacity(0.3)),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: DropdownButton<String>(
                                                  underline: Container(),
                                                  value: dropdownValue,
                                                  // Step 4.
                                                  items: <String>[
                                                    "",
                                                    translation(context).inside,
                                                    translation(context).outside
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      enabled: value != "",
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      onTap: () {},
                                                    );
                                                  }).toList(),
                                                  // Step 5.
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValue = newValue!;
                                                      placeOforder = newValue;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                translation(context)
                                                    .typeOfPassport,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black
                                                          .withOpacity(0.3)),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: DropdownButton<String>(
                                                  underline: Container(),
                                                  value: dropdownValue2,
                                                  // Step 4.
                                                  items: <String>[
                                                    '',
                                                    translation(context)
                                                        .normalTravel,
                                                    translation(context)
                                                        .diplomat,
                                                    translation(context)
                                                        .maritime,
                                                    translation(context)
                                                        .special,
                                                    translation(context).service
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      enabled: value != "",
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  // Step 5.
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValue2 =
                                                          newValue!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                translation(context).sex,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black
                                                          .withOpacity(0.3)),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: DropdownButton<String>(
                                                  underline: Container(),
                                                  value: dropdownValueS,
                                                  // Step 4.
                                                  items: <String>[
                                                    '',
                                                    translation(context).male,
                                                    translation(context).female
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      enabled: value != "",
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  // Step 5.
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValueS =
                                                          newValue!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                translation(context)
                                                    .placeOfBirth,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black
                                                          .withOpacity(0.3)),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: DropdownButton<String>(
                                                  underline: Container(),
                                                  value: dropdownValuepd,
                                                  // Step 4.
                                                  items: <String>[
                                                    '',
                                                    translation(context).inside,
                                                    translation(context).outside
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      enabled: value != '',
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  // Step 5.
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValuepd =
                                                          newValue!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: c_firstnameController,
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText:
                                              translation(context).firstName,
                                          hintText:
                                              translation(context).firstName,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: c_fathersNameController,
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText:
                                              translation(context).fathersName,
                                          hintText:
                                              translation(context).fathersName,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: c_grandfatherNameController,
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText: translation(context)
                                              .grandfathersName,
                                          hintText: translation(context)
                                              .grandfathersName,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: c_surnameController,
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText:
                                              translation(context).surname,
                                          hintText:
                                              translation(context).surname,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: c_motherNameController,
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText:
                                              translation(context).mothersName,
                                          hintText:
                                              translation(context).mothersName,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: c_motherFatherController,
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText:
                                              translation(context).motherFather,
                                          hintText:
                                              translation(context).motherFather,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                translation(context)
                                                    .provinceCountry,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black
                                                          .withOpacity(0.3)),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: DropdownButton<String>(
                                                  underline: Container(),
                                                  value: dropdownValuepdIraq,
                                                  // Step 4.
                                                  items: <String>[
                                                    '',
                                                    translation(context)
                                                        .baghdad,
                                                    translation(context)
                                                        .anbarProvince,
                                                    translation(context)
                                                        .babylon,
                                                    translation(context)
                                                        .alBasrah,
                                                    translation(context).dhiQar,
                                                    translation(context)
                                                        .diyalaProvince,
                                                    translation(context).duhok,
                                                    translation(context).erbil,
                                                    translation(context)
                                                        .karbala,
                                                    translation(context).kirkuk,
                                                    translation(context).maysan,
                                                    translation(context)
                                                        .alMuthanna,
                                                    translation(context).najaf,
                                                    translation(context)
                                                        .nineveh,
                                                    translation(context)
                                                        .qadisiyah,
                                                    translation(context).salads,
                                                    translation(context)
                                                        .sulaymaniyah,
                                                    translation(context).wasit,
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      enabled: value != "",
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  // Step 5.
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValuepdIraq =
                                                          newValue!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                translation(context)
                                                    .maritalStatus,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.black
                                                          .withOpacity(0.3)),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: DropdownButton<String>(
                                                  underline: Container(),
                                                  value:
                                                      dropdownValuepdMaritalStatus,
                                                  // Step 4.
                                                  items: <String>[
                                                    '',
                                                    translation(context).single,
                                                    translation(context)
                                                        .married,
                                                  ].map<
                                                          DropdownMenuItem<
                                                              String>>(
                                                      (String value) {
                                                    return DropdownMenuItem<
                                                        String>(
                                                      enabled: value != "",
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                    );
                                                  }).toList(),
                                                  // Step 5.
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      dropdownValuepdMaritalStatus =
                                                          newValue!;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: c_professionController,
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText:
                                              translation(context).profession,
                                          hintText:
                                              translation(context).profession,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: c_dateOfbirthController,
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText:
                                              translation(context).dateOfBirth,
                                          hintText:
                                              translation(context).dateOfBirth,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller:
                                            c_nationaliIDNumberController,
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText: translation(context)
                                              .nationalIDNumber,
                                          hintText: translation(context)
                                              .nationalIDNumber,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: c_phoneController,
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText:
                                              translation(context).phoneNumber,
                                          hintText:
                                              translation(context).phoneNumber,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        controller: c_addressController,
                                        validator: (val) {
                                          if (val != null && val.isEmpty) {
                                            return translation(context)
                                                .requiredField;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                            Radius.circular(15),
                                          )),
                                          labelText:
                                              translation(context).address,
                                          hintText:
                                              translation(context).address,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: MaterialButton(
                                            onPressed: () {
                                              uploadImage1();
                                            },
                                            height: 50,
                                            shape: const StadiumBorder(),
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            child: Center(
                                              child: Text(
                                                translation(context).placePhoto,
                                                style: const TextStyle(
                                                    color: Color(0xff47B5FF),
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: MaterialButton(
                                            onPressed: () {
                                              uploadImage2();
                                            },
                                            height: 50,
                                            shape: const StadiumBorder(),
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            child: Center(
                                              child: Text(
                                                translation(context).placePhoto,
                                                style: const TextStyle(
                                                    color: Color(0xff47B5FF),
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        child: Center(
                                          child: imageFile1 == null
                                              ? Text("image 1")
                                              : Image.file(imageFile1!),
                                        ),
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Container(
                                        height: 100,
                                        width: 100,
                                        child: Center(
                                          child: imageFile2 == null
                                              ? Text("image")
                                              : Image.file(imageFile2!),
                                        ),
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(50),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return Home();
                                          }));
                                          setState(() {
                                            email = c_emailController.text;
                                            firstname =
                                                c_firstnameController.text;
                                            fathersName =
                                                c_fathersNameController.text;
                                            grandfatherName =
                                                c_grandfatherNameController
                                                    .text;
                                            surname = c_surnameController.text;
                                            motherName =
                                                c_motherNameController.text;
                                            motherFather =
                                                c_motherFatherController.text;
                                            provinceCountry =
                                                c_provinceCountryController
                                                    .text;
                                            // maritalStatus=c_maritalStatusController.text;
                                            profession =
                                                c_professionController.text;
                                            dateOfbirth =
                                                c_dateOfbirthController.text;
                                            nationaliIDNumber =
                                                c_nationaliIDNumberController
                                                    .text;
                                            //    phone=c_phoneController.text;
                                            address = c_addressController.text;
                                            placeOforder = dropdownValue;
                                            typeOfmarrige = dropdownValue2;
                                            sex = dropdownValueS;
                                            placeOfbirth = dropdownValuepd;
                                            provinceCountry =
                                                dropdownValuepdIraq;
                                            maritalStatus =
                                                dropdownValuepdMaritalStatus;
                                               status;

                                            //place=placeOforder;
                                            //updateData( status);
                                           addData();
                                          });
                                        },
                                        child: Text(
                                          translation(context).next,
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Color(0xff47B5FF),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            elevation: 5,
                                            primary: Color(0xffffffff),
                                            // padding: EdgeInsets.symmetric(horizontal:200, vertical: 20),
                                            side: BorderSide(
                                              width: 0,
                                            ),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                              20,
                                            ))),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ),
                      Positioned(
                        top: -80,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: Container(
                            width: 100,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(75),
                                image: DecorationImage(
                                  image: AssetImage(
                                    "images/logo.png",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 7,
                                      spreadRadius: 10,
                                      offset: Offset(0, 7),
                                      color: Colors.black26)
                                ],
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
