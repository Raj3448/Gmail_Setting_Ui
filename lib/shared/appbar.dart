import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  final String title;
  const MyAppbar({Key? key,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.1,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 71, 70, 70),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16))),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              title,
              style:const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )),
    );
  }
}
