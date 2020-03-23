import 'dart:convert';

import 'package:FIFA_Auction/function.dart';
import 'package:FIFA_Auction/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatelessWidget {
  Future<Map<String, dynamic>> userdata() async {
    Map<String, dynamic> userdata;
    String url = "http://192.168.43.212:8000/accounts/userdata/";
    String pToken = await getPrimaryToken();
    Map<String, String> headers = {
      "token": pToken,
    };

    Response response = await get(url, headers: headers);
    if (response.statusCode == 200) {
      print(response.body);
      userdata = json.decode(response.body);
      if (userdata['response_code'] == "0") {
        return userdata;
      }
      if (userdata['response_code'] == "1") {
        url = "http://192.168.43.212:8000/accounts/primarytoken/";
        headers = {"Content-type": "application/x-www-form-urlencoded"};
        Map<String, String> body = {};
        response = await post(url, headers: headers, body: body);
        if (response.statusCode == 200) {
          userdata = json.decode(response.body);
          if (userdata['response_code'] == "0") {
            savePrimaryToken(userdata["primary_token"]);
            String url = "http://192.168.43.212:8000/accounts/userdata/";
            String pToken = await getPrimaryToken();
            Map<String, String> headers = {
              "token": pToken,
            };
            Response response = await get(url, headers: headers);
            if (response.statusCode == 200) {
              print(response.body);
              userdata = json.decode(response.body);
              if (userdata['response_code'] == "0") {
                return userdata;
              }
            }
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double pHeight = size.height, pWidth = size.width;
    TextEditingController textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("FIFA 19 Draft"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder(
              future: userdata(),
              initialData: {
                "email": "EmailId",
                "club": "Club Name",
                "balance": 1000,
                "clubImgUrl": "img/243.png"
              },
              builder: (BuildContext context, AsyncSnapshot<dynamic> snap) {
                Map<String, dynamic> mvar = snap.data;
                print(mvar);
                return DocaUserAccountsDrawerHeader(
                  width: pWidth * 0.7,
                  height: pHeight * 0.2,
                  onPressed: () {},
                  backgroundColor: Colors.pink,
                  accountName: Text(
                    mvar["club"],
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1.5,
                  ),
                  accountEmail: Text(
                    mvar["email"],
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1,
                  ),
                  accountPicture: Image.network(
                    "http://ec2-13-233-254-43.ap-south-1.compute.amazonaws.com/static/" +
                        mvar["clubImgUrl"],
                    width: pWidth * 0.13,
                  ),
                );
              },
            ),
            VerticalDivider(
              width: pWidth * 0.7,
              thickness: pHeight * 0.01,
              color: Color.fromRGBO(0, 0, 0, 0.37),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.pink,
              ),
              title: Text("Home"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.pink),
              title: Text("Draft"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.pink),
              title: Text("My Team"),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.pink),
              title: Text("Logout"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(left: 16, right: 16),
            child: CustomTextFormField(
              label: "Token",
              controlleR: textEditingController,
              icon: Icon(Icons.title),
            ),
          ),
          Container(
            width: size.width * 0.50,
            margin: EdgeInsets.only(
                left: size.width * 0.15, right: size.width * 0.15),
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
              color: Color.fromRGBO(209, 9, 101, 1),
              onPressed: () {},
              textColor: Colors.white,
              child: Text('Sign In'),
            ),
          ),
        ],
      ),
    );
  }
}

class DocaUserAccountsDrawerHeader extends StatelessWidget {
  final Color backgroundColor;
  final Widget accountName, accountEmail, accountPicture;
  final Function onPressed;
  final double width, height;

  const DocaUserAccountsDrawerHeader(
      {Key key,
      this.backgroundColor,
      this.accountName,
      this.accountEmail,
      this.accountPicture,
      this.onPressed,
      this.width,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin:
                    EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                child: accountPicture,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  accountName,
                  accountEmail,
                ],
              ),
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }
}
