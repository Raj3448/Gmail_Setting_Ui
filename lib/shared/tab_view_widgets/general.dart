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

  List imageList = [
    "star.png",
    "star (1).png",
    "star (3).png",
    "star (4).png",
    "star (5).png",
    "warning.png",
    "right.png"
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
                    SingleChildScrollView(
                      child: Row(
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
                    SingleChildScrollView(
                      child: Row(
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
                title: SingleChildScrollView(
                  child: Row(
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
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
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
                      color: Colors.white,
                      width: 0.00,
                    ),
                    elevation: 5,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
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
                                        ...fontList
                                            .map<DropdownMenuItem<String>>(
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
                                    height: 40,
                                    width: 40,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/images/font.png',
                                          color: Colors.grey,
                                        ))),
                                SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/images/technology.png',
                                          color: Colors.grey,
                                        ))),
                                SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          'assets/images/text.png',
                                          color: Colors.grey,
                                        ))),
                                //
                              ],
                            ),
                          ),
                          const Text(
                                  'This is what your body text will look like.')
                              .paddingOnly(left: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(),
              ListTile(
                titleAlignment: ListTileTitleAlignment.top,
                leading: getListTileTitleWidget("Stars:", context),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Drag the stars between the lists.  The stars will rotate in the order shown below when you click successively. To learn the name of a star for search, hover your mouse over the image.',
                      style: ConstantClass.textStylewithBold,
                    ),
                    const Row(
                      children: [
                        Text('Presets:'),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '1 Stars    ',
                          style: TextStyle(color: Colors.blue),
                        ),
                        Text('4 Stars    ',
                            style: TextStyle(color: Colors.blue)),
                        Text('all Stars    ',
                            style: TextStyle(color: Colors.blue))
                      ],
                    ),
                    Row(
                      children: [
                        const Text('In Use:    ',
                            style: ConstantClass.textStylewithBold),
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset('assets/images/star.png',
                                  fit: BoxFit.cover)
                              .paddingAll(5),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Not in Use:  ',
                            style: ConstantClass.textStylewithBold),
                        SizedBox(
                          height: 20,
                          width: 400,
                          child: Center(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: imageList.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: Image.asset(
                                              'assets/images/${imageList[index]}'))
                                      .paddingAll(2);
                                }),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getListTileTitleWidget("Signature:", context),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.15,
                        child: const Text(
                            '(appended at the end of all outgoing messages)Learn more',
                            style: TextStyle(
                              fontSize: 14,
                            )),
                      )
                    ],
                  ).paddingOnly(left: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'No Signature',
                        style: ConstantClass.textStylewithBold,
                      ),
                      TextButton.icon(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                side: const BorderSide(color: Colors.black),
                              ),
                            ),
                            side: MaterialStateProperty.all<BorderSide>(
                              const BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                          label: const Text(
                            'Create new',
                            style: TextStyle(color: Colors.blue, fontSize: 18,fontWeight: FontWeight.bold),
                          )).paddingOnly(top: 10)
                    ],
                  )
                ],
              ),
              const Divider()
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
