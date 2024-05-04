import 'package:flutter/material.dart';

class UzunlikPage extends StatefulWidget {
  const UzunlikPage({Key? key}) : super(key: key);

  @override
  State<UzunlikPage> createState() => _UzunlikPageState();
}

class _UzunlikPageState extends State<UzunlikPage> {
  String dropdownvalue1 = "Millimetrlar (mm)";
  String dropdownvalue2 = "Metr (m)";
  String suffixText1 = "mm";
  String suffixText2 = "m";
  double type1 = 1 / 1000;
  double type2 = 1;
  TextEditingController text1Controller = TextEditingController(text: "1");
  TextEditingController text2Controller = TextEditingController(text: "0.001");

  // List of items in our dropdown menu
  var items = [
    'Millimetrlar (mm)',
    'Santimentlar (sm)',
    'Metr (m)',
    'Kilometrlar (km)',
    'Dyuymlar (in)',
    "Fut (ft)",
    "Yard (yd)",
    "Mil (mi)",
    "Dengiz mili (NM)",
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
                      case "mm":
                        type1 = 0.001;
                        break;
                      case "sm":
                        type1 = 0.01;
                        break;
                      case "m":
                        type1 = 1;
                        break;
                      case "km":
                        type1 = 1000;
                        break;
                      case "in":
                        type1 = 0.0254;
                        break;
                      case "ft":
                        type1 = 0.3048;
                        break;
                      case "yd":
                        type1 = 0.9144;
                        break;
                      case "mi":
                        type1 = 1609.344;
                        break;
                      case "NM":
                        type1 = 1852;
                        break;
                    }

                    text2Controller.text =
                        (double.parse(text1Controller.text.toString()) *
                                type1 /
                                type2)
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
                      case "mm":
                        type2 = 0.001;
                        break;
                      case "sm":
                        type2 = 0.01;
                        break;
                      case "m":
                        type2 = 1;
                        break;
                      case "km":
                        type2 = 1000;
                        break;
                      case "in":
                        type2 = 0.0254;
                        break;
                      case "ft":
                        type2 = 0.3048;
                        break;
                      case "yd":
                        type2 = 0.9144;
                        break;
                      case "mi":
                        type2 = 1609.344;
                        break;
                      case "NM":
                        type2 = 1852;
                        break;
                    }
                    text2Controller.text =
                        (double.parse(text1Controller.text.toString()) *
                                type1 /
                                type2)
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
            Expanded(child: SizedBox()),
            Text(
              "Bajardi : DIF 314-21 guruh talabasi Murotov Diyorbek",
              style: TextStyle(
                color: Color(0xff2EFF2E),
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      ),
    );
  }
}
