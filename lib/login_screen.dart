import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:my_test_proj/widget/keyboard_size_widget.dart';


import 'widget/keyboard_size_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginScreenState(_counter);
  const LoginScreen({
    Key key,
    @required int counter,
  })  : _counter = counter,
        super(key: key);
  final int _counter;

}

class LoginScreenState extends State<LoginScreen> {
  LoginScreenState(int _counter){ this._counter=_counter;}
  int _counter;
  bool _autoValidate = false;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final familyNameController = TextEditingController();
  final nameController = TextEditingController();
  static final SnackBar successSnackBar =
  SnackBar(content: Text('Registration complete. please check your email'));
  static final SnackBar errorSnackBar = SnackBar(
      content:
      Text('This email is already registered, please choose another one'));
  static final SnackBar noInternetSnackBar =
  SnackBar(content: Text('No internet, try again later'));

  // @override
  // void dispose(){
  //   emailController.dispose();
  //   familyNameController.dispose();
  //   nameController.dispose();
  //   super.dispose()
  // }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //     body: SingleChildScrollView(
    //final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Consumer<ScreenHeight>(
      builder: (context, _res, child) {
        return Form(
          key: formKey,
          autovalidate: _autoValidate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(top: 10.0),
                child: TextFormField(
                  // ignore: deprecated_member_use
                  inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[a-zA-Z]")),],
                  controller: familyNameController,
                  validator: (value) => nameValidator(value),
                  decoration: InputDecoration(
                    labelText: 'Family Name',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: TextFormField(
                  // ignore: deprecated_member_use
                  inputFormatters: [new WhitelistingTextInputFormatter(RegExp("[a-zA-Z ]")),],
                  controller: nameController,
                  validator: (value) => nameValidator(value),
                  decoration: InputDecoration(
                    labelText: 'Name',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: TextFormField(
                  controller: emailController,
                  validator: (email) => EmailValidator.validate(email)
                      ? null
                      : 'Enter valid email',
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              FlatButton(
                child: Text('Register'),
                onPressed: () => doRegister(context),

              ),
            ],
          ),
        );
      },
    );
  }

  doRegister(BuildContext context) async {
    print(familyNameController.text);
    print(nameController.text);
    print(emailController.text);
    bool validate = formKey.currentState.validate();
    if (validate) {
      try {
        var result = await http.post(
            'https://tas.trans-stat.com/api/portal/sde-registration',
            body: {
              "email": emailController.text,
              "firstName": nameController.text,
              "lastName": familyNameController.text
            });
        print(result.statusCode);
        print(result.reasonPhrase);
        if (result.statusCode == 200 || result.statusCode == 201) {
          Scaffold.of(context).showSnackBar(successSnackBar);
        } else {
          _autoValidate = true;
          Scaffold.of(context).showSnackBar(errorSnackBar);
        }
      } catch (e) {
        Scaffold.of(context).showSnackBar(noInternetSnackBar);
      }
    }
  }

  nameValidator(String value) {
    if (value == null || value == '') {
      return 'Please enter your credentials';
    }
    if (value.length < 2) {
      return 'Can\'t be less than 2 letters length';
    }
    return null;
  }
}

