import 'package:book_exchange/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'base.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginKey = GlobalKey<FormState>();

  final AuthenticationService _auth = AuthenticationService();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscureText = true;
  _toggle() {
    setState(() {
      _obscureText = !_obscureText;

      if (_obscureText) {
        _obscureText = true;
      } else {
        _obscureText = false;
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(155, 96, 220, 1),
      // appBar: AppBar(
      //   backgroundColor: const Color.fromRGBO(155, 96, 220, 1),
      //   centerTitle: true,
      //   toolbarHeight: 70,
      //   title: const Text('Login'),
      // ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 200, 30, 120),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 15.0),
                    blurRadius: 15.0),
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, -10.0),
                    blurRadius: 10.0),
              ]),
          child: Form(
            key: _loginKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 40, 10, 25),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        labelText: 'Email',
                        icon: Icon(Icons.email),
                        hintText: 'Enter Your Email',
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field can not be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        labelText: 'Password',
                        icon: Icon(Icons.lock),
                        hintText: 'Enter Your Password',
                      ),
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field can not be empty';
                        } else if (value.length < 6) {
                          return "your password should have at least 6 characters";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: MaterialButton(
                        color: const Color.fromRGBO(155, 96, 220, 1),
                        height: 60,
                        minWidth: 150,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                          if (_loginKey.currentState!.validate()) {
                            dynamic result =
                                await _auth.signInWithEmailAndPassword(
                                    emailController.text.trim(),
                                    passwordController.text.trim());
                            if (result == null) {
                              print('wrong email or password');
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return Home();
                                }),
                              );
                            }
                          } else {
                            print("unsuccessful");
                          }
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have Account, ",
                        style: TextStyle(
                          fontSize: 15,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Color.fromRGBO(155, 96, 220, 1),
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Future signIn() async {
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //     email: emailController.text.trim(),
  //     password: passwordController.text.trim(),
  //   );
  // }
}
