import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:my_test_proj/widget/keyboard_size_widget.dart';

class LoginScreenTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginScreenTestState(_counter);
  const LoginScreenTest({
    Key key,
    @required int counter,
  })  : _counter = counter,
        super(key: key);
  final int _counter;

}

class LoginScreenTestState extends State<LoginScreenTest> {
  LoginScreenTestState(int _counter){ this._counter=_counter;}
  int _counter;
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
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Consumer<ScreenHeight>(builder: (context, _res, child) {
      return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        //    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: formKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: _res.isSmall ?  const EdgeInsets.only(top: 250.0) : const EdgeInsets.only(top: 100.0),
                    child: TextFormField(onTap: (){print(_res.isSmall);},
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
                      //(email) => EmailValidator.validate(email),
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
            ),
          ),
        ),
      );
    });
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
          Scaffold.of(context).showSnackBar(errorSnackBar);
        }
      } catch (e) {
        Scaffold.of(context).showSnackBar(noInternetSnackBar);
      }
    }
  }

  nameValidator(String value) {
    if (value == null || value == '') {
      return 'Please fill this line';
    }
    if (value.length < 2) {
      return 'Can\'t be less than 2 letters length';
    }
    return null;
  }
}
