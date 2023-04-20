import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:myapp/pages/home/view.dart';
import 'package:myapp/pages/login/view.dart';
import 'package:myapp/pages/registrationDone/view.dart';

import '../../classes/language.dart';
import '../../classes/language_constants.dart';
import '../../dataa.dart';
import '../../main.dart';
import 'package:image_picker/image_picker.dart';

var c_emailController=TextEditingController();
//var c_placeOforderController=TextEditingController();
//var c_typeOfmarrigeController=TextEditingController();

//var c_sexController=TextEditingController();
//var c_placeOfbirthController=TextEditingController();
var c_firstnameController=TextEditingController();


//
//
//var c_fathersNameController=TextEditingController();
//var c_grandfatherNameController=TextEditingController();
//var c_surnameController=TextEditingController();


//var c_motherNameController=TextEditingController();
//var c_motherFatherController=TextEditingController();
//var c_provinceCountryController=TextEditingController();


//var c_maritalStatusController=TextEditingController();
//var c_professionController=TextEditingController();
//var c_dateOfbirthController=TextEditingController();

//var c_nationaliIDNumberController=TextEditingController();
var c_addressController=TextEditingController();
//var c_imageController=TextEditingController();
//var c_image2Controller=TextEditingController();


class Ss extends StatefulWidget {
  const Ss({Key? key}) : super(key: key);

  @override
  State<Ss> createState() => _SsState();
}

class _SsState extends State<Ss> {

  Future Add_data() async {
    var url = Uri.parse("http://localhost:4000/ss");
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
        ' "n_image": "$image",'
        ' "n_image2": "$image2"}';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Color(0xff003b57),
        title: GestureDetector(
          child:Icon(Icons.arrow_back,color: Colors.white,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
            DropdownButton<Language>(
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
      backgroundColor: Color(0xff06283D),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child:
        Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount:1,
            itemBuilder: (BuildContext context, int i) {
              return
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Center(
                        child: Container(
                          width:150, height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
                              image: DecorationImage(
                                image: AssetImage("images/logo.png",),
                                fit: BoxFit.cover,

                              ),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 7,
                                    spreadRadius: 10,
                                    offset: Offset(0,7),
                                    color: Colors.black26
                                )
                              ],
                              color: Colors.white
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child:
                      TextField(
                        controller: c_emailController,
                        maxLength: 50,
                        //textAlign: TextAlign.right,
                        cursorColor:Color(0xffffffff),
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          counterStyle: TextStyle(color: Color(0xffffffff),fontSize: 12,),
                          fillColor: Colors.grey.withOpacity(0.3), filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          ),

                          hintText: translation(context).name,


                        ),
                      ),
                    ),

                    SizedBox(height: 20,),
                    // Directionality(
                    //textDirection: TextDirection.rtl,
                    //child:
                    TextField(
                      controller: c_addressController,
                      maxLength: 16,
                      // textAlign: TextAlign.right,
                      cursorColor: Color(0xffffffff),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        counterStyle: TextStyle(color: Color(0xffffffff),fontSize: 12,),
                        fillColor: Colors.grey.withOpacity(0.3), filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),

                        hintText: translation(context).phoneNumber,


                      ),
                    ),
                    //),

                    SizedBox(height: 20,),
                    TextField(
                      controller: c_firstnameController,
                      maxLength: 11,
                      //textAlign: TextAlign.right,
                      cursorColor: Color(0xffffffff),
                      style: const TextStyle(color: Color(0xffffffff)),
                      decoration: InputDecoration(
                        counterStyle: TextStyle(color: Color(0xffffffff),fontSize: 12,),
                        fillColor: Colors.grey.withOpacity(0.3), filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),

                        hintText: translation(context).password,


                      ),
                    ),



                    SizedBox(height: 40,),
                    SizedBox(
                      width:MediaQuery.of(context).size.width,
                      height: 50 ,// <-- match-parent
                      child:
                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Home()));
                          setState(() {
                            email=c_emailController.text;
                            address=c_addressController.text;
                            fathersName=c_firstnameController.text;
                            Add_data();
                          });
                        },
                        child: Text(translation(context).next,style: TextStyle(fontSize: 25,color:  Color(0xff47B5FF),),),
                        style: ElevatedButton.styleFrom(
                            elevation: 5,
                            primary: Color(0xffffffff),
                            // padding: EdgeInsets.symmetric(horizontal:200, vertical: 20),
                            side: BorderSide(
                              width: 0,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(20,)
                            )),

                      ),
                    )






                  ],
                );
            },
          ),

        ),
      ),
    );
  }
}


/*

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
        ' "	n_motherFather": "$motherFather",'
        ' "n_provinceCountry": "$provinceCountry",'
        ' "n_maritalStatus": "$maritalStatus",'
        ' "n_profession": "$profession",'
        ' "	n_dateOfbirth": "$dateOfbirth",'
        ' "n_nationaliIDNumber": "$nationaliIDNumber",'
        ' "n_address": "$address",'
        ' "n_image": "$image",'
        ' "n_image2": "$image2"}';
 */