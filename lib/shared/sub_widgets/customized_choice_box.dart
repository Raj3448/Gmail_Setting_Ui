import 'package:flutter/material.dart';

class CustomizedChoiceBox extends StatelessWidget {
  final bool selected;
  final String text;

  const CustomizedChoiceBox(
      {super.key, required this.selected, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 30,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: 1, color: selected ? Colors.blue : Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              //clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? Colors.blue : Colors.grey,
              ),
            ),
          ),
        ),
        Text(
          "  $text",
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
