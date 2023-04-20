import 'package:flutter/material.dart';
import 'package:myapp/pages/home/view.dart';

import '../../classes/language.dart';
import '../../classes/language_constants.dart';
import '../../main.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
class ServicesDetails extends StatefulWidget {
  const ServicesDetails({Key? key}) : super(key: key);

  @override
  State<ServicesDetails> createState() => _ServicesDetailsState();
}

class _ServicesDetailsState extends State<ServicesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Color(0xff003b57),
        //title: Text(translation(context).homePage),
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
      backgroundColor: Color(0xff003b57),
      body:ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80,left: 10,right: 10,bottom: 40),
                child:
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 140,),
                          Text(translation(context).directorateOfPassports,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xff003b57)),),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(translation(context)
                                .theseServicesOfferThePossibilityOfRegistrationAllowsThePossibilityOfSubmittingAndManagingPassportTransactionsInAnEasyAndEfficientWay,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -50,
                      left: 0,
                      right: 0,
                      child:Center(
                        child: Container(
                          width:150, height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
                              /*
                              image: DecorationImage(
                                image: AssetImage("images/logo.png",),
                                fit: BoxFit.cover,
                              ),

                               */
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
                          child:  Center(
                            child: Icon(
                              Icons.location_city, size: 60, color: Colors
                                .black,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              )
            ],
          ),
        ],
      ),
    );
  }

}

class Eservices extends StatefulWidget {
  const Eservices({Key? key}) : super(key: key);

  @override
  State<Eservices> createState() => _EservicesState();
}

class _EservicesState extends State<Eservices> {
 TextEditingController email = TextEditingController();
TextEditingController subject = TextEditingController();
TextEditingController body = TextEditingController();
    final _key = GlobalKey<FormState>();
sendEMAIL(String subject,String body,String recipientemail)async{
 final Email email = Email(
  body: body,
  subject:  subject,
  recipients: [recipientemail],
  
  //cc: ['cc@example.com'],
  //bcc: ['bcc@example.com'],
  //attachmentPaths: ['/path/to/attachment.zip'],
  isHTML: false,
  );
 //await FlutterEmailSender.send(email);

}
Future<void> sendEmail(String subject, String body, String recipientEmail) async {
  final String smtpServerAddress = 'smtp.gmail.com';
  final String smtpUserName = 'your_gmail_username';
  final String smtpPassword = 'your_gmail_password';
  final int smtpPort = 587;
  final bool isSMTPSecure = true;

  final Email email = Email(
    body: body,
    subject: subject,
    recipients: [recipientEmail],
    isHTML: false,
  );

  try {
    await FlutterEmailSender.send(email,
    /*
        smtpServerAddress: smtpServerAddress,
        smtpUserName: smtpUserName,
        smtpPassword: smtpPassword,
        smtpPort: smtpPort,
        isSMTPSecure: isSMTPSecure
        */
        );
    print("Email sent successfully to $recipientEmail");
  } catch (error) {
    print("Error sending email: $error");
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Color(0xff003b57),
        //title: Text(translation(context).homePage),
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
      backgroundColor: Color(0xff003b57),
      body:ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80,left: 10,right: 10,bottom: 40),
                child:
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 140,),
                          Text(translation(context).eServices,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xff003b57)),),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(translation(context)
                                .toFacilitateTheMomentumInTheDepartmentsAndToFacilitateDealing,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                          ),
                          Form(
                          key: _key,
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int i) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: TextFormField(
                                        controller: email,
                                        validator: (email) {
                                          if (email != null &&
                                              email.isEmpty) {
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
                                          labelText: translation(context).name,
                                          hintText:
                                              translation(context).nameHint,
                                          //suffixStyle: TextStyle(fontSize: 40)
                                        ),
                                      ),
                                    ),
                                   
                                        Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: TextFormField(
                                        controller: subject,
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
                                    Container(
                                            margin: EdgeInsets.all(8.0),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 50,right: 50,top: 12,bottom: 12),
                                        child: TextFormField(
                                           maxLines: 10,
                                          controller: body,
                                          validator: (val) {
                                            if (val != null && val.isEmpty) {
                                              return translation(context)
                                                  .requiredField;
                                            }
                                            return null;
                                          },
                                          
                                          decoration: InputDecoration(
                                            border: const OutlineInputBorder(
                                                //borderRadius: BorderRadius.all(
                                             // Radius.circular(30),
                                            
                                           //)
                                            ),
                                            labelText:
                                                translation(context).address,
                                            hintText:
                                                translation(context).address,
                                            //suffixStyle: TextStyle(fontSize: 40)
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                       ],
                                    ),
                                     Padding(
                                      padding: const EdgeInsets.only(left: 50,right: 50,top: 12,bottom: 12),
                                      child: ElevatedButton(
                                        onPressed: ()  {

                                            _key.currentState!.save();
                                            print('${email.text}');
                                            sendEmail(subject.text, body.text,email.text);
                                            //name = c_nameController.text;

                                            //phone= c_phoneController.text;
                                            //comm = c_commController.text;
                                            //    phone=c_phoneController.text;
                                           
                                            //place=placeOforder;
                                            
                                           
                                          
                                        },
                                        child: Text("post it !",
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: Color(0xffffffff),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            elevation: 3,
                                            primary: Color(0xff47B5FF),
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
                      
                        ],
                      ),
                    ),
                    Positioned(
                      top: -50,
                      left: 0,
                      right: 0,
                      child:Center(
                        child: Container(
                          width:150, height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
                              /*
                              image: DecorationImage(
                                image: AssetImage("images/logo.png",),
                                fit: BoxFit.cover,
                              ),

                               */
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
                          child:  Center(
                            child: Icon(
                              Icons.support_agent, size: 60, color: Colors
                                .black,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              )
            ],
          ),
        ],
      ),
    );
  }
}

class PassportAcquisitionForm extends StatefulWidget {
  const PassportAcquisitionForm({Key? key}) : super(key: key);

  @override
  State<PassportAcquisitionForm> createState() => _PassportAcquisitionFormState();
}

class _PassportAcquisitionFormState extends State<PassportAcquisitionForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Color(0xff003b57),
        //title: Text(translation(context).homePage),
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
      backgroundColor: Color(0xff003b57),
      body:ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80,left: 10,right: 10,bottom: 40),
                child:
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 140,),
                          Text(translation(context).passportAcquisitionForm,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xff003b57)),),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(translation(context)
                                .inOrderToOvercomeTheDifficultiesAndFacilitateTheProceduresForObtainingThePassportForTheCitizen,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -50,
                      left: 0,
                      right: 0,
                      child:Center(
                        child: Container(
                          width:150, height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
                              /*
                              image: DecorationImage(
                                image: AssetImage("images/logo.png",),
                                fit: BoxFit.cover,
                              ),

                               */
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
                          child:  Center(
                            child: Icon(
                              Icons.ballot, size: 60, color: Colors
                                .black,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              )
            ],
          ),
        ],
      ),
    );
  }
}

class Fingerprint extends StatefulWidget {
  const Fingerprint({Key? key}) : super(key: key);

  @override
  State<Fingerprint> createState() => _FingerprintState();
}

class _FingerprintState extends State<Fingerprint> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(elevation: 0,
        backgroundColor: Color(0xff003b57),
        //title: Text(translation(context).homePage),
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
      backgroundColor: Color(0xff003b57),
      body:ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80,left: 10,right: 10,bottom: 40),
                child:
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 140,),
                          Text(translation(context).fingerprint,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color(0xff003b57)),),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(translation(context)
                                .fingerprint,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black),),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -50,
                      left: 0,
                      right: 0,
                      child:Center(
                        child: Container(
                          width:150, height: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(75),
                              /*
                              image: DecorationImage(
                                image: AssetImage("images/logo.png",),
                                fit: BoxFit.cover,
                              ),

                               */
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
                          child:  Center(
                            child: Icon(
                              Icons.fingerprint, size: 60, color: Colors
                                .black,),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              )
            ],
          ),
        ],
      ),
    );
  }
}