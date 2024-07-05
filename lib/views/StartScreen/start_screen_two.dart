import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/utils/widgets/skip_button.dart';
import 'package:kick_reels/views/StartScreen/start_screen_three.dart';

import '../../utils/widgets/border_painter.dart';

class StartScreenTwo extends StatefulWidget {
  const StartScreenTwo({super.key});

  @override
  State<StartScreenTwo> createState() => _StartScreenTwoState();
}

class _StartScreenTwoState extends State<StartScreenTwo> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! > 0) {
          // Swiped right
          Get.back();
        } else if (details.primaryVelocity! <= 0) {
          // Swiped left
          Get.to(transition: Transition.rightToLeft, StartScreenThree());
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: height * .95,
              width: width * 1,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFC8E6C9),
                    Color(0xFFFFF9C4),
                    AppColors.whiteColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SkipButton(),
                    ],
                  ),
                  SizedBox(height: height * 0.1),
                  Container(
                    height: 150,
                    width: 150,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: const Image(
                      image: AssetImage('assets/images/splashlogo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: height * 0.3),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sports Spectacle Unfolded",
                          style: TextStyle(
                            color: AppColors.primaryTextTextColor,
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Unleash the power of record and replay with our innovative app",
                          style: TextStyle(
                            color: AppColors.secondaryTextColor,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.12),
                  Container(
                    margin: EdgeInsets.only(
                      left: width * 0.05,
                      right: width * 0.05,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.18,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.lightGrey,
                                ),
                              ),
                              Container(
                                height: 10,
                                width: 25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.blackColor,
                                ),
                              ),
                              Container(
                                height: 10,
                                width: 10,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColors.lightGrey,
                                ),
                              ),
                              // Container(
                              //   height: 10,
                              //   width: 10,
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(5),
                              //     color: AppColors.lightGrey,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          alignment: Alignment.center,
                          child: CustomPaint(
                            painter: CirclePainter(fillFraction: 0.8),
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(
                                    transition: Transition.rightToLeft,
                                    StartScreenThree());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.yellowColor,
                                padding: const EdgeInsets.all(0),
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
