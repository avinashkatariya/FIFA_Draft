import 'package:flutter/material.dart';

class SmallCardDetailed extends StatelessWidget {
  final TextStyle tstyle = TextStyle(color: Color.fromRGBO(238, 209, 112, 1));
  @override
  Widget build(BuildContext context) {
    Size dimen = MediaQuery.of(context).size;
    return Container(
        width: dimen.width * 0.18,
        height: dimen.width * 0.3,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.network(
                    "https://futhead.cursecdn.com/static/img/19/cards/large/1_66_0.png",width: dimen.width * 0.2,
        height: dimen.width * 0.3,fit:BoxFit.fitHeight,),
              ],
            ),
            CustomPaint(
              painter: PaintSeprator(
                p1:Offset(dimen.width * 0.03,dimen.width * 0.189),
                p2:Offset(dimen.width * 0.15,dimen.width * 0.189),
                p3:Offset(dimen.width * 0.09,dimen.width * 0.20),
                p4:Offset(dimen.width * 0.09,dimen.width * 0.25),
                p5:Offset(dimen.width * 0.08,dimen.width * 0.27),
                p6:Offset(dimen.width * 0.1,dimen.width * 0.27),
                color: Color.fromRGBO(238, 209, 112, 1),),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: dimen.width * 0.03, left: dimen.width * 0.02),
              child: Image.network(
                "https://futhead.cursecdn.com/static/img/19/players_alt/p184570177.png",
                width: dimen.width * 0.14,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top:dimen.width * 0.195),
              width: dimen.width*0.18,
              child:Row(children: <Widget>[
              Expanded(child:Column(
                crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("99 PAC   ",textScaleFactor:0.4,style: tstyle,),
                Container(
                              height: dimen.width * 0.005,
                            ),
                Text("99 SHO   ",textScaleFactor:0.4,style: tstyle,),
                Container(
                              height: dimen.width * 0.005,
                            ),
                Text("99 PAS   ",textScaleFactor:0.4,style: tstyle,),
              ],)),
                
                 Expanded(child:Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("   99 DRI",textScaleFactor:0.4,style: tstyle,),
                Container(
                              height: dimen.width * 0.005,
                            ),
                Text("   99 DEF",textScaleFactor:0.4,style: tstyle,),
                Container(
                              height: dimen.width * 0.005,
                            ),
                Text("   99 PHY",textScaleFactor:0.4,style: tstyle,),
              ],)),
              ],)
              
              ),
              Container(
                        margin: EdgeInsets.only(top: dimen.width * 0.165),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("RONALDO", textScaleFactor: 0.5, style: tstyle)
                          ],
                        ),
                      ),
            Container(
                margin: EdgeInsets.only(
                    left: dimen.width * 0.015, top: dimen.width * 0.035),
                width: dimen.width * 0.034,
                height: dimen.width * 0.13,
                color: Color.fromRGBO(12, 12, 12, 0.3)),
            Column(
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: dimen.width * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: dimen.width * 0.04,
                            ),
                            Text(
                              '99',
                              textScaleFactor: 0.5,
                              style: tstyle,
                            ),
                            Container(
                              height: dimen.width * 0.005,
                            ),
                            Text(
                              'ST',
                              textScaleFactor: 0.4,
                              style: tstyle,
                            ),
                            Container(
                              height: dimen.width * 0.01,
                            ),
                            Image.network(
                              'https://futhead.cursecdn.com/static/img/19/nations/38.png',
                              width: dimen.width * 0.03,
                            ),
                            Container(
                              height: dimen.width * 0.01,
                            ),
                            Image.network(
                              'https://futhead.cursecdn.com/static/img/19/clubs/45.png',
                              width: dimen.width * 0.03,
                            ),
                            Container(
                              height: dimen.width * 0.02,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Text("Isco")
              ],
            ),
          ],
        ));
  }
}

class PaintSeprator extends CustomPainter {
  final Offset p1, p2, p3, p4, p5, p6;
  final Color color;
  PaintSeprator(
      {this.p1 = const Offset(0, 0),
      this.p2 = const Offset(0, 0),
      this.p3 = const Offset(0, 0),
      this.p4 = const Offset(0, 0),
      this.p5 = const Offset(0, 0),
      this.p6 = const Offset(0, 0),
      this.color = const Color.fromRGBO(128, 0, 0, 1.0)});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.5;
    canvas.drawLine(p1, p2, paint);
    canvas.drawLine(p3, p4, paint);
    canvas.drawLine(p5, p6, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
