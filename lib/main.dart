import 'package:flutter/material.dart';
import 'package:dice_app/widgets/home.dart';
import 'package:dice_app/widgets/login.dart';
import 'package:dice_app/widgets/winner.dart';
import 'package:provider/provider.dart';
import 'package:dice_app/providers/prov_settings.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context)=>ProviderSettings(),
          child: MaterialApp(
        title:"FLUTTER Dice Game",
        routes:{
          '/':(context) => Login(),
          '/home':(context) => Home(),
          '/winpage' : (context) => WinningPage(),
      },
      ),
    );
  }
}