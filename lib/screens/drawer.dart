import 'package:book_exchange/services/authentication_service.dart';
import 'package:book_exchange/services/fire_store_services.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserId = FireStoreServices().uid;

    if (UserId != "I8z99kV7xofwYnJ6nsRLXbR9Hyc2") {
      return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(155, 96, 220, 1),
                ),
                child: Column(
                  children: [
                    Material(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/profileimg.png',
                            height: 90, width: 90),
                      ),
                    ),
                  ],
                )),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('My Books'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.save),
              title: const Text('Wish List'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Sign Out'),
              onTap: AuthenticationService().signout,
            ),
          ],
        ),
      );
    } else {
      return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(155, 96, 220, 1),
                ),
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/profileimg.png',
                            height: 90, width: 90),
                      ),
                    ),
                  ],
                )),
            ListTile(
              leading: const Icon(Icons.pages),
              title: const Text('Reports'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text('Sign Out'),
              onTap: AuthenticationService().signout,
            ),
          ],
        ),
      );
    }
  }
}
