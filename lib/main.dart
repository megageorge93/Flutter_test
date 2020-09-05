import 'package:flutter/material.dart';
import 'dart:async';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My test reg screen'),
          centerTitle: true,
        ),
      body: Builder(builder: (context){
        return SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(

                children: <Widget>[

                  Expanded(
                  flex: 3,
                    child: Container(
                      color: Colors.blue,
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.red,
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
                  ),Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.grey,
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
                  ),Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.yellow,
                      child: Row(
                        children: [
                          FlatButton(
                            child: Container(child: Text('click'), color: Colors.red),
                            onPressed: (){
                              Scaffold.of(context).showSnackBar(successSnackBar);
                            },


                          ),
                          FlatButton(
                            child: Text('click'),
                            onPressed: (){
                              Scaffold.of(context).showSnackBar(successSnackBar);
                            },


                          ),
                          FlatButton(
                            child: Text('click'),
                            onPressed: (){
                              Scaffold.of(context).showSnackBar(successSnackBar);
                            },


                          ),
                        ],
                      )
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
                  // Table(
                  //   border: TableBorder.symmetric(outside: BorderSide(width: 5.0 , color: Colors.blue)),
                  //   children: [
                      // TableRow(children: [Padding(
                      //   padding: EdgeInsets.symmetric(vertical: 56.0, horizontal: 16.0),
                      //   child: TextField(
                      //     decoration: InputDecoration(
                      //       prefixIcon: Icon(Icons.email),
                      //       labelText: 'E-mail',
                      //       enabledBorder: OutlineInputBorder(
                      //         borderSide: BorderSide(
                      //           color: Colors.blue,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // ])
                    //   TableRow(children: [])
                    // ],

                  //),
                ],
              ),
            ),
        );
      }
      ),
    );
  }
}
