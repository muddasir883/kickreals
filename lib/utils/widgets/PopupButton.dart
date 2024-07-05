import 'package:flutter/material.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:get/get.dart';
import 'package:kick_reels/views/RemoteClipping/remote_clipping.dart';

class PopUpMenuButton extends StatefulWidget {
  const PopUpMenuButton({super.key});

  @override
  State<PopUpMenuButton> createState() => _PopUpMenuButtonState();
}

class _PopUpMenuButtonState extends State<PopUpMenuButton> {
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
                Navigator.pop(context);
              },
              title: const Text(
                "Film Video",
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
              onTap: () async {
                Get.to(const RemoteClipping());
              },
              title: const Text(
                "Remote",
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
