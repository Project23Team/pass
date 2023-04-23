import 'dart:convert';



import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/account/profile.dart';
import 'package:myapp/pages/home/carousel.dart';
import 'package:myapp/pages/registrationDone/view.dart';
import 'package:myapp/pages/replacementofvertionpassport/view.dart';
import 'package:myapp/pages/servicesDetails/view.dart';
import 'package:myapp/pages/signin/view.dart';
import 'package:myapp/pages/type_passport/newpassport/view.dart';
import 'package:myapp/pages/type_passport/replacementOfLosePassport/view.dart';

import '../../classes/language.dart';
import '../../classes/language_constants.dart';
import '../../main.dart';
import '../../router/route_constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../type_passport/renewal/view.dart';

final List<String> imgList = [
  ("images/pass.jpg"),
  ("images/pass2.jpg"),
  ("images/pass3.jpg"),
  ("images/p4.jpg"),
  ];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool chick = true;
  bool chick2 = true;
  bool chick3 = false;
  bool chick4 = false;
  var nameitems= [];
  var phoneitems = [];
  var passworditems = [];
  
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
for (int i=0; i<list1.length; i++){
        nameitems.add(list1[i]["u_name"]);
        phoneitems.add(list1[i]["u_phone"]);
        passworditems.add(list1[i]["u_password"]);

      }
      });
    }
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
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
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
              itemCount:2,
              itemBuilder: (BuildContext context, int index){
                return Column(
            children: [
              Column(
                children: [
                  CarouselWithDotsPage(imgList: imgList),
                
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 50, bottom: 10, left: 10, right: 10),
                    child:
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(translation(context).services, style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                        Container(
                          margin: EdgeInsetsDirectional.only(
                              top: 2, bottom: 10, start: 10, end: 10),
                          height: 60, width: 500,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(translation(context).passport,
                                style: TextStyle(fontSize: 30,
                                    color: Colors.white,)),
                          ),
                        ),
                         GestureDetector(
                  child: Icon( Icons.account_circle_outlined, ),
                  onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfilePage(u_name: nameitems[index],u_password: passworditems[index],u_phone: phoneitems[index],)));
                            },

                 ),
                      ],
                    ),
                  ),
                  //Services
                  Container(
                    height: 180,
                    child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          GestureDetector(
                            child: Container(
                              margin: EdgeInsetsDirectional.all(20),
                              width: 150, height: 120,
                              decoration: BoxDecoration(
                                  color: Color(0xff47B5FF),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(blurRadius: 9,
                                        spreadRadius: 10,
                                        color: Colors.grey.withOpacity(0.4),
                                        offset: Offset(5, 5))
                                  ]
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                                    child: Icon(
                                      Icons.location_city, size: 40, color: Colors
                                        .black,),
                                  ),
                                  Text(translation(context).directorateOfPassports,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  Text(translation(context).readMore, style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black45),
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ServicesDetails()));
                            },
                          ),
                          GestureDetector(
                            child:Container(
                              margin: EdgeInsetsDirectional.all(20),
                              width: 150, height: 120,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                                    child: Icon(
                                      Icons.support_agent, size: 40, color: Colors
                                        .black,),
                                  ),
                                  Text(translation(context).eServices,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  Text(translation(context).readMore, style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Eservices()));
                            },
                          ),
                          GestureDetector(
                            child:  Container(
                              margin: EdgeInsetsDirectional.all(20),
                              width: 150, height: 120,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                                    child: Icon(
                                      Icons.ballot, size: 40, color: Colors
                                        .black,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 5),
                                    child: Text(translation(context).passportAcquisitionForm,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ),
                                  Text(translation(context).readMore, style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>PassportAcquisitionForm()));
                            },
                          ),

                          GestureDetector(
                            child: Container(
                              margin: EdgeInsetsDirectional.all(20),
                              width: 150, height: 120,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                                    child: Icon(
                                      Icons.fingerprint, size: 40, color: Colors
                                        .black,),
                                  ),
                                  Text(translation(context).fingerprint,
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  Text(translation(context).readMore, style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87),
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Fingerprint()));
                            },
                          ),


                        ]
                    ),
                  ),
                  /*
                  Container(
                    height: 400,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Servecpost("images/courthouse.png",
                            translation(context).directorateOfPassports,
                            translation(context)
                                .theseServicesOfferThePossibilityOfRegistrationAllowsThePossibilityOfSubmittingAndManagingPassportTransactionsInAnEasyAndEfficientWay),
                        Servecpost("images/wifi-taxi.png",
                            translation(context).deliveryService,
                            translation(context)
                                .theseServicesOfferThePossibilityOfRegistrationAllowsThePossibilityOfSubmittingAndManagingPassportTransactionsInAnEasyAndEfficientWay),
                        Servecpost("images/politics.png",
                            translation(context).passportAcquisitionForm,
                            translation(context)
                                .inOrderToOvercomeTheDifficultiesAndFacilitateTheProceduresForObtainingThePassportForTheCitizen),
                        Servecpost("images/electronserv.png",
                            translation(context).eServices, translation(context)
                                .toFacilitateTheMomentumInTheDepartmentsAndToFacilitateDealing),
                      ],
                    ),
                  ),

                   */
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30, bottom: 20, left: 5, right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(translation(context).signUp, style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                        Text(translation(context).adSignUp,
                            style: TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    //height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => Newpassport()));
                                  },
                                  child: sign(translation(context).newPassport, translation(context).desAdd)),
                              SizedBox(width: 10,),
                             GestureDetector(
                               onTap: (){
                                 Navigator.of(context).push(MaterialPageRoute(
                                     builder: (context) => Renewpassport()));
                               },
                                child: sign(translation(context).renewal, translation(
                                    context).desAdd),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 5,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Lostpassport()));
                                },
                                child: sign(translation(context).replacementOfLost,
                                    translation(context).desAdd),
                              ),
                              SizedBox(width: 10,),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Vertionpassport()));
                                },
                                child: sign(translation(context).replacementVersion,
                                    translation(context).desAdd),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),

                  ),
                  SizedBox(height: 10,),
                  //----
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 3,
                    color: Color(0xff38b0d2),
                  ),
                  //General instructions
                  SizedBox(height: 25,),
                  Text(translation(context).generalInstructions,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                    child: Text(translation(context).basicInstructions,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                  ),
                  
                ],
              ),


              /*
              Padding(
                padding: const EdgeInsets.all(14),
                child: Container(
                  height: 350 ,width: MediaQuery.of(context).size.width,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 120,width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(blurRadius: 8,spreadRadius: 10 ,color: Colors.black26)
                          ],
                          image: DecorationImage(
                            image: AssetImage("images/courthouse.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(translation(context).directorateOfPassports,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
                      SizedBox(height: 5,),
                      GestureDetector(
                          child: Text(translation(context).readMore,style:TextStyle(fontSize: 17.0 ,fontWeight:FontWeight.bold,color: Colors.black) ,
                          ),
                          onTap: () {
                            setState(() {
                              chick = !chick;
                            });
                          }
                      ),
                            Visibility(
                              visible: chick,
                              child: Container(
                                  child :  Text(
                                    translation(context).theseServicesOfferThePossibilityOfRegistrationAllowsThePossibilityOfSubmittingAndManagingPassportTransactionsInAnEasyAndEfficientWay
                                    ,maxLines: 20, style: TextStyle(fontSize: 16.0 ,fontWeight:FontWeight.bold,color: Colors.black) , )
                              ),
                            ),
                    ],
                  ),
                ),
              ),

               */
/*
              Container(
                    color: Colors.black45,
                    width: MediaQuery.of(context).size.width, height: 400,
                    child: Row(
                      children: [
                        Servecpost("images/courthouse.png",translation(context).directorateOfPassports,translation(context).theseServicesOfferThePossibilityOfRegistrationAllowsThePossibilityOfSubmittingAndManagingPassportTransactionsInAnEasyAndEfficientWay),
                        SizedBox(width: 5,),
                        Servecpost("images/wifi-taxi.png",translation(context).deliveryService,translation(context).theseServicesOfferThePossibilityOfRegistrationAllowsThePossibilityOfSubmittingAndManagingPassportTransactionsInAnEasyAndEfficientWay),
                      ],
                    ),
                  ),

       SizedBox(height:1,),
       Container(
         color: Colors.orange,
         width: MediaQuery.of(context).size.width, height: 650,
         child: Row(
           children: [
             Servecpost("images/politics.png",translation(context).passportAcquisitionForm,translation(context).inOrderToOvercomeTheDifficultiesAndFacilitateTheProceduresForObtainingThePassportForTheCitizen),
            SizedBox(width: 5,),
             Servecpost("images/electronserv.png", translation(context).eServices, translation(context).toFacilitateTheMomentumInTheDepartmentsAndToFacilitateDealing)
           ],
         ),
       ),

               */

           
            ]    
        );
              }
  
)
)
    );
  }
  Container rowBox(String img){
    return
      Container(
        margin: EdgeInsetsDirectional.all(10),
        height: 180,
        width:350,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(img),
              fit: BoxFit.cover,
            )
        ),
      );
  }



  Padding Servecpost(String img,String sname ,String sdescription){
    return Padding(
      padding: const EdgeInsets.all(9),
      child: Container(
        height: 400 ,width:MediaQuery.of(context).size.width- 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff256D85),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(blurRadius: 8,spreadRadius: 10 ,color: Colors.black26)
                ],
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 15,),
            Text(sname,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black)),
            SizedBox(height: 5,),
            GestureDetector(
                child: Text(translation(context).readMore,style:TextStyle(fontSize: 17.0 ,fontWeight:FontWeight.bold,color: Colors.black) ,
                ),
                onTap: () {
                  setState(() {
                    chick2 = !chick2;
                  });
                }
            ),
            Visibility(
              visible: chick2,
              child: Container(
                  child :  Text(
                    sdescription
                    ,maxLines: 20, style: TextStyle(fontSize: 14.0 ,fontWeight:FontWeight.bold,color: Colors.black) , )
              ),
            ),
          ],
        ),
      ),
    );
  }
  Container sign(String paaatype,String desadd){
    return Container(
      height: 290,width:160,
      color: Color(0xff97D2EC),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100 ,width: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/h1.jpg"),
                  fit: BoxFit.cover,
                )
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(paaatype,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black)),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Text(desadd,style: TextStyle(fontSize: 15,color: Colors.black)),
          ),
          //SizedBox(height: 5,),
          Spacer(),
          Row( mainAxisAlignment: MainAxisAlignment.end,
            children: [
              /*
              SizedBox(
                width: 130 , height: 40,
                child: ElevatedButton(
                  onPressed: (){

                  },
                  child: Text(translation(context).checkIn,style: TextStyle(fontSize: 20,color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      primary: Color(0xff38b0d2),
                      // padding: EdgeInsets.symmetric(horizontal:200, vertical: 20),
                      side: BorderSide(
                        width: 0,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(15,)
                      )),
                ),
              ),

               */
              Container(
                width: 130,height: 40,
                decoration: BoxDecoration(
                  color: Color(0xff38b0d2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text(translation(context).checkIn,style: TextStyle(fontSize: 20,color: Colors.white),)),
              )
            ],
          ),
        ],
      ),
    );
  }
}