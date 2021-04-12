import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _editcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
        backgroundColor: Color(0xff03989E),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              cursorColor: Colors.teal,
              controller: _editcontroller,
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.teal),
                  hintText: "Enter your email",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal))),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                color: Color(0xff03989E),
                onPressed: () {
                  resetPassword(context);
                },
                child: Text(
                  'Reset Password',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void resetPassword(BuildContext context) async {
    if (_editcontroller.text.length == 0 ||
        !_editcontroller.text.contains("@")) {
      Fluttertoast.showToast(msg: "Email Incorrect");
      return;
    }
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _editcontroller.text);
    Fluttertoast.showToast(
        msg: "Please check your email inbox to reset password");
    Navigator.pop(context);
  }
}