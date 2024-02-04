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
  String _selectedFont = "Serif";
  bool _onFocus = false;
  bool _isChecked = false;
  bool _onCursor1 = false;

  List isSelectedStringList = [
    "Right-to-left editing support off",
    "Right-to-left editing support on"
  ];

  List<String> fontList = [
    "Times New Roman",
    "Serif",
    "Arial",
    "Sans-serif",
    "Courier New",
    "Monospaced"
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
          //height: 200,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 243, 245, 247),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16))),
          child: ListView(
            children: [
              ListTile(
                leading: getListTileTitleWidget("Languages:", context),
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
                              decoration:
                                  _onCursor1 ? TextDecoration.underline : null,
                              decorationColor:
                                  const Color.fromARGB(255, 26, 101, 162),
                              decorationThickness: 2.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
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
              const Divider(),
              ListTile(
                titleAlignment: ListTileTitleAlignment.top,
                leading: getListTileTitleWidget("Phone numbers:", context),
                title: Row(
                  children: [
                    const Text(
                      'Default country code:',
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
                              child: Text('  India'),
                            ),
                            ...ConstantClass.countryList
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text("  $value"),
                              );
                            }).toList(),
                          ]),
                    ).marginOnly(left: 10),
                  ],
                ),
              ),
              const Divider(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getListTileTitleWidget("Default text style:", context),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: const Text(
                            '(Use the \'Remove formatting\' button on the toolbar to reset the default text style)',
                            style: TextStyle(
                              fontSize: 14,
                            )),
                      )
                    ],
                  ).paddingOnly(left: 15),
                  Card(
                    color: Colors.white,
                    shape: Border.all(
                      color: Colors.white, // Set the border color
                      width: 0.00, // Set the border width
                    ),
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.15,
                      child: Row(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 100,
                            child: DropdownButton(
                                underline: const SizedBox(),
                                isExpanded: true,
                                items: [
                                  const DropdownMenuItem<String>(
                                    value: "Sans Serif",
                                    child: Text(' Serif'),
                                  ),
                                  ...fontList.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text("  $value"),
                                    );
                                  }).toList(),
                                ],
                                value: _selectedFont,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedFont = value!;
                                  });
                                }),
                          ),
                          SizedBox(
                              height: 100,
                              width: 100,
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Image.asset('assets/images/font.png')))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
            ],
          ).paddingSymmetric(horizontal: 10),
        ))
      ],
    );
  }

  Widget getListTileTitleWidget(String title, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Text(
        title,
        style: ConstantClass.textStylewithBold,
      ),
    );
  }
}
