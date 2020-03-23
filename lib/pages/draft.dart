import 'package:FIFA_Auction/widgets/cardsmall.dart';
import 'package:FIFA_Auction/widgets/cardsmallwd.dart';
import 'package:FIFA_Auction/widgets/positioncard.dart';
import 'package:flutter/material.dart';

class DraftPage extends StatelessWidget {
  Offset getCordinate(int pos, Size s, var formationData) {
    return Offset(s.width * formationData["offsets"][pos][0],
        (s.height * formationData["offsets"][pos][1] + s.width * 0.2));
  }

  EdgeInsetsGeometry posMargin(int pos, Size s, var formationData) {
    return EdgeInsets.only(
        top: s.height * formationData["offsets"][pos][1],
        left: s.width * (formationData["offsets"][pos][0] - 0.07));
  }

  @override
  Widget build(BuildContext context) {
    Size dimen = MediaQuery.of(context).size;
    Map<String, dynamic> formation = {
      "formation": "4-3-3 Flat",
      "offsets": [
        [0.5, 0.15],
        [0.17, 0.18],
        [0.83, 0.18],
        [0.5, 0.38],
        [0.32, 0.38],
        [0.68, 0.38],
        [0.12, 0.525],
        [0.88, 0.525],
        [0.37, 0.55],
        [0.63, 0.55],
        [0.5, 0.68]
      ],
      "position": [
        "ST",
        "LW",
        "RW",
        "CM",
        "CM",
        "CM",
        "LB",
        "RB",
        "CB",
        "CB",
        "GK"
      ],
      "mapping": [
        [0, 1, 2, 3],
        [1, 4, 6],
        [2, 5, 7],
        [3, 4, 5],
        [6, 8],
        [7, 9],
        [4, 6, 8],
        [5, 7, 9],
        [8, 9, 10],
        [9, 10],
        [10]
      ]
    };
    List<Widget> lines = [];
    for (var pos in formation['mapping']) {
      int currpos = pos[0];
      for (int p0 in pos) {
        lines.add(CustomPaint(
          painter: PaintPosLines(
              p1: getCordinate(currpos, dimen, formation),
              p2: getCordinate(p0, dimen, formation)),
        ));
      }
    }
    var players = [
      {
        "rarity":
            "https://futhead.cursecdn.com/static/img/19/cards/small/1_4_0.png",
        "playerImgUrl": "https://futhead.cursecdn.com/static/img/20/players_alt/p184758098.png",
        "nationImgUrl": "",
        "leagueImgUrl": "",
        "pos": "LW",
        "rating": 97,
      },
      {
        "rarity":
            "https://futhead.cursecdn.com/static/img/19/cards/small/1_5_0.png",
        "playerImgUrl": "https://futhead.cursecdn.com/static/img/20/players_alt/p134238529.png",
        "nationImgUrl": "",
        "leagueImgUrl": "",
        "pos": "ST",
        "rating": 99,
      },
      {
        "rarity":
            "https://futhead.cursecdn.com/static/img/19/cards/small/1_12_0.png",
        "playerImgUrl": "https://futhead.cursecdn.com/static/img/20/players_alt/p151152967.png",
        "nationImgUrl": "",
        "leagueImgUrl": "",
        "pos": "RW",
        "rating": 99,
      },
      {
        "rarity":
            "https://futhead.cursecdn.com/static/img/19/cards/small/1_45_0.png",
        "playerImgUrl": "https://futhead.cursecdn.com/static/img/20/players_alt/p167965145.png",
        "nationImgUrl": "",
        "leagueImgUrl": "",
        "pos": "CAM",
        "rating": 98,
      },
      {
        "rarity":
            "https://futhead.cursecdn.com/static/img/19/cards/small/1_60_0.png",
        "playerImgUrl": "https://futhead.cursecdn.com/static/img/20/players_alt/p134433642.png",
        "nationImgUrl": "",
        "leagueImgUrl": "",
        "pos": "CDM",
        "rating": 98,
      },
      {
        "rarity":
            "https://futhead.cursecdn.com/static/img/19/cards/small/1_67_0.png",
        "playerImgUrl": "https://futhead.cursecdn.com/static/img/20/players_alt/p20801.png",
        "nationImgUrl": "",
        "leagueImgUrl": "",
        "pos": "LW",
        "rating": 97,
      },
      {
        "rarity":
            "https://futhead.cursecdn.com/static/img/19/cards/small/1_66_0.png",
        "playerImgUrl": "https://futhead.cursecdn.com/static/img/20/players_alt/p167965145.png",
        "nationImgUrl": "",
        "leagueImgUrl": "",
        "pos": "LB",
        "rating": 94,
      },
      {
        "rarity":
            "https://futhead.cursecdn.com/static/img/19/cards/small/1_67_0.png",
        "playerImgUrl": "https://futhead.cursecdn.com/static/img/20/players_alt/p151198320.png",
        "nationImgUrl": "https://futhead.cursecdn.com/static/img/20/players_alt/p167965145.png",
        "leagueImgUrl": "",
        "pos": "CB",
        "rating": 99,
      },
      {
        "rarity":
            "https://futhead.cursecdn.com/static/img/19/cards/small/1_12_0.png",
        "playerImgUrl": "https://futhead.cursecdn.com/static/img/20/players_alt/p167965145.png",
        "nationImgUrl": "",
        "leagueImgUrl": "",
        "pos": "CB",
        "rating": 96,
      },
      {
        "rarity":
            "https://futhead.cursecdn.com/static/img/19/cards/small/1_5_0.png",
        "playerImgUrl": "",
        "nationImgUrl": "",
        "leagueImgUrl": "",
        "pos": "RB",
        "rating": 94,
      },{
        "rarity":
            "https://futhead.cursecdn.com/static/img/19/cards/small/1_66_0.png",
        "playerImgUrl": "https://futhead.cursecdn.com/static/img/20/players_alt/p84098911.png",
        "nationImgUrl": "",
        "leagueImgUrl": "",
        "pos": "GK",
        "rating": 97,
      }
    ];
    int i = 0;
    while (i < 11) {
      lines.add(Container(
        margin: posMargin(i, dimen, formation),
        child: PositionCard(
            pos: formation['position'][i],
            card: Container(
              child: SmallCard(
                rarity:players[i]['rarity'],
                    //"https://futhead.cursecdn.com/static/img/19/cards/small/1_66_0.png",
                playerImgUrl:players[i]['playerImgUrl'],
                    //"https://futhead.cursecdn.com/static/img/19/players_alt/p184570177.png",
                pos: players[i]['pos'],
                rating: players[i]['rating'],
                nationImgUrl://players[i]['nationImgUrl'],
                    "https://futhead.cursecdn.com/static/img/19/nations/38.png",
                clubImgurl://players[i]['clubImgUrl'],
                    "https://futhead.cursecdn.com/static/img/19/clubs/45.png",
              ),
              width: dimen.width * 0.14,
              height: dimen.width * 0.20,
            )),
        width: dimen.width * 0.15,
        height: dimen.width * 0.25,
      ));
      i += 1;
    }
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: Color.fromRGBO(0, 9, 101, 1),
            width: dimen.width,
            height: dimen.height * 0.85,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'assets/img/dbg.png',
                  fit: BoxFit.fitWidth,
                  width: dimen.width,
                  height: dimen.height,
                ),
                Stack(
                  children: lines,
                ),
                /*Container(
                  color: Colors.white,
                  height: dimen.width*0.4,
                  margin: EdgeInsets.only(top:dimen.width*0.5),
                  child: Row(
                    children: <Widget>[
                      Container(width:dimen.width*0.03),
                      SmallCardDetailed(),
                      Container(width:dimen.width*0.01),
                      SmallCardDetailed(),
                      Container(width:dimen.width*0.01),
                      SmallCardDetailed(),
                      Container(width:dimen.width*0.01),
                      SmallCardDetailed(),
                      Container(width:dimen.width*0.01),
                      SmallCardDetailed(),
                    ],
                  ),
                ),*/
              ],
            ),
          ),
          Expanded(
              child: Container(
            width: dimen.width,
            color: Color.fromRGBO(0, 9, 101, 1),
            child: ListView(
              children: <Widget>[
                Container(
                  color: Colors.white,
                  width: 16,
                  margin: EdgeInsets.only(left: 4, right: 4),
                  child: Column(
                    children: <Widget>[
                      Text(" "),
                      Text("S"),
                      Text("U"),
                      Text("B"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset(
                    'assets/img/b_empty19.png',
                    width: dimen.width * 0.14,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset(
                    'assets/img/b_empty19.png',
                    width: dimen.width * 0.14,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset(
                    'assets/img/b_empty19.png',
                    width: dimen.width * 0.14,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset(
                    'assets/img/b_empty19.png',
                    width: dimen.width * 0.14,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset(
                    'assets/img/b_empty19.png',
                    width: dimen.width * 0.14,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset(
                    'assets/img/b_empty19.png',
                    width: dimen.width * 0.14,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 4, bottom: 4),
                  width: dimen.width * 0.16,
                  height: dimen.width * 0.14,
                  child: SmallCard(
                    rarity:
                        "https://futhead.cursecdn.com/static/img/19/cards/small/1_66_0.png",
                    playerImgUrl:
                        "https://futhead.cursecdn.com/static/img/19/players_alt/p184570177.png",
                    pos: "ST",
                    rating: 99,
                    nationImgUrl:
                        "https://futhead.cursecdn.com/static/img/19/nations/38.png",
                    clubImgurl:
                        "https://futhead.cursecdn.com/static/img/19/clubs/45.png",
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 16,
                  margin: EdgeInsets.only(left: 4, right: 4),
                  child: Column(
                    children: <Widget>[
                      Text(" "),
                      Text("R"),
                      Text("E"),
                      Text("S"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset(
                    'assets/img/b_empty19.png',
                    width: dimen.width * 0.14,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset(
                    'assets/img/b_empty19.png',
                    width: dimen.width * 0.14,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset(
                    'assets/img/b_empty19.png',
                    width: dimen.width * 0.14,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset(
                    'assets/img/b_empty19.png',
                    width: dimen.width * 0.14,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 4),
                  child: Image.asset(
                    'assets/img/b_empty19.png',
                    width: dimen.width * 0.14,
                  ),
                ),
              ],
              scrollDirection: Axis.horizontal,
            ),
          ))
        ],
      ),
    );
  }
}

class PaintPosLines extends CustomPainter {
  final Offset p1, p2;
  final Color color;
  PaintPosLines(
      {this.p1 = const Offset(0, 0),
      this.p2 = const Offset(0, 0),
      this.color = const Color.fromRGBO(128, 0, 0, 1.0)});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
