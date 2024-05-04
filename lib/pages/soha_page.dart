import 'package:flutter/material.dart';
class SohaPage extends StatefulWidget {
  const SohaPage({Key? key}) : super(key: key);

  @override
  State<SohaPage> createState() => _SohaPageState();
}

class _SohaPageState extends State<SohaPage> {


  String dropdownvalue1 = "Ar (a)";
  String dropdownvalue2 = "Metr kvadrat (m2)";
  String suffixText1 = "a";
  String suffixText2 = "m2";
  double type1 = 100;
  double type2 = 1;
  TextEditingController text1Controller = TextEditingController(text: "1");
  TextEditingController text2Controller = TextEditingController(text: "100");

  // List of items in our dropdown menu
  var items = [
    'Akr (ac)',
    'Ar (a)',
    'Gektar (ha)',
    'Sanimetr kvadrat (sm2)',
    'Fut kvadrat (ft2)',
    "Dyum kvadrat (in2)",
    "Metr kvadrat (m2)",
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton(
                value: dropdownvalue1,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue1 = newValue!;
                    suffixText1 = newValue
                        .split("(")[1]
                        .substring(0, newValue.split("(")[1].length - 1);
                    switch (suffixText1) {
                      case "ac":
                        type1 = 4046.8564224;
                        break;
                      case "a":
                        type1 = 100;
                        break;
                      case "ha":
                        type1 = 10000;
                        break;
                      case "sm2":
                        type1 = 0.0001;
                        break;
                      case "ft2":
                        type1 = 0.09290304;
                        break;
                      case "in2":
                        type1 = 0.00064516;
                        break;
                      case "m2":
                        type1 = 1;
                        break;
                    }

                    text2Controller.text =
                        (double.parse(text1Controller.text.toString()) * type1 / type2)
                            .toString();

                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: text1Controller,
              keyboardType: TextInputType.number,
              cursorColor: Color(0xff2EFF2E),
              textAlign: TextAlign.end,
              autofocus: true,
              focusNode: FocusNode(skipTraversal: true),
              onChanged: (inputText) {
                if (inputText == "") text2Controller.text = " ";
                text2Controller.text =
                    (double.parse(inputText.toString()) * type1 / type2)
                        .toString();
              },
              decoration: InputDecoration(
                suffix: Text(suffixText1),
              ),
            ),
            const SizedBox(height: 40),
            DropdownButtonHideUnderline(
              child: DropdownButton(
                value: dropdownvalue2,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue2 = newValue!;
                    suffixText2 = newValue
                        .split("(")[1]
                        .substring(0, newValue.split("(")[1].length - 1);
                    switch (suffixText2) {
                      case "ac":
                        type2 = 4046.8564224;
                        break;
                      case "a":
                        type2 = 100;
                        break;
                      case "ha":
                        type2 = 10000;
                        break;
                      case "sm2":
                        type2 = 0.0001;
                        break;
                      case "ft2":
                        type2 = 0.09290304;
                        break;
                      case "in2":
                        type2 = 0.00064516;
                        break;
                      case "m2":
                        type2 = 1;
                        break;
                    }
                    text2Controller.text =
                        (double.parse(text1Controller.text.toString()) * type1 / type2)
                            .toString();
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: text2Controller,
              keyboardType: TextInputType.number,
              cursorColor: Color(0xff2EFF2E),
              textAlign: TextAlign.end,
              onChanged: (inputText) {
                if (inputText == "") text1Controller.text = " ";
                text1Controller.text =
                    (double.parse(inputText.toString()) * type2 / type1)
                        .toString();
              },
              decoration: InputDecoration(
                suffix: Text(suffixText2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
