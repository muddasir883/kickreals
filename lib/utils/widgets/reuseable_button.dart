import 'package:flutter/material.dart';
import 'package:kick_reels/utils/AppColors/color.dart';

class ReUseAbleButton extends StatefulWidget {
  final bool active;
  final String title;
  const ReUseAbleButton({super.key, required this.title, required this.active});

  @override
  State<ReUseAbleButton> createState() => _ReUseAbleButtonState();
}

class _ReUseAbleButtonState extends State<ReUseAbleButton> {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.sizeOf(context).height * 1;
    // final width = MediaQuery.sizeOf(context).width * 1;
    return Container(
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: widget.active ? AppColors.yellowColor : Colors.grey[50],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.active
                ? AppColors.blackColor
                : AppColors.secondaryTextColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
