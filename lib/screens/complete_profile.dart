import 'package:book_exchange/services/fire_store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompleteProfile extends StatefulWidget {
  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    //final user = Provider.of<Users>(context);
    final UserId = FireStoreServices().uid;
    Map<String, dynamic> User = Map<String, dynamic>();
    final FirstnameController = TextEditingController();
    final LastnameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                alignment: Alignment.topLeft,
                onPressed: () => Navigator.of(context).pop(null),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Complete your Profile',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.black),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'First Name',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                controller: FirstnameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field can not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                  contentPadding:
                      const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                ),
                controller: LastnameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field can not be empty';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      User["Firstname"] = FirstnameController.text;
                      User["Lastname"] = LastnameController.text;

                      print("uid => $UserId");

                      FirebaseFirestore.instance
                          .collection("users")
                          .doc(UserId)
                          .set(User);
                      Navigator.pushNamed(context, '/home');
                    } else {
                      return null;
                    }
                  },
                  padding: const EdgeInsets.all(15.0),
                  color: const Color.fromRGBO(155, 96, 220, 1),
                  child:
                      const Text('Done', style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
