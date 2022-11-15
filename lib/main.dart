import 'package:flutter/material.dart';

import 'Recommendation.dart';
import 'Splash_page.dart';
import 'button_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter DropDownButton',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// Initial Selected Value
  String dropdownvalue = 'Data Science';
  String dropdownvalue1 = '50000-60000';

// List of items in our dropdown menu
  var items = [
    'Data Science',
    'AI',
    'Gaming',
    'Cyber Security',
    'Cloud Computing',
    'Block Chain',
    'Video Editing',
    'IOT Robotics',
    '3D Modeling',
    'Web Development',
    'UI UX',
    'General CS',
    'AR VR',
    'No specialization',
    'Basic coding and casual gaming',
    'Core',
    'Devops',
  ];
  var bugrange = [
    '50000-60000',
    '60000-70000',
    '70000-85000',
    '85 above',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Laptop Recommendation System"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 20, height: 50),
            Text(
              " Usecase of the laptop to be bought  ",
              style: TextStyle(
                  color: Colors.grey, fontSize: 20, fontFamily: 'Roboto'),
            ),
            SizedBox(width: 20, height: 50),
            DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            SizedBox(width: 20, height: 50),
            Text(
              " Enter Estimated Budget ",
              style: TextStyle(
                  color: Colors.grey, fontSize: 20, fontFamily: 'Roboto'),
            ),
            SizedBox(width: 20, height: 50),
            DropdownButton(
              // Initial Value
              value: dropdownvalue1,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: bugrange.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue1 = newValue!;
                });
              },
            ),
            SizedBox(width: 20, height: 50),
            ButtonWidget(
                text: 'Submit',
                onClicked: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Recommendation(chosenValue: dropdownvalue),
                  ));
                }),
          ],
        ),
      ),
    );
  }
}
