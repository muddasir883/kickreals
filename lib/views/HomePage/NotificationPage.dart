import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:get/get.dart';
import 'package:kick_reels/utils/widgets/PopupButton.dart';
import 'package:kick_reels/utils/widgets/bottom_bar.dart';

import 'start_recording.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      bottomNavigationBar: persistentBottomBar(0),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: Padding(
          padding: EdgeInsets.only(left: width * 0.03, top: height * 0.006),
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
            child: const Image(
              image: AssetImage("assets/images/splashlogo.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "John Doe",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.primaryTextTextColor),
            ),
            PopUpMenuButton(),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 0.29,
              width: width * 1,
              margin: EdgeInsets.only(left: 15, right: 15, top: height * 0.05),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.03),
                  color: const Color.fromARGB(255, 232, 250, 252)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    top: height * 0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Allow Kick Reels to send notifications",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    const Text(
                      "We would like to notify you when your videos are ready to view and edit, or when other team member have added new video or clips.",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    InkWell(
                      onTap: () {
                        showCustomCupertinoDialog(context);
                      },
                      child: Container(
                        height: height * 0.065,
                        width: width * 0.5,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xFF49dee7),
                            borderRadius: BorderRadius.circular(width * 0.03)),
                        child: const Text(
                          "Allow notifications",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.whiteColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.lightGrey,
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.blackColor,
                        ),
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.lightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showCustomCupertinoDialog(BuildContext context) {
  Get.dialog(
    Theme(
      data: ThemeData.dark(),
      child: CupertinoAlertDialog(
        title: const Text(
          "“Kick Reels” Would Like to Send You Notifications",
          style: TextStyle(color: Colors.white),
        ),
        content: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            "Notifications may include alerts, sounds and icon badges. These can be configured in settings.",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text(
              "Don't Allow",
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          CupertinoDialogAction(
            child: const Text(
              "Allow",
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Get.back();
              showCupertinoDialog(context);
            },
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}

void showCupertinoDialog(BuildContext context) {
  Get.dialog(
    Theme(
      data: ThemeData.dark(),
      child: CupertinoAlertDialog(
        title: const Text(
          "“Kick Reels” Would Like to Use Bluetooth",
          style: TextStyle(color: Colors.white),
        ),
        content: const Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            "Bluetooth is used by the app to talk to other nearby devices and exchange video data between them",
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            child: const Text(
              "Don't Allow",
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Get.back();
            },
          ),
          CupertinoDialogAction(
            child: const Text(
              "Allow",
              style: TextStyle(color: Colors.blue),
            ),
            onPressed: () {
              Get.back();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StartRecording()),
              );
            },
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}
