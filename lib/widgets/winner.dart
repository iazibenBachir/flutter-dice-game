import 'package:dice_app/providers/prov_settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WinningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<ProviderSettings>(context);
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/trophie.png'),
                ),
                Container(
                  child: Image.asset(
                    'images/winner.png',
                  ),
                ),
                // get the winner name from the provider.
                Text(
                  ' ${prov.winnerName} Won the game',
                  style: TextStyle(
                    color: Colors.red[700],
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 100.0),
                // Row for tow buttons.
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      textColor: Colors.white,
                      color: Colors.blue[900],
                      child: Text('PLay Again'),
                      onPressed: () {
                        prov.resetScores();
                        Navigator.pushReplacementNamed(context, '/home');
                      },
                    ),
                    // exit and go to Login Screen
                    RaisedButton(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      textColor: Colors.white,
                      color: Colors.red[900],
                      child: Text('Back Home'),
                      onPressed: () {
                        prov.resetAllData();
                        Navigator.pushReplacementNamed(context, '/');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*

class Winner extends StatelessWidget {
  Map data = {};
  
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
    body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/winningbg.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Text('${data['winner']} Won'),
            RaisedButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('PLay Again'),
            ),
          ],
        ),
      ),
    ),
    );
  }
}
*/
