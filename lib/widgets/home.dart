import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dice_app/providers/prov_settings.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color btnColor = Colors.red[600];

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderSettings>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red[800], Colors.red[100]],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                // row for tow players rendering data ( names and total scores).
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // first player container.
                    Container(
                      width: 155,
                      height: 65,
                      decoration: BoxDecoration(
                        color: btnColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              // get from the provider name of the first Player.
                              Text(
                                prov.firstPlayerName,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              // get from the provider Total Score of the first Player.
                              Text(
                                '${prov.firstPlayerScore}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // second player container.
                    Container(
                      width: 155,
                      height: 65,
                      decoration: BoxDecoration(
                        color: btnColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text(
                                prov.secondPlyerName,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                '${prov.secondPlyerScore}',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  // Column to hold "Dice Image", "Round Score", "Player Turn" widgets.
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        // render the right image according to the random number(1-6) generated.
                        'images/dice-${prov.getdice}.png',
                        width: 130,
                        height: 130,
                      ),
                      SizedBox(height: 30.0),
                      Center(
                        // round score
                        child: Text(
                          '${prov.roundScore}',
                          style: TextStyle(
                            fontSize: 38.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      // Wich player is playing now! (player turn).
                      Text(
                        '${prov.players[prov.activePlayer].name} TURN',
                        style: TextStyle(
                          fontSize: 26.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                // a Row for 'Hold' and 'Roll' buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // 'Roll' btn
                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                      child: Text(
                        'ROLL',
                        style: TextStyle(
                          letterSpacing: 1.2,
                        ),
                      ),
                      onPressed: () {
                        prov.rollDice();
                        // check if the score is higher or less then 100.
                        // if there is a winner navigate to "winpage" Screen.
                        if (prov.winnerName.isNotEmpty) {
                          Navigator.pushReplacementNamed(context, '/winpage');
                        }
                      },
                    ),
                    // 'Hold'  btn
                    RaisedButton(
                      color: btnColor,
                      textColor: Colors.white,
                      padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                      child: Text(
                        'HOLD',
                        style: TextStyle(
                          letterSpacing: 1.2,
                        ),
                      ),
                      onPressed: () {
                        prov.holdDice();
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
