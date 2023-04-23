import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:myapp/classes/language.dart';
import 'package:myapp/classes/language_constants.dart';
import 'package:myapp/const/api.dart';
import 'package:myapp/main.dart';
import 'package:myapp/pages/home/view.dart';

import '../../dataa.dart';
const newstatus2="0";
var c_nameController = TextEditingController();
var c_phoneController = TextEditingController();
var c_passwordController = TextEditingController();

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  Future Add_data() async {
    var url = Uri.parse("http://localhost:4000/add");
    Map<String, String> headers = {"Content-type": "application/json"};

    String json = '{"u_name": "$nameup",'
        ' "u_phone": "$phoneup",'
        ' "u_password": "$passwordup",'
        ' "status": "0"}';
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff003b57),
        title:Text("hiiiiii"),
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
      backgroundColor: Color(0xff06283D),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (BuildContext context, int i) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Center(
                      child: Container(
                        width: 150,
                        height: 150,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: TextField(
                      controller: c_nameController,
                      maxLength: 50,
                      //textAlign: TextAlign.right,
                      cursorColor: Color(0xffffffff),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        counterStyle: TextStyle(
                          color: Color(0xffffffff),
                          fontSize: 12,
                        ),
                        fillColor: Colors.grey.withOpacity(0.3),
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        hintText: translation(context).name,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  // Directionality(
                  //textDirection: TextDirection.rtl,
                  //child:
                  TextField(
                    controller: c_phoneController,
                    maxLength: 16,
                    // textAlign: TextAlign.right,
                    cursorColor: Color(0xffffffff),
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      counterStyle: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 12,
                      ),
                      fillColor: Colors.grey.withOpacity(0.3),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: translation(context).phoneNumber,
                    ),
                  ),
                  //),

                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: c_passwordController,
                    maxLength: 11,
                    //textAlign: TextAlign.right,
                    cursorColor: Color(0xffffffff),
                    style: const TextStyle(color: Color(0xffffffff)),
                    decoration: InputDecoration(
                      counterStyle: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 12,
                      ),
                      fillColor: Colors.grey.withOpacity(0.3),
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      hintText: translation(context).password,
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50, // <-- match-parent
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Home(u_name: name,u_password: passwordup,u_phone: phone,)));
                        setState(() {
                          nameup = c_nameController.text;
                          phoneup = c_phoneController.text;
                          passwordup = c_passwordController.text;
                          Add_data();
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
                              borderRadius: BorderRadius.circular(
                            20,
                          ))),
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
