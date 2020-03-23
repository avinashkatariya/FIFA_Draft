import 'package:FIFA_Auction/pages/homepage.dart';
import 'package:FIFA_Auction/widgets/formationcard.dart';
import 'package:flutter/material.dart';

class FormationPage extends StatelessWidget {
  List<Widget> formations = [];
  int i = 0;
  List<String> formationname = [
    "3-1-4-2",
    "3-4-1-2",
    "3-4-2-1",
    "3-4-3",
    "3-4-3 Diamond",
    "3-5-2",
    "4-1-2-1-2 Wide",
    "4-1-2-1-2 Narrow",
    "4-1-3-2",
    "4-1-4-1",
    "4-2-3-1 Narrow",
    "4-2-3-1 Wide",
    "4-2-2-2",
    "4-2-4",
    "4-3-1-2",
    "4-3-2-1",
    "4-3-3 Flat",
    "4-3-3 Holding",
    "4-3-3 Defend",
    "4-3-3 Attack",
    "4-3-3 False 9",
    "4-4-1-1 Attack",
    "4-4-1-1",
    "4-4-2 Flat",
    "4-4-2 Holding",
    "4-5-1 Attack",
    "4-5-1 Flat",
    "5-2-1-2",
    "5-2-2-1",
    "5-2-3",
    "5-3-2",
    "5-4-1 Diamond",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double pHeight = size.height, pWidth = size.width;
    while (i < 30) {
      formations.add(FormationCard(i: i, formation: formationname[i]));
      i += 1;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD10965),
        title: Text(
          "FIFA19 DRAFT",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DocaUserAccountsDrawerHeader(
              width: pWidth * 0.7,
              height: pHeight * 0.2,
              onPressed: () {},
              backgroundColor: Colors.pink,
              accountName: Text(
                "Real Madrid",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.5,
              ),
              accountEmail: Text(
                "avinash@doca.com",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1,
              ),
              accountPicture: Image.network(
                "http://ec2-13-233-254-43.ap-south-1.compute.amazonaws.com/static/img/243.png",
                width: pWidth * 0.13,
              ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              "Select a formation:",
              textScaleFactor: 1.2,
            ),
            margin: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: formations,
            ),
          )
        ],
      ),
    );
  }
}
