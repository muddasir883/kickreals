import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/utils/widgets/bottom_bar.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      bottomNavigationBar: persistentBottomBar(2),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Contact",
          style: TextStyle(
              color: AppColors.blackColor,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
              child: TextFormField(
                style: const TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black),
                // controller: emailController,
                // focusNode: emailFocus,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter name",
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryTextColor),
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
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
              child: TextFormField(
                style: const TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black),
                // controller: emailController,
                // focusNode: emailFocus,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter email address",
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryTextColor),
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
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Container(
              margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
              child: TextFormField(
                style: const TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.black),
                // controller: emailController,
                // focusNode: emailFocus,
                keyboardType: TextInputType.text,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Enter message",
                  hintStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.secondaryTextColor),
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
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.035,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin:
                    EdgeInsets.only(left: width * 0.03, right: width * 0.03),
                height: height * 0.07,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.02),
                  color: Colors.grey[300],
                ),
                child: const Text(
                  "Submit",
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
      ),
    );
  }
}
