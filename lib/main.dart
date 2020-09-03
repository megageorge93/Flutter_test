import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My test reg screen'),
          centerTitle: true,
        ),
      body: Builder(builder: (context){
        return Center(
            child: Column(
              children: <Widget>[
                Padding(
                padding: EdgeInsets.symmetric(vertical: 56.0, horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'E-mail',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                        color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.blue,
                  child: Text('register',
                  style: TextStyle(color: Colors.white),),
                  onPressed: (){

                    Scaffold.of(context).showSnackBar(successSnackBar);
                    }, // on Pressed methods
                ),
              ],
            ),
        );
      }
      ),
    );
  }
}
