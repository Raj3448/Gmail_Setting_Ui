import 'package:flutter/material.dart';
import 'package:gmail_setting_ui/const_file.dart';
import 'package:gmail_setting_ui/provider/signature_provider.dart';
import 'package:gmail_setting_ui/shared/tab_view_widgets/general.dart';
import 'package:provider/provider.dart';
import 'package:zapx/zapx.dart';

class SignatureWidget extends StatefulWidget {
  SignatureWidget({Key? key}) : super(key: key);

  @override
  State<SignatureWidget> createState() => _SignatureWidgetState();
}

class _SignatureWidgetState extends State<SignatureWidget> {
  List<String> fontList = [
    "Times New Roman",
    "Serif",
    "Arial",
    "Sans-serif",
    "Courier New",
    "Monospaced"
  ];
  String _selectedFont = "Serif";
  String _signature = "No Signature";

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getListTileTitleWidget("Signature:", context),
            SizedBox(
              width: screenSize.width * 0.15,
              child: const Text(
                  '(appended at the end of all outgoing messages)Learn more',
                  style: TextStyle(
                    fontSize: 14,
                  )),
            )
          ],
        ).paddingOnly(left: 15),
        Consumer<SignatureProvider>(builder: (context, signatures, child) {
          final signatureList = signatures.getSignatureList;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (signatureList.isEmpty)
                const Text(
                  'No Signature',
                  style: ConstantClass.textStylewithBold,
                ),
              if (signatureList.isNotEmpty)
                Row(
                  children: [
                    Container(
                      height: screenSize.height * 0.2,
                      width: screenSize.width * 0.17,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey)),
                      child: ListView.builder(
                          itemCount: signatureList.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: screenSize.width * 0.14,
                              height: screenSize.height * 0.06,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: screenSize.width * 0.04,
                                    child: Text(
                                      signatureList[index],
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 18),
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: screenSize.width * 0.06,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.edit,
                                                size: 25)),
                                        IconButton(
                                            onPressed: () {
                                              signatures.removeSignature(
                                                  signatureList[index]);
                                            },
                                            icon: const Icon(
                                              Icons.delete_outline_rounded,
                                              size: 25,
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(horizontal: 10, vertical: 3),
                            );
                          }),
                    ),
                    Container(
                      height: screenSize.height * 0.2,
                      width: screenSize.width * 0.3,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey)),
                      child: Column(
                        children: [
                          Container(
                            height: screenSize.height * 0.14,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.5, color: Colors.grey)),
                            child: const TextField(
                              maxLines: 10,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              )),
                            ),
                          ),
                          SizedBox(
                            height: screenSize.height * 0.05,
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
                          )
                        ],
                      ),
                    )
                  ],
                ),
              TextButton.icon(
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(
                        screenSize.width * 0.166, screenSize.height * 0.06)),
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
                  onPressed: () => _showVirtualWindow(context),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.blue,
                  ),
                  label: const Text(
                    'Create new',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )).paddingOnly(top: 10),
              if (signatureList.isNotEmpty)
                const Text(
                  'Signature defaults',
                  style: ConstantClass.textStylewithBold,
                ),
              if (signatureList.isNotEmpty)
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('FOR NEW EMAILS USE'),
                        Container(
                          height: 25,
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 0.8,
                              ),
                              borderRadius: BorderRadius.circular(3)),
                          child: DropdownButton<String>(
                              isExpanded: true,
                              value: _signature,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _signature = newValue!;
                                });
                              },
                              underline: const SizedBox(),
                              items: [
                                const DropdownMenuItem<String>(
                                  value: 'No Signature',
                                  child: Text('  English (US)'),
                                ),
                                ...signatures.getSignatureList
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
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('ON REPLY/FORWARD USE'),
                        Container(
                          height: 25,
                          width: 200,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 0.8,
                              ),
                              borderRadius: BorderRadius.circular(3)),
                          child: DropdownButton<String>(
                              isExpanded: true,
                              value: _signature,
                              onChanged: (String? newValue) {
                                setState(() {
                                  _signature = newValue!;
                                });
                              },
                              underline: const SizedBox(),
                              items: [
                                const DropdownMenuItem<String>(
                                  value: 'No Signature',
                                  child: Text('  English (US)'),
                                ),
                                ...signatures.getSignatureList
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
                    )
                  ],
                ),
              if (signatureList.isNotEmpty)
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
                      'Insert signature before quoted text in replies and remove the "--" line that precedes it.',
                      style: ConstantClass.textStyleWithThin,
                    ),
                  ],
                )
            ],
          );
        })
      ],
    );
  }
}

void _showVirtualWindow(BuildContext context) {
  String? signatureText;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1.0),
        ),
        title: const Text('Name new signature'),
        content: Container(
          height: 100,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 60,
                width: 400,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Signature name',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide:
                              const BorderSide(width: 1, color: Colors.grey)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 1, 103, 185)))),
                  onChanged: (value) {
                    signatureText = value;
                  },
                  onSubmitted: (value) {},
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel')),
                  const SizedBox(width: 10),
                  ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 0, 130, 252))),
                      onPressed: () {
                        if (signatureText != null) {
                          Provider.of<SignatureProvider>(context, listen: false)
                              .addSignature(signatureText!);
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Create',
                          style: TextStyle(color: Colors.white)))
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
