import 'package:flutter/material.dart';

class PositionCard extends StatelessWidget {
  final Widget card;
  final String pos;
  PositionCard({this.card, this.pos});

  @override
  Widget build(BuildContext context) {
    Size dimen = MediaQuery.of(context).size;
    print(dimen.width* 0.2);
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top:dimen.width*0.17,left:dimen.width*0.02 ),
            child: Image.asset(
              'assets/img/base18.png',
              width: dimen.width * 0.1,
            ),
          ),
          card,
          Container(
            margin: EdgeInsets.only(top:dimen.width*0.195),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(pos,style: TextStyle(color: Colors.red,fontSize: dimen.width*0.02),),
            ],), 
            
          ),

          
        ],
      ),
    );
  }
}
