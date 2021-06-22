import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'home.dart';

class WelcomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ยินดีต้อนทรัพย์"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Text(
                auth.currentUser!.email!,
                style: TextStyle(fontSize: 25),
              ),
              ElevatedButton(
                  onPressed: () {
                    auth.signOut().then((value) {
                      Fluttertoast.showToast(
                        msg: "ออกจากระบบเรียบร้อยแล้ว",
                        gravity: ToastGravity.CENTER,
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }),
                      );
                    });
                  },
                  child: Text("ออกจากระบบ"))
            ],
          ),
        ),
      ),
    );
  }
}
