
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:electro_mania_afnan/Shopping/AppDrawer.dart';
import 'package:electro_mania_afnan/homePage/home3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_feedback/quick_feedback.dart';

class FeedApp extends StatefulWidget {
  static const String id = 'FeedApp';


  @override
  _FeedAppState createState() => _FeedAppState();

}

class _FeedAppState extends State<FeedApp> {
  var F;
  void _showFeedback(context) {
    showDialog(
      context: context,
      builder: (context) {
        return QuickFeedback(
          title: 'Leave a feedback',
          // Title of dialog
          showTextBox: true, // default false
          textBoxHint:
          'Share your feedback', // Feedback text field hint text default: Tell us more
          submitText: 'SUBMIT', // submit button text default: SUBMIT
          onSubmitCallback: (feedback) {
           // print('$feedback');
             F  = ('$feedback');
            print(F);
            // map { rating: 2, feedback: 'some feedback' }
            Navigator.of(context).pop();
          },
          askLaterText: 'ASK LATER',
          onAskLaterCallback: () {
            print('Do something on ask later click');
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Feedback'),
          backgroundColor:  Color(0xff03989E),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Home3()));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: FlatButton(
                onPressed: () => _showFeedback(context),
                child: Column(
                  children: [
                    Image.asset('images/FeedBackNew.png',
               height: 800, ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
  Future FeedBackUser() async {
    final FeedBackUserId = FirebaseFirestore.instance.collection('FeedBack').doc().id;
    await FirebaseFirestore.instance.collection('FeedBack').doc(FeedBackUserId).set({
      'FeedBack': F,
      'FeedBackUserId':FeedBackUserId,

    }).then((value) {});

  }
}