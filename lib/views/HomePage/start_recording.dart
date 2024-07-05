import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:get/get.dart';
import 'package:kick_reels/utils/widgets/PopupButton.dart';
import 'package:kick_reels/utils/widgets/bottom_bar.dart';
import 'package:kick_reels/views/GameTutorial/game_tutorial_main.dart';

class StartRecording extends StatefulWidget {
  const StartRecording({super.key});

  @override
  State<StartRecording> createState() => _StartRecordingState();
}

class _StartRecordingState extends State<StartRecording> {
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
              height: height * 0.25,
              width: width * 1,
              margin: EdgeInsets.only(left: 15, right: 15, top: height * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.03),
                color: AppColors.yellowColor.withOpacity(0.15),
              ),
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
                      "Welcome to Kick Reels",
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
                      "Your team has not recorded any video yet. Tap the button below to create a new one!",
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
                        showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              const CameraRecordingModeBottomSheet(),
                        );
                      },
                      child: Container(
                        height: height * 0.065,
                        width: width * 0.45,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.yellowColor,
                            borderRadius: BorderRadius.circular(width * 0.03)),
                        child: const Text(
                          "Start recording",
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

class CameraRecordingModeBottomSheet extends StatelessWidget {
  const CameraRecordingModeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Container(
      height: height * 0.85,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(width * 0.05),
          topRight: Radius.circular(width * 0.05),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Camera recording mode",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.03),
            InkWell(
              onTap: () {
                Get.to(const GameTutorialMain());
              },
              child: const _RecordingModeOption(
                title: "Single camera recording",
                description:
                    "Standard recording where you operate the camera to track the action. Tap the highlight button to create highlights in real-time.",
                svgAssetPath: 'assets/images/camera.svg',
              ),
            ),
            SizedBox(height: height * 0.03),
            const _RecordingModeOption(
              title: "Full Field recording",
              description:
                  "Record using two iPhones, a stand mount and our AI technology to capture operator. Tap the highlights button to create highlights in real time.",
              svgAssetPath: 'assets/images/camera_recording.svg',
            ),
            SizedBox(height: height * 0.03),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: height * 0.07,
                width: width * 1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(width * 0.03)),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      color: AppColors.secondaryTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecordingModeOption extends StatelessWidget {
  final String svgAssetPath;
  final String title;
  final String description;

  const _RecordingModeOption({
    required this.svgAssetPath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 3, right: 5),
              child: SvgPicture.asset(
                svgAssetPath,
                width: 20,
                height: 20,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
