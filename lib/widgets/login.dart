import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dice_app/providers/prov_settings.dart';

class Login extends StatelessWidget {
  // Text Fields Controlers
  final firstPlayerControler = TextEditingController();
  final secondPlayerControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // import the Data from the provider
    var prov = Provider.of<ProviderSettings>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            // background image for Login page
            image: DecorationImage(
              image: AssetImage('images/login_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // _____ game logo ______
                CircleAvatar(
                  backgroundColor: Colors.blue[100],
                  radius: 55,
                  backgroundImage: AssetImage('images/logo.png'),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      TextField(
                        cursorColor: Colors.blue[400],
                        controller: firstPlayerControler,
                        maxLength: 7,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'First Player Name',
                          labelText: 'Player Name',
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextField(
                        cursorColor: Colors.blue[400],
                        controller: secondPlayerControler,
                        maxLength: 7,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintText: 'Second Player Name',
                          labelText: 'Player Name',
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // play Button
                FlatButton.icon(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  onPressed: () {
                    // create 2  instances of "Player object" for both players
                    prov.addPlayer(firstPlayerControler.text);
                    prov.addPlayer(secondPlayerControler.text);

                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  icon: Icon(
                    Icons.play_arrow,
                  ),
                  label: Text(
                    'PLay',
                    style: TextStyle(
                      letterSpacing: 1.3,
                    ),
                  ),
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
