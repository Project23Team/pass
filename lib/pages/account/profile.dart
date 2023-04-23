import 'package:flutter/material.dart';
import 'package:myapp/classes/language_constants.dart';
import 'package:myapp/dataa.dart';
import 'package:myapp/main.dart';
import 'package:myapp/pages/home/view.dart';
import 'package:myapp/pages/tt.dart';

import '../../classes/language.dart';

class UserProfilePage extends StatelessWidget {
  final String u_name;
  final String u_phone;
  final String u_password;

  UserProfilePage({required this.u_name, required this.u_phone, required this.u_password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 158, 197),
      appBar: AppBar(elevation: 0,
        backgroundColor: Color(0xff003b57),
        title: GestureDetector(
          child:Text(translation(context).homePage,style: TextStyle(color:Colors.white),),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(u_name: name,u_password: password,u_phone: phone,)));
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Color(0xff003b57),
              child: Icon( Icons.account_circle_outlined,size: 35,color: Colors.white, ),
              radius: 50,
            ),
            SizedBox(height: 20),
            Text(
              translation(context).name+":   "+u_name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              translation(context).phoneNumber+":  "+u_phone,
              //'User ID: $userId',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              translation(context).password+":  "+u_password,
              //'User ID: $userId',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: GestureDetector(
                    child: Icon( Icons.edit, ),
                    onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>pro()));
                              },

                   ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
var nameitems= [];
  var phoneitems = [];
  var passworditems = [];
  /*
  Future getData() async{
    var url=Uri.parse("http://localhost:4000/log");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);
    List<dynamic> list2=json.decode(body);

    print(list1);
    nameitems.clear();  //to not print the items in litems just print value in mySql colum(name ,phone,..)
    //items.clear();
    for (int i=0; i<list1.length; i++){
     nameitems.add(list1[i]["u_name"]);
     phoneitems.add(list1[i]["u_phone"]);
     passworditems.add(list1[i]["u_password"]);
     

     setState(() {

      });
    }
    print(list1);//to print my databace in run

  }
  void initState(){
    super.initState();
    getData();
  }
  */
  */