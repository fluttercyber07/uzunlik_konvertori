import 'package:flutter/material.dart';
class HajmPage extends StatefulWidget {
  const HajmPage({Key? key}) : super(key: key);

  @override
  State<HajmPage> createState() => _HajmPageState();
}

class _HajmPageState extends State<HajmPage> {


  String dropdownvalue1 = "Gallon (gal)";
  String dropdownvalue2 = "Litr (l)";
  String suffixText1 = "gal";
  String suffixText2 = "l";
  double type1 = 4.54609;
  double type2 = 1;
  TextEditingController text1Controller = TextEditingController(text: "1");
  TextEditingController text2Controller = TextEditingController(text: "4.54609");

  // List of items in our dropdown menu
  var items = [
    'Gallon (gal)',
    'Litr (l)',
    'Millilitr (ml)',
    'Santimetr kub (sm3)',
    'Metr kub (m3)',
    "Dyum kub (in3)",
    "Fut kub (ft3)",
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
                      case "gal":
                        type1 = 4.54609;
                        break;
                      case "l":
                        type1 = 1;
                        break;
                      case "ml":
                        type1 = 0.0001;
                        break;
                      case "sm3":
                        type1 = 0.001;
                        break;
                      case "m3":
                        type1 = 1000;
                        break;
                      case "in3":
                        type1 = 0.016387064;
                        break;
                      case "ft3":
                        type1 = 28.316846592;
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
                      case "gal":
                        type2 = 4.54609;
                        break;
                      case "l":
                        type2 = 1;
                        break;
                      case "ml":
                        type2 = 0.0001;
                        break;
                      case "sm3":
                        type2 = 0.001;
                        break;
                      case "m3":
                        type2 = 1000;
                        break;
                      case "in3":
                        type2 = 0.016387064;
                        break;
                      case "ft3":
                        type2 = 28.316846592;
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
