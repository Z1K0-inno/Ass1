import 'package:flutter/cupertino.dart';

import 'JokeClass.dart';

class JokeWidget extends StatelessWidget {
  final Future<JokeClass> joke;

  const JokeWidget(
    this.joke, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(Uri.https('api.chucknorris.io',
                  '/img/chucknorris_logo_coloured_small.png')
              .toString()),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<JokeClass>(
            future: joke,
            builder: (context, snapshot) {
              return Text(snapshot.hasData
                  ? snapshot.data!.value
                  : snapshot.hasError
                      ? 'ERROR: ${snapshot.error}'
                      : "Loading...");
            },
          ),
        ],
      ),
    );
  }
}
