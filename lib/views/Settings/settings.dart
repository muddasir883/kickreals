import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/utils/widgets/bottom_bar.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool wifi = true;
  bool record = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: persistentBottomBar(3),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.primaryTextTextColor),
        ),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              "Clip video",
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.normal,
                color: AppColors.secondaryTextColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: AppColors.whiteColor,
                    builder: (context) => const QualityOptions());
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const ListTile(
                    title: Text(
                      "Quality",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryTextTextColor),
                    ),
                    trailing: Text(
                      "4K",
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              "Full game video",
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.normal,
                color: AppColors.secondaryTextColor,
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    backgroundColor: AppColors.whiteColor,
                    builder: (context) => const QualityOptions());
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const ListTile(
                    title: Text(
                      "Quality",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryTextTextColor),
                    ),
                    trailing: Text(
                      "1080K",
                      style: TextStyle(
                        fontSize: 13.5,
                        fontWeight: FontWeight.bold,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Text(
              "Uploading",
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.normal,
                color: AppColors.secondaryTextColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 5, bottom: 5, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Wi-Fi only',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.5,
                            color: AppColors.blackColor),
                      ),
                      CupertinoSwitch(
                          activeColor: AppColors.blueColor,
                          value: wifi,
                          onChanged: (value) {
                            setState(() {
                              wifi = value;
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 5, bottom: 5, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'While recording',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15.5,
                            color: AppColors.blackColor),
                      ),
                      CupertinoSwitch(
                          activeColor: AppColors.blueColor,
                          value: record,
                          onChanged: (value) {
                            setState(() {
                              record = value;
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
            const Text(
              "iPhone",
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.normal,
                color: AppColors.secondaryTextColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  title: Text(
                    "Delete all videos",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.redColor),
                  ),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Memory",
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.normal,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                Text(
                  "6.96 of 63.86 GB free",
                  style: TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.normal,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 30.0,
              child: LinearProgressIndicator(
                value: 0.8,
                backgroundColor: Colors.grey[100],
                valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.yellowColor), // Filled color
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "Memory - 0.03 GB",
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.normal,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.grey,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        "Others",
                        style: TextStyle(
                          fontSize: 13.5,
                          fontWeight: FontWeight.normal,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Version",
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.normal,
                color: AppColors.secondaryTextColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  title: Text(
                    "V1.206",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryTextTextColor),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const ListTile(
                  title: Center(
                    child: Text(
                      "Delete account",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.redColor),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class QualityOptions extends StatelessWidget {
  const QualityOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Container(
      height: height * 0.50,
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
              "Quality",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryTextTextColor),
            ),
            const OptionsValue(
              title: '360',
            ),
            const OptionsValue(
              title: '480',
            ),
            const OptionsValue(
              title: '720',
            ),
            const OptionsValue(
              title: '1080K',
            ),
            const SizedBox(
              height: 10,
            ),
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

class OptionsValue extends StatefulWidget {
  final String title;

  const OptionsValue({
    super.key,
    required this.title,
  });

  @override
  OptionsValueState createState() => OptionsValueState();
}

class OptionsValueState extends State<OptionsValue> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 1;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: () {
          setState(() {
            status = !status;
          });
        },
        child: Container(
          width: width * 1,
          decoration: BoxDecoration(
            color: status ? Colors.orange[50] : Colors.grey[100],
            borderRadius: BorderRadius.circular(width * 0.015),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              widget.title,
              style: const TextStyle(
                fontSize: 14,
                color: AppColors.primaryTextTextColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
