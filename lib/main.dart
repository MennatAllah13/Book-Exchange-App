import 'package:book_exchange/screens/base.dart';
import 'package:book_exchange/screens/complete_profile.dart';
import 'package:book_exchange/screens/first.dart';
import 'package:book_exchange/screens/homepage.dart';
import 'package:book_exchange/screens/sign_in.dart';
import 'package:book_exchange/screens/view_book.dart';
import 'package:book_exchange/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/error_screen.dart';
import 'screens/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _fbApp = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(),
        ),
        StreamProvider(
          create: (context) => context.read<AuthenticationService>().user,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return ErrorScreen();
            } else if (snapshot.hasData) {
              return AuthenticationWrapper();
            } else {
              return LoadingScreen();
            }
          },
        ),
        debugShowCheckedModeBanner: false,
        // initialRoute: '/',
        // //home: First(),
        routes: {
          '/first': (context) => First(),
          '/signin': (context) => Login(),
          '/signup': (context) => SignUp(),
          // '/home': (context) => Home(),
          '/viewBook': (context) => ViewBook(),
          '/complete': (context) => CompleteProfile(),
          '/homepage': (context) => HomePage(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return Home();
    }
    //return First();
    return Home();
  }
}

// class AuthenticationWrapper extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     User? user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       return Home();
//     }
//     return Login();
//   }
// }