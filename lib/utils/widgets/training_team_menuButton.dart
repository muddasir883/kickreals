import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/views/TrainingTeam/add_player.dart';

class TrainingTeamPopUpMenuButton extends StatefulWidget {
  const TrainingTeamPopUpMenuButton({super.key});

  @override
  State<TrainingTeamPopUpMenuButton> createState() =>
      _TrainingTeamPopUpMenuButtonState();
}

class _TrainingTeamPopUpMenuButtonState
    extends State<TrainingTeamPopUpMenuButton> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert, color: AppColors.blackColor),
      color: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      itemBuilder: (context) => [
        PopupMenuItem(
            value: 1,
            child: ListTile(
              onTap: () {
                Get.to(const AddPlayer());
              },
              title: const Text(
                "Add Player",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )),
        PopupMenuItem(
            value: 2,
            child: ListTile(
              onTap: () async {},
              title: const Text(
                "Invite Others",
                style: TextStyle(
                  color: AppColors.blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )),
      ],
    );
  }
}
