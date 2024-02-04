import 'package:flutter/material.dart';
import 'package:gmail_setting_ui/const_file.dart';
import 'package:gmail_setting_ui/shared/sub_widgets/customized_choice_box.dart';
import 'package:zapx/zapx.dart';

class General extends StatefulWidget {
  const General({Key? key}) : super(key: key);

  @override
  State<General> createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  String _selectedCountry = "English (US)";
  bool _onFocus = false;
  bool _isChecked = false;
  bool _onCursor1 = false;

  List isSelectedStringList = [
    "Right-to-left editing support off",
    "Right-to-left editing support on"
  ];

  List<bool> isSelectedList = List.generate(2, (index) => false);

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
                .paddingSymmetric(horizontal: 8),
            const Text('Offline',
                    style: TextStyle(
                        color: Color.fromARGB(255, 94, 94, 94),
                        fontSize: 18,
                        fontWeight: FontWeight.w600))
                .paddingSymmetric(horizontal: 8),
            const Text('Themes',
                    style: TextStyle(
                        color: Color.fromARGB(255, 94, 94, 94),
                        fontSize: 18,
                        fontWeight: FontWeight.w600))
                .paddingSymmetric(horizontal: 8),
          ],
        ).paddingOnly(left: 20),
        Expanded(
            child: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 243, 245, 247),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.15,
                    child: const Text(
                      'Language: ',
                      style: ConstantClass.textStylewithBold,
                    ),
                  ),
                  titleAlignment: ListTileTitleAlignment.top,
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Gmail display language: ',
                            style: ConstantClass.textStylewithBold,
                          ),
                          Container(
                            height: 25,
                            width: 350,
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
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text("  $value"),
                                    );
                                  }).toList(),
                                ]),
                          ),
                        ],
                      ),
                      MouseRegion(
                        onEnter: (val) {
                          setState(() {
                            _onFocus = true;
                          });
                        },
                        onExit: (val) {
                          setState(() {
                            _onFocus = false;
                          });
                        },
                        child: Text(
                          "Change language settings for other Google products",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            decoration:
                                _onFocus ? TextDecoration.underline : null,
                            decorationColor:
                                const Color.fromARGB(255, 26, 101, 162),
                            decorationThickness: 2.0,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: Colors.white,
                            activeColor: Colors.blue,
                            value: _isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                _isChecked = value!;
                              });
                            },
                          ),
                          const Text(
                            'Enable input tools',
                            style: ConstantClass.textStylewithBold,
                          ),
                          const Text(
                            ' - Use various text input tools to type in the language of your choice',
                            style: TextStyle(),
                          ),
                          MouseRegion(
                            onEnter: (val) {
                              setState(() {
                                _onCursor1 = true;
                              });
                            },
                            onExit: (val) {
                              setState(() {
                                _onCursor1 = false;
                              });
                            },
                            child: Text(
                              ' - Edit tools - Learn more',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                                decoration: _onCursor1
                                    ? TextDecoration.underline
                                    : null,
                                decorationColor:
                                    const Color.fromARGB(255, 26, 101, 162),
                                decorationThickness: 2.0,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: isSelectedList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedList = List.generate(
                                      isSelectedList.length, (i) => false);
                                  isSelectedList[index] = true;
                                });
                              },
                              child: CustomizedChoiceBox(
                                selected: isSelectedList[index],
                                text: isSelectedStringList[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 10),
          ),
        ))
      ],
    );
  }
}
