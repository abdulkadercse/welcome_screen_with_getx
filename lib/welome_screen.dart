import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  RxInt _curentIndex = 0.obs;

  List<String> images = [
    "assets/welcome1.json",
    "assets/welcome2.json",
    "assets/welcome3.json",
  ];

  List<String> title = [
    "Welcome",
    "Categories",
    "Support",
  ];

  List<String> description = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9EDF0),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              flex: 2,
              child: Lottie.asset(
                images[_curentIndex.toInt()],
                height: 258,
                width: 421,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                width: 364,
                height: 314,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffE9EDF0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 15.0,
                        offset: Offset(0.0, 0.75),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Text(
                          title[_curentIndex.toInt()],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Obx(
                        () => Text(
                          description[_curentIndex.toInt()],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => DotsIndicator(
                              dotsCount: title.length,
                              position: _curentIndex.toDouble(),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              if (_curentIndex == 2) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (contex) => HomeScreen()));
                              } else {
                                _curentIndex + 1;
                              }
                            },
                            child: Container(
                              height: 37,
                              width: 37,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffE9EDF0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 5.0,
                                      offset: Offset(0.0, 0.75),
                                    )
                                  ]
                              ),
                              child: Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}
