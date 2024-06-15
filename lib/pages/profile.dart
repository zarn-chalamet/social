import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/firebase/firebase_service.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: firebaseService.getUserDetails(),
        builder: (context, snapshot) {
          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          //error
          else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          //data received
          else if (snapshot.hasData) {
            Map<String, dynamic>? user = snapshot.data!.data();
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: Colors.grey,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 70,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    user!['email'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(user['username'],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            );
          } else {
            return Text("No data!");
          }
        },
      ),
    );
  }
}
