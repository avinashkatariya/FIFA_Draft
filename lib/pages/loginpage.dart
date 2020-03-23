import 'dart:convert';

import 'package:FIFA_Auction/function.dart';
import 'package:FIFA_Auction/pages/draft.dart';
import 'package:FIFA_Auction/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController editingController0 = TextEditingController();
  TextEditingController editingController1 = TextEditingController();

  register(TextEditingController editingController0,
      TextEditingController editingController1, context) async {
    Map<String, dynamic> data;
    String email = editingController0.text;
    String password = editingController1.text;
    String url = "http://192.168.43.212:8000/accounts/tokenpair/";
    Map<String, String> headers = {
      "Content-type": "application/x-www-form-urlencoded"
    };
    Map<String, String> body = {"username": email, 'password': password};
    Response response = await post(url, headers: headers, body: body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      if (data['response_code'] == 0) {
        savePrimaryToken(data['primary_token']);
        saveRefreshToken(data['refresh_token']);
        saveUserLogged();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DraftPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/img/background.jpg',
            height: size.height,
            width: size.width,
            fit: BoxFit.fitWidth,
          ),
          ListView(
            children: <Widget>[
              Container(
                width: size.width * 0.90,
                height: size.height * 0.8,
                margin: EdgeInsets.only(
                    top: size.height * 0.1,
                    right: size.width * 0.05,
                    left: size.width * 0.05),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 0.75),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          left: size.width * 0.04, top: size.width * 0.18),
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                            color: Color.fromRGBO(12, 12, 12, 0.8),
                            fontWeight: FontWeight.bold),
                        textScaleFactor: 2.5,
                      ),
                    ),
                    Container(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      margin: EdgeInsets.only(
                          left: size.width * 0.04,
                          top: size.width * 0.1,
                          right: size.width * 0.04),
                      child: CustomTextFormField(
                        label: "Email address/Username",
                        icon: Icon(Icons.person),
                        controlleR: editingController0,
                      ),
                    ),
                    Container(
                      color: Color.fromRGBO(255, 255, 255, 0.5),
                      margin: EdgeInsets.only(
                          left: size.width * 0.04,
                          top: size.width * 0.06,
                          right: size.width * 0.04),
                      child: CustomTextFormField(
                        obscure: true,
                        //hint: "Enter your Email address or Username",
                        label: "Password",
                        icon: Icon(Icons.vpn_key),
                        controlleR: editingController1,
                      ),
                    ),
                    Container(
                      width: size.width * 0.50,
                      margin: EdgeInsets.only(
                          left: size.width * 0.25,
                          top: size.width * 0.08,
                          right: size.width * 0.25),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        color: Color.fromRGBO(209, 9, 101, 1),
                        onPressed: () {
                          register(
                              editingController0, editingController1, context);
                        },
                        textColor: Colors.white,
                        child: Text('Sign In'),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            left: size.width * 0.25,
                            top: size.width * 0.08,
                            right: size.width * 0.25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Don\'t have account Yet?',
                              textScaleFactor: 0.9,
                              style: TextStyle(
                                color: Color.fromRGBO(12, 12, 12, 0.8),
                              ),
                            ),
                          ],
                        ) //
                        ),
                    Container(
                      width: size.width * 0.50,
                      margin: EdgeInsets.only(
                          left: size.width * 0.25,
                          top: size.width * 0.0,
                          right: size.width * 0.25),
                      child: FlatButton(
                        //color: Color.fromRGBO(209, 9, 101, 1),
                        onPressed: () {},
                        textColor: Color.fromRGBO(209, 9, 101, 1),
                        child: Text('Sign Up'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
