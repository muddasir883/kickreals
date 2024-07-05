// training_team.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/utils/widgets/bottom_bar.dart';
import 'package:kick_reels/utils/widgets/training_team_menuButton.dart';

import '../../Controller/TrainingTeamController/training_team_controller.dart';

class TrainingTeam extends GetView<TrainingTeamController> {
  const TrainingTeam({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      bottomNavigationBar: persistentBottomBar(3),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Training teams",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.1),
                child: const TrainingTeamPopUpMenuButton(),
              ),
            ],
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
            child: Padding(
              padding: EdgeInsets.only(
                left: width * 0.075,
                right: width * 0.075,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Players only',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.5,
                      color: AppColors.blackColor,
                    ),
                  ),
                  CupertinoSwitch(
                    activeColor: AppColors.blueColor,
                    value: true,
                    onChanged: (value) {
                      // Implement your logic here if needed
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: height * 0.025),
          Expanded(
            child: ListView.builder(
              itemCount: controller.teamMembers.length,
              itemBuilder: (context, index) {
                final member = controller.teamMembers[index];
                return Container(
                  color: Colors.grey[100],
                  child: ListTile(
                    leading: Container(
                      height: 32,
                      width: 32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black54,
                      ),
                      child: const Text(
                        "J",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.yellowColor,
                        ),
                      ),
                    ),
                    title: Text(
                      member.email,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryTextTextColor,
                      ),
                    ),
                    subtitle: Text(
                      member.role,
                      style: const TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.normal,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.blackColor,
                      size: 20,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
