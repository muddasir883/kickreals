// add_player.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick_reels/utils/widgets/bottom_bar.dart';
import 'package:kick_reels/views/TrainingTeam/manager.dart';
import '../../Controller/TrainingTeamController/add_player_controller.dart';
import '../../utils/AppColors/color.dart';

class AddPlayer extends GetView<AddPlayerController> {
  const AddPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      bottomNavigationBar: persistentBottomBar(3),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Add Player",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: const BackButton(color: AppColors.blackColor),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.025),
          Padding(
            padding: EdgeInsets.only(left: width * 0.05),
            child: const Text(
              "Name",
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.normal,
                color: AppColors.primaryTextTextColor,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            child: TextFormField(
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                color: AppColors.secondaryTextColor,
              ),
              controller: controller.playerNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Enter Full Name",
                hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: AppColors.secondaryTextColor,
                ),
                fillColor: Colors.grey[100],
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.yellowColor),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.015),
          Padding(
            padding: EdgeInsets.only(left: width * 0.05),
            child: const Text(
              "Number",
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.normal,
                color: AppColors.primaryTextTextColor,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Container(
            margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            child: TextFormField(
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                color: AppColors.secondaryTextColor,
              ),
              controller: controller.playerNumberController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "#",
                hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: AppColors.secondaryTextColor,
                ),
                fillColor: Colors.grey[100],
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.yellowColor),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.065),
          InkWell(
            onTap: () {
              controller.savePlayer();
              // You can add more logic here if needed
            },
            child: Container(
              margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              height: height * 0.07,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.02),
                color: AppColors.yellowColor,
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.025),
          InkWell(
            onTap: () {
              Get.to(const Manager());
            },
            child: Container(
              margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              height: height * 0.07,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.02),
                color: Colors.grey[200],
              ),
              child: const Text(
                "Save & Invite",
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
