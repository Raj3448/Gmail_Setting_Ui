import 'package:flutter/material.dart';
import 'package:gmail_setting_ui/const_file.dart';
import 'package:zapx/zapx.dart';

class General extends StatefulWidget {
  const General({Key? key}) : super(key: key);

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  String _selectedCountry = "English (US)";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text('Advanced',
                    style: TextStyle(
                        color: Color.fromARGB(255, 94, 94, 94),
                        fontSize: 18,
                        fontWeight: FontWeight.w600))
                .paddingSymmetric(horizontal: 10),
            const Text('Offline',
                    style: TextStyle(
                        color: Color.fromARGB(255, 94, 94, 94),
                        fontSize: 18,
                        fontWeight: FontWeight.w600))
                .paddingSymmetric(horizontal: 10),
            const Text('Themes',
                    style: TextStyle(
                        color: Color.fromARGB(255, 94, 94, 94),
                        fontSize: 18,
                        fontWeight: FontWeight.w600))
                .paddingSymmetric(horizontal: 10),
          ],
        ).paddingOnly(left: 20),
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 243, 245, 247),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          child: ListTile(
            leading: const Text(
              'Language: ',
              style: ConstantClass.textStyle,
            ),
            titleAlignment: ListTileTitleAlignment.top,
            title: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Gmail display language: ',
                      style: ConstantClass.textStyle,
                    ),
                    Container(
                      height: 25,
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(3)),
                      child: DropdownButton<String>(
                          isExpanded: true,
                          value: _selectedCountry,
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedCountry = newValue!;
                            });
                          },
                          underline: const SizedBox(),
                          items: [
                            const DropdownMenuItem<String>(
                              value: 'English (US)',
                              child: Text('  English (US)'),
                            ),
                            ...ConstantClass.countryList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text("  $value"),
                              );
                            }).toList(),
                          ]),
                    ),
                  ],
                )
              ],
            ),
          ),
        ))
      ],
    );
  }
}
