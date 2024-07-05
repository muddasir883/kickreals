import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/views/FAQ/contact.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({super.key});

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    // final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "FAQ",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.primaryTextTextColor),
        ),
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () {
              Get.to(const ContactPage());
            },
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: Colors.black, width: 1.5)),
              child: const Icon(
                Icons.question_mark,
                color: Colors.black,
                size: 20,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.06,
            color: Colors.grey[100],
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Getting the Kick Reels",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Column(
            children: [
              TextWidget(),
              TextWidget(),
              TextWidget(),
              TextWidget(),
              TextWidget(),
              TextWidget(),
              TextWidget(),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: height * 0.06,
            color: Colors.grey[100],
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Getting the Kick Reels",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Column(
            children: [
              TextWidget(),
              TextWidget(),
              TextWidget(),
              TextWidget(),
              TextWidget(),
              TextWidget(),
              TextWidget(),
            ],
          ),
        ],
      ),
    );
  }
}

class TextWidget extends StatefulWidget {
  const TextWidget({super.key});

  @override
  State<TextWidget> createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Container(
      width: width * 1,
      margin: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 15,
          ),
          Container(
            height: 5,
            width: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5), color: Colors.grey),
          ),
          const Text(
            "Sed ut perspiciatis unde omnis iste natus?",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: AppColors.secondaryTextColor,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
