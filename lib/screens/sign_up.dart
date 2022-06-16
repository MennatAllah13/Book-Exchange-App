import 'package:book_exchange/models/users.dart';
import 'package:book_exchange/screens/base.dart';
import 'package:book_exchange/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'complete_profile.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Gender _gender = Gender.male;
  final _signUpKey = GlobalKey<FormState>();
  final AuthenticationService _auth = AuthenticationService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(155, 96, 220, 1),
        // appBar: AppBar(
        //   backgroundColor: const Color.fromRGBO(155, 96, 220, 1),
        //   centerTitle: true,
        //   toolbarHeight: 70,
        //   title: const Text('Sign Up'),
        // ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30, 150, 30, 120),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
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
            child: SingleChildScrollView(
              child: Form(
                  key: _signUpKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 40, 10, 25),
                    child: Column(
                      children: [
                        // Container(
                        //   margin: const EdgeInsets.all(10),
                        //   child: TextFormField(
                        //     decoration: const InputDecoration(
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.all(
                        //           Radius.circular(30),
                        //         ),
                        //       ),
                        //       labelText: 'Name',
                        //       icon: Icon(Icons.account_circle),
                        //       hintText: 'Enter Your Name',
                        //     ),
                        //     controller: nameController,
                        //     validator: (value) {
                        //       if (value == null || value.isEmpty) {
                        //         return 'This field can not be empty';
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        // ),
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
                        // Container(
                        //   margin: const EdgeInsets.all(10),
                        //   child: TextFormField(
                        //     decoration: const InputDecoration(
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.all(
                        //           Radius.circular(30),
                        //         ),
                        //       ),
                        //       labelText: 'Username',
                        //       icon: Icon(Icons.account_circle),
                        //       hintText: 'Enter Your Username',
                        //     ),
                        //     controller: usernameController,
                        //     validator: (value) {
                        //       if (value == null || value.isEmpty) {
                        //         return 'This field can not be empty';
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        // ),
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
                              }
                              return null;
                            },
                          ),
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
                              labelText: 'Confirm Password',
                              icon: Icon(Icons.lock),
                              hintText: 'Enter Your Password',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field can not be empty';
                              } else if (value !=
                                  passwordController.value.text.trim()) {
                                return 'Doesn\'t match password';
                              }
                              return null;
                            },
                          ),
                        ),
                        // Container(
                        //   margin: const EdgeInsets.all(10),
                        //   child: Column(
                        //     children: [
                        //       // const Text(
                        //       //   'Gender : ',
                        //       //   style: TextStyle(
                        //       //     fontSize: 18,
                        //       //   ),
                        //       //   textAlign: TextAlign.right,
                        //       // ),
                        //       ListTile(
                        //         title: const Text('Male'),
                        //         leading: Radio(
                        //           value: Gender.male,
                        //           groupValue: _gender,
                        //           onChanged: (value) {
                        //             setState(
                        //               () {
                        //                 _gender = value as Gender;
                        //               },
                        //             );
                        //           },
                        //         ),
                        //       ),
                        //       ListTile(
                        //         title: const Text('Female'),
                        //         leading: Radio(
                        //           value: Gender.female,
                        //           groupValue: _gender,
                        //           onChanged: (value) {
                        //             setState(
                        //               () {
                        //                 _gender = value as Gender;
                        //               },
                        //             );
                        //           },
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
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
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () async {
                                if (_signUpKey.currentState!.validate()) {
                                  dynamic result = await _auth.register(
                                      emailController.text.trim(),
                                      passwordController.text.trim());
                                  // if (result == null) {
                                  //   print('Error occured');
                                  // } else {
                                  //   Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) {
                                  //       return Home();
                                  //     }),
                                  //   );
                                  // }
                                  if (result == null) {
                                    print("unsuccessful");
                                  } else {
                                    Navigator.pushNamed(context, '/complete');
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
                              "Already have an account,",
                              style: TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: Color.fromRGBO(155, 96, 220, 1),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/signin');
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
