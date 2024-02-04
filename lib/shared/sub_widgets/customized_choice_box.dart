import 'package:flutter/material.dart';

class CustomizedChoiceBox extends StatelessWidget {
  final bool selected;
  final String text;

  const CustomizedChoiceBox(
      {super.key, required this.selected, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: selected ? 20 : 30,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  width: 1, color: selected ? Colors.blue : Colors.grey)),
          child: Padding(
              padding: EdgeInsets.all(selected ? 2 : 7),
              child: selected
                  ? const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.blue,
                    )
                  : null),
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
