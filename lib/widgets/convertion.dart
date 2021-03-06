import 'package:flutter/material.dart';

class Convertion extends StatelessWidget {
  const Convertion({
    Key? key,
    required this.convertHandler,
  }) : super(key: key);

  final Function convertHandler;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        convertHandler();
      },
      child: const Text(
        "Konversikan",
        style: TextStyle(fontSize: 20),
      ),
      color: Colors.lightGreen,
      textColor: Colors.black,
      minWidth: double.maxFinite,
      height: 50,
    );
  }
}
