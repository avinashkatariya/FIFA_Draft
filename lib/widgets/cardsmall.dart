import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final String playerImgUrl, nationImgUrl, clubImgurl, pos,  rarity;
  final int rating;
  SmallCard({
    this.playerImgUrl,
    this.nationImgUrl,
    this.clubImgurl,
    this.pos,
    this.rating,
    this.rarity,
  });

  @override
  Widget build(BuildContext context) {
    Size dimen = MediaQuery.of(context).size;
    return Container(
        width: dimen.width * 0.14,
        height: dimen.width * 0.25,
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(rarity),
                //"https://futhead.cursecdn.com/static/img/19/cards/small/1_66_0.png"
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  left: dimen.width * 0.008, top: dimen.width * 0.045),
              width: dimen.width * 0.04,
              height: dimen.width * 0.1,
              color: Color.fromRGBO(12, 12, 12, 0.3),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: dimen.width * 0.01, top: dimen.width * 0.035),
              child: Image.network(
                playerImgUrl,//"https://futhead.cursecdn.com/static/img/19/players_alt/p184570177.png",
                width: dimen.width * 0.12,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: dimen.width * 0.01),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(height: dimen.width*0.02,),
                            Text(
                              rating.toString(),
                              textScaleFactor: 0.5,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              pos,
                              textScaleFactor: 0.4,
                              style: TextStyle(color: Colors.white),
                            ),
                            Image.network(
                              nationImgUrl,//'https://futhead.cursecdn.com/static/img/19/nations/38.png',
                              width: dimen.width * 0.03,
                            ),
                            Container(
                              height: dimen.width * 0.005,
                            ),
                            Image.network(
                              clubImgurl,//'https://futhead.cursecdn.com/static/img/19/clubs/45.png',
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
