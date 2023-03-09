import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final void Function() update;

  const BottomBar(this.update, {Key? key})
      : super(key: key);

  GestureDetector makeIconButton(
    bool like,
  ) {
    return GestureDetector(
        onTap: update,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                  side: const BorderSide(width: 5, color: Colors.red))),
          child: Center(
            child: Icon(
              like ? Icons.favorite : Icons.close_sharp,
              size: 50,
              color: Colors.red,
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [makeIconButton(true), makeIconButton(false)],
    );
  }
}
