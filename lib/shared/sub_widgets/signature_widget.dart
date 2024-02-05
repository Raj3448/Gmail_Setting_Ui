import 'package:flutter/material.dart';
import 'package:gmail_setting_ui/const_file.dart';
import 'package:gmail_setting_ui/provider/signature_provider.dart';
import 'package:gmail_setting_ui/shared/tab_view_widgets/general.dart';
import 'package:provider/provider.dart';
import 'package:zapx/zapx.dart';

class SignatureWidget extends StatelessWidget {
  SignatureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      width: screenSize.width * 0.15,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey)),
                      child: ListView.builder(
                          itemCount: signatureList.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width:screenSize.width * 0.15,
                              height: screenSize.height * 0.06,
                              child: ListTile(
                                title: Text(signatureList[index]),
                                trailing: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.edit,size:30)),
                                    IconButton(onPressed: () {}, icon: const Icon(Icons.delete,size: 30,))
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                        height: screenSize.height * 0.2,
                        width: screenSize.width * 0.24,
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5, color: Colors.grey)))
                  ],
                ),
              TextButton.icon(
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(Size(
                        screenSize.width * 0.156, screenSize.height * 0.06)),
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
                  )).paddingOnly(top: 10)
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
