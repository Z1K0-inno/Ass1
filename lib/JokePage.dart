import 'package:flutter/material.dart';

import 'JokeClass.dart';
import 'JokeWidget.dart';
import 'BottomBar.dart';


class JokePage extends StatefulWidget {
  const JokePage({Key? key}) : super(key: key);

  @override
  _JokePageState createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {
  late Future<JokeClass> jokeShow;
  late Future<JokeClass> jokePreload;
  late int count = 0;
  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    jokeShow = getJoke();
    jokePreload = getJoke();
  }

  void update() {
    setState(() {
      jokeShow = jokePreload;
      jokePreload = getJoke();
      count++;
    });
  }

  Container makeJoke(Future<JokeClass> joke, bool action) => Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.65,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.all(Radius.circular(18)),
        gradient: action
            ? LinearGradient(
          colors: const [Colors.white, Colors.redAccent],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [1 - 0.3 * progress, 1],
        )
            : null,
      ),
      child: JokeWidget(joke));

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            makeJoke(jokePreload, false),
            Dismissible(
              onUpdate: (details) {
                setState(() {
                  progress = details.progress;
                });
              },
              key: Key("$count"),
              child: makeJoke(jokeShow, true),
              onDismissed: (direction) {
                progress = 0.0;
                update();
              },
            ),
          ],
        ),
        BottomBar(update),
      ],
    );
  }
}
