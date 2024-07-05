import 'package:flutter/material.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:get/get.dart';
import 'package:kick_reels/views/Login/login.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({super.key});

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  final codeController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image(
                        image: AssetImage("assets/images/splashlogo.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.055,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Verify your email address",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                          color: AppColors.primaryTextTextColor),
                    ),
                    const Text(
                      "We've sent a verification code to your email",
                      style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: AppColors.secondaryTextColor),
                    ),
                    SizedBox(
                      height: height * 0.035,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black),
                      controller: codeController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Enter code",
                        hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.secondaryTextColor),
                        fillColor: Colors.grey[100],
                        filled: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          // borderSide: BorderSide(color: AppColors.textFieldDefaultBorderColor),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.yellowColor),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          // borderSide: BorderSide(color: AppColors.redColor),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          // borderSide: BorderSide(color:Colors.black12),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const LoginPage());
                      },
                      child: Container(
                        height: height * 0.07,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.02),
                          color: AppColors.yellowColor,
                        ),
                        child: const Text(
                          "Verify",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
