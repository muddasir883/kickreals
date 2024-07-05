import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/utils/widgets/PopupButton.dart';
import 'package:kick_reels/views/HomePage/NotificationPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _googleUser;

  @override
  void initState() {
    super.initState();
    // Initialize _googleUser with the current signed in user
    _googleUser = _googleSignIn.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
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
        title: Text(
          _googleUser?.displayName ?? "User Name", // Display user's name here
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.primaryTextTextColor),
        ),
        actions: const [
          PopUpMenuButton(),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: height * 0.28,
              width: width * 1,
              margin: EdgeInsets.only(left: 15, right: 15, top: height * 0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.03),
                color: Colors.grey[100],
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
                      "We’ve created a sample team (“Training Team”) with video for you to experiment with. Feel free to delete this team or create your own on the My Team page.",
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
                        Get.to(const NotificationPage());
                      },
                      child: Container(
                        height: height * 0.065,
                        width: width * 0.27,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xFF49dee7),
                            borderRadius: BorderRadius.circular(width * 0.03)),
                        child: const Text(
                          "Continue",
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
                        width: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.blackColor,
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
                        width: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: AppColors.lightGrey,
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
