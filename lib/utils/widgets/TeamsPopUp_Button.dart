import 'dart:ui';
import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/views/MyTeams/create_team.dart';

class PopUpTeamsButton extends StatefulWidget {
  const PopUpTeamsButton({super.key});

  @override
  State<PopUpTeamsButton> createState() => _PopUpTeamsButtonState();
}

class _PopUpTeamsButtonState extends State<PopUpTeamsButton> {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.sizeOf(context).height * 1;
    // final width = MediaQuery.sizeOf(context).width * 1;
    return PopupMenuButton(
      icon: const Icon(Icons.more_vert, color: AppColors.blackColor),
      color: AppColors.whiteColor,
      surfaceTintColor: AppColors.whiteColor,
      itemBuilder: (context) => [
        PopupMenuItem(
            value: 1,
            child: ListTile(
              onTap: () {
                Get.to(const CreateTeam());
              },
              title: const Text(
                "Create team",
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
              onTap: () {
                Get.back();
                _showMyCupertinoDialog(context);
              },
              title: const Text(
                "Join existing team",
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

_showMyCupertinoDialog(BuildContext context) {
  return showCupertinoDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Theme(
        data: ThemeData.light(),
        child: Container(
          color: Colors.white.withOpacity(0.5),
          child: CupertinoAlertDialog(
            title: const Text(
              "Join existing team",
              style: TextStyle(
                color: AppColors.yellowColor,
                fontWeight: FontWeight.bold,
                fontSize: 21,
              ),
            ),
            content: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Enter a name for your new game",
                  style: TextStyle(
                    color: AppColors.secondaryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                CupertinoTextField(
                  placeholder: "Enter team code",
                  placeholderStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondaryTextColor,
                  ),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: AppColors.blueColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Join",
                  style: TextStyle(
                    color: AppColors.blueColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
