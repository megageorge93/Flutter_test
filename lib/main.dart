import 'package:flutter/material.dart';

import 'package:my_test_proj/LoginScreen.dart';
//import 'package:http/http.dart' as http;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
          title: 'title',
          home: HomePage(),
        );
  }

}
class HomePage extends StatelessWidget {
  SnackBar successSnackBar = SnackBar(content: Text('Success'));
  SnackBar appBarSnack = SnackBar(content: Text('appBarButton Pressed'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: null,),
        centerTitle: true,
        title: DecoratedBox(
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20)
            ),
            child: SizedBox(height: AppBar().preferredSize.height,child: Image.network('https://img.pngio.com/open-pokemon-logo-png-2000_736.png')),
          ),
      ),
      body: LoginScreen()

      );

  }
}
