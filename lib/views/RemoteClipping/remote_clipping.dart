import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/utils/widgets/bottom_bar.dart';
import 'package:kick_reels/views/GameTutorial/player_type.dart';

class RemoteClipping extends StatefulWidget {
  const RemoteClipping({super.key});

  @override
  State<RemoteClipping> createState() => _RemoteClippingState();
}

class _RemoteClippingState extends State<RemoteClipping> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      bottomNavigationBar: persistentBottomBar(0),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whiteColor,
        title: const Text(
          "Remote clipping",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
        leading: const BackButton(color: AppColors.blackColor),
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.065,
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "No available devices",
                  style: TextStyle(
                    color: AppColors.secondaryTextColor,
                    fontSize: 14.5,
                  ),
                ),
                Container(
                  height: 38,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.yellowColor,
                    borderRadius: BorderRadius.circular(width * 0.05),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Select devices",
                      style: TextStyle(
                          color: AppColors.primaryTextTextColor,
                          fontSize: 14.5,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.035,
          ),
          Container(
            height: height * 0.065,
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.075),
                  child: const Text(
                    'Create clips',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.5,
                        color: AppColors.blackColor),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.015,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Play type",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            // height: height*0.075,
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlayerTypeBox(
                      title: 'Wow',
                    ),
                    PlayerTypeBox(
                      title: 'Free Throw',
                    ),
                    PlayerTypeBox(
                      title: '+2',
                    ),
                    PlayerTypeBox(
                      title: '+3',
                    ),
                    PlayerTypeBox(
                      title: 'Assist',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    PlayerTypeBox(
                      title: 'Rebound',
                    ),
                    PlayerTypeBox(
                      title: 'Steal',
                    ),
                    PlayerTypeBox(
                      title: 'Block',
                    ),
                    PlayerTypeBox(
                      title: 'Turnover',
                    ),
                    PlayerTypeBox(
                      title: 'Foul',
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Player",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => const RecordingsSheet());
            },
            child: Container(
              margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              height: height * 0.07,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.02),
                color: Colors.grey.withOpacity(0.4),
              ),
              child: const Text(
                "Start recording",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecordingsSheet extends StatelessWidget {
  const RecordingsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Container(
      height: height * 0.80,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(width * 0.05),
          topRight: Radius.circular(width * 0.05),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Select device",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "It may take up to 20 seconds to search for other devices. Make sure to have the Kick Reels app open ",
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Your device",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primaryTextTextColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: height * 0.015),
              const ReUseAbleTextField(
                title: "john Doe-iphone 14 Pro",
                active: true,
              ),
              SizedBox(height: height * 0.02),
              const ReUseAbleTextField(
                  title: "Recording devices", active: false),
              SizedBox(height: height * 0.02),
              const ReUseAbleTextField(
                  title: "Available devices", active: false),
              SizedBox(height: height * 0.02),
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
      ),
    );
  }
}

class ReUseAbleTextField extends StatefulWidget {
  final String title;
  final bool active;
  const ReUseAbleTextField(
      {super.key, required this.title, required this.active});

  @override
  State<ReUseAbleTextField> createState() => _ReUseAbleTextFieldState();
}

class _ReUseAbleTextFieldState extends State<ReUseAbleTextField> {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Container(
      width: width * 1,
      margin: EdgeInsets.only(left: width * 0.01, right: width * .01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width * 0.015),
          color: widget.active ? Colors.grey[100] : Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 15,
            color: widget.active
                ? Colors.yellow[700]
                : AppColors.primaryTextTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
