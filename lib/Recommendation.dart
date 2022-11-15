import 'dart:convert';

import 'package:compy/models/laptop_recommendation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';
import 'package:get/get.dart';

class Recommendation extends StatefulWidget {
  String chosenValue;

  Recommendation({super.key, required this.chosenValue});

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  Rx<LaptopRecommendation?> recommendation = Rx(null);

  String getUrl() {
    String field = widget.chosenValue.replaceAll(' ', '_').toLowerCase();
    return "http://127.0.0.1:5675/api/v1/?field=$field";
  }

  void fetchdata() async {
    final response = await get(Uri.parse(getUrl()));
    Map<String, dynamic> json = jsonDecode(response.body);

    recommendation.value = LaptopRecommendation.fromJson(json);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdata();
  }

  // var url =  host + feild;
  @override
  Widget build(BuildContext context) {
    // if (recommendation.value == null) return Container(color: Colors.white, child: Center(child: CircularProgressIndicator()));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recommendations"),
      ),
      body: Center(
        child: Obx(() =>  recommendation.value == null ? CircularProgressIndicator() : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Processor",
              style: TextStyle(
                  color: Colors.grey, fontSize: 20, fontFamily: 'Roboto'),
            ),
            SizedBox(width: 20, height: 20),
            Obx(() => Text(recommendation.value?.processor ?? '', )),
            SizedBox(width: 20, height: 20),
             Text(
              "Processor Importance Level",
              style: TextStyle(
                  color: Colors.grey, fontSize: 18, fontFamily: 'Roboto'),
            ),
            Obx(() => Text(recommendation.value?.priorityProcessor.toString() ?? '')),
            SizedBox(width: 20, height: 20),
             Text(
              "Graphics Card",
              style: TextStyle(
                  color: Colors.grey, fontSize: 20, fontFamily: 'Roboto'),
            ),
            SizedBox(width: 20, height: 20),
            Obx(() => Text(recommendation.value?.gpu ?? '')),
            SizedBox(width: 20, height: 20),
            Text(
              "Graphics Card Importance Level",
              style: TextStyle(
                  color: Colors.grey, fontSize: 18, fontFamily: 'Roboto'),
            ),
            Obx(() => Text(recommendation.value?.priorityGpu.toString() ?? '')),
            SizedBox(width: 20, height: 20),
             Text(
              "RAM",
              style: TextStyle(
                  color: Colors.grey, fontSize: 20, fontFamily: 'Roboto'),
            ),
            SizedBox(width: 20, height: 20),
            Obx(() => Text(recommendation.value?.ram ?? '')),
            SizedBox(width: 20, height: 20),
            Text(
              "RAM Importance Level",
              style: TextStyle(
                  color: Colors.grey, fontSize: 18, fontFamily: 'Roboto'),
            ),
            Obx(() => Text(recommendation.value?.priorityRam.toString() ?? '')),
            SizedBox(width: 20, height: 20),
            Text(
              "Operating System",
              style: TextStyle(
                  color: Colors.grey, fontSize: 20, fontFamily: 'Roboto'),
            ),
            SizedBox(width: 20, height: 20),
            Obx(() => Text(recommendation.value?.os ?? '')),
            SizedBox(width: 20, height: 20),
            Text(
              "OS Importance Level",
              style: TextStyle(
                  color: Colors.grey, fontSize: 18, fontFamily: 'Roboto'),
            ),
            Obx(() => Text(recommendation.value?.priorityOs.toString() ?? '')),

            
          ],
        ),
      )),
    );
  }
}
