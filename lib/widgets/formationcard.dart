import 'dart:convert';
import 'package:FIFA_Auction/pages/draft.dart';
import 'package:FIFA_Auction/pages/formation.dart';
import 'package:flutter/material.dart';

class FormationCard extends StatelessWidget {
  final int i;
  final String formation;
  FormationCard({this.i, this.formation});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(209, 9, 101, 1.0),
      child: InkWell(
        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DraftPage()));},
        child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8, left: 16),
            child: Text(
              formation,
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left:8,right:8,top: 32),
            child: Image.asset('assets/img/f' + i.toString() + '.png'),
          ),
        ],
      ),)
     
    );
  }
}
