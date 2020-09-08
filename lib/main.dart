import 'package:flutter/material.dart';
import 'package:my_test_proj/login_screen.dart';
import 'package:my_test_proj/widget/keyboard_size_widget.dart';

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
  int _counter = 0;

  SnackBar successSnackBar = SnackBar(content: Text('Success'));
  SnackBar appBarSnack = SnackBar(content: Text('appBarButton Pressed'));
  @override
  Widget build(BuildContext context) {
    return KeyboardSizeProvider(
      smallSize: 500.0,
      child: Scaffold(

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
        body: LoginScreen(counter: _counter,),

        ),
    );

  }
}
