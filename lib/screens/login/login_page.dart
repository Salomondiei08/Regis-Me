import 'package:flutter/material.dart';
import 'package:mu_shop/screens/login/reset.dart';
import 'package:mu_shop/screens/login/services/authservice.dart';
import 'package:mu_shop/screens/login/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();

  late String email, password;

  Color greenColor = Color(0xFF00AF19);

  //To check fields during submit
  checkFields() {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      print("Form Validé");
      return true;
    }
    return false;
  }

  //To Validate email
  String? validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Form(
          key: formKey,
          child: _buildLoginForm(),
        ),
      ),
    );
  }

  _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      child: ListView(
        children: [
          SizedBox(height: 75.0),
          Container(
            height: 125.0,
            width: 200.0,
            child: Stack(
              children: [
                Text('Hello',
                    style: TextStyle(fontFamily: 'Trueno', fontSize: 60.0)),
                Positioned(
                    top: 50.0,
                    child: Text('There',
                        style:
                            TextStyle(fontFamily: 'Trueno', fontSize: 60.0))),
                Positioned(
                  top: 97.0,
                  left: 175.0,
                  child: Container(
                    height: 10.0,
                    width: 10.0,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: greenColor),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 25.0),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'EMAIL',
              labelStyle: TextStyle(
                  fontFamily: 'Trueno',
                  fontSize: 12.0,
                  color: Colors.grey.withOpacity(0.5)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: greenColor),
              ),
            ),
            onChanged: (value) {
              this.email = value;
            },
            validator: (value) =>
                value!.isEmpty ? 'Email is required' : validateEmail(value!),
          ),
          TextFormField(
              decoration: InputDecoration(
                labelText: 'PASSWORD',
                labelStyle: TextStyle(
                  fontFamily: 'Trueno',
                  fontSize: 12.0,
                  color: Colors.grey.withOpacity(0.5),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: greenColor),
                ),
              ),
              obscureText: true,
              onChanged: (value) {
                this.password = value;
              },
              validator: (value) =>
                  value!.isEmpty ? 'Password is required' : null),
          SizedBox(height: 5.0),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ResetPassword(),
                ),
              );
            },
            child: Container(
              alignment: Alignment(1.0, 0.0),
              padding: EdgeInsets.only(top: 15.0, left: 20.0),
              child: InkWell(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                      color: greenColor,
                      fontFamily: 'Trueno',
                      fontSize: 11.0,
                      decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
              {
                if (checkFields()) print(email);
                print(password);
                AuthService().signIn(email, password, context);
              }
            },
            child: Container(
              height: 50.0,
              child: Material(
                borderRadius: BorderRadius.circular(25.0),
                shadowColor: Colors.greenAccent,
                color: greenColor,
                elevation: 7.0,
                child: Center(
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white, fontFamily: 'Trueno'),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          GestureDetector(
            onTap: () {
              // AuthService().fbSignIn();
            },
            child: Container(
              height: 50.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1.0),
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image(
                        image: AssetImage('assets/regisme.png'),
                      ),
                      // size: 15.0),
                    ),
                    SizedBox(width: 10.0),
                    Center(
                      child: Text(
                        'Login with Google',
                        style: TextStyle(fontFamily: 'Trueno'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 25.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('New to RegisMe ?'),
              SizedBox(width: 5.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupPage()));
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: greenColor,
                      fontFamily: 'Trueno',
                      decoration: TextDecoration.underline),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
