import 'package:flutter/material.dart';

import 'JokePage.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.lightBlue),
      home: MainScaffold(),
    );
  }
}

class MainScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          Container(
              padding: const EdgeInsets.all(3),
              child: IconButton(
                  onPressed: () {
                    callShowDialog(context);
                  },
                  icon: const Icon(Icons.info)))
        ],
        title: const Text('ChucksJoke'),
      ),
      body: const SafeArea(child: JokePage()),
    );
  }


  static const aboutMe =
      "Hi My name is Zein. I am from Kazakhstan, and 19 years old. "
      "I'm 19 years old average guy from Kazakhstan. I like playing football "
      "and table tennis and really love to watch Japanese anime. I guess "
      "programming is not for me :'( For now I dont have any interests in "
      "programming and I dont take pleasure from codding. I'm really lost. "
      "I'm trying, but its hard to find my own way in this life.";

  void callShowDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(aboutMe),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close')),
                ],
              ),
            ),
          );
        });
  }
}