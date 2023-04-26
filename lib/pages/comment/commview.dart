import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myapp/classes/language.dart';
import 'package:myapp/classes/language_constants.dart';

import '../../main.dart';
class CommentView extends StatefulWidget {
  const CommentView({super.key});

  @override
  State<CommentView> createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  var nameitems= [];
  var commitems = [];
  var passworditems = [];
  
  
  Future getData() async{
    var url=Uri.parse("http://localhost:4000/comment");
    Response response= await get(url);

    String body =response.body;

    List<dynamic> list1=json.decode(body);
    List<dynamic> list2=json.decode(body);

     print(list1);
    //litems.clear();  //to not print the items in litems just print value in mySql colum(name ,phone,..)

    setState(() {
      for (int i=0; i<list1.length; i++){
        nameitems.add(list1[i]["name"]);
       commitems.add(list1[i]["comm"]);

      }
    });
    //print(imitems);//to print in my app
    print(list1);//to print my databace in run

  }
  void initState(){
    super.initState();
    getData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Color(0xff003b57),
        title: GestureDetector(
          child:Text(translation(context).homePage,style: TextStyle(color:Colors.white),),
          
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
      body:  Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Color(0xff06283D), Color(0xff06283D)])
          ),
          child:
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount:nameitems.length,
              itemBuilder: (context, int index){
                return Column(
            children: [
              

               CommentBox(nameitems[index], commitems[index]),
               
             
                 
           
            ]    
        );
              }
  
)
)
    );
  }
  



 
  Container CommentBox(String comname, String comtext){
    return Container(
                              margin: EdgeInsetsDirectional.all(20),
                              width: 350, height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(blurRadius: 9,
                                        spreadRadius: 7,
                                        color: Colors.grey.withOpacity(0.6),
                                        offset: Offset(5,5))
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20,bottom: 5,top: 8),
                                    child: Text(comname,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xff38b0d2),
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10,bottom: 20),
                                    child: Text(comtext,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ),
                                 
                                ],
                              ),
                              );
  
                            
  }
}