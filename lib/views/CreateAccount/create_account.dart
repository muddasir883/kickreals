import 'package:flutter/material.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/views/CodeVerification/code_verification.dart';
import 'package:get/get.dart';
import 'package:kick_reels/views/Login/login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  Future<void> register() async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse('http://192.168.43.45:3000/api/auth/register'); // Updated with local IP address
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      // Navigate to Code Verification or Dashboard after successful registration
      Get.to(const CodeVerification());
    } else {
      // Show error message
      final errorData = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorData['msg'] ?? 'Registration failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
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
                  height: height * 0.03,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Create account",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: AppColors.blackColor),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextFormField(
                        style: const TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.black),
                        controller: emailController,
                        focusNode: emailFocus,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Email address",
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
                            borderSide:
                            BorderSide(color: AppColors.yellowColor),
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
                          suffixIcon: const Icon(
                            Icons.email_outlined,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        onFieldSubmitted: (value) {
                          emailFocus.unfocus();
                          FocusScope.of(context).requestFocus(passwordFocus);
                        }),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    TextFormField(
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.black),
                      controller: passwordController,
                      focusNode: passwordFocus,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Create password",
                        hintStyle: const TextStyle(
                            fontSize: 16,
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
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
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
                        suffixIcon: const Icon(
                          Icons.visibility_off,
                          color: AppColors.secondaryTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    InkWell(
                      onTap: () {
                        register(); // Call the register method on button tap
                      },
                      child: Container(
                        height: height * 0.07,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.02),
                            color: AppColors.yellowColor),
                        child: isLoading
                            ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.blackColor),
                        )
                            : const Text(
                          "Create account",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "______________________",
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Or",
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "______________________",
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Container(
                        height: height * 0.07,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.02),
                          color: AppColors.whiteColor,
                          border: Border.all(color: AppColors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: width * 0.048,
                              backgroundImage:
                              const AssetImage("assets/images/google.png"),
                            ),
                            SizedBox(
                              width: width * 0.005,
                            ),
                            const Text(
                              "Continue with Google",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Container(
                        height: height * 0.07,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(width * 0.02),
                          color: AppColors.whiteColor,
                          border: Border.all(color: AppColors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: width * 0.030,
                              backgroundImage:
                              const AssetImage("assets/images/apple.png"),
                            ),
                            SizedBox(
                              width: width * 0.009,
                            ),
                            const Text(
                              "Continue with Apple",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: height * 0.06,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(
                              color: AppColors.secondaryTextColor,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(const LoginPage());
                            },
                            child: const Text(
                              "Log In",
                              style: TextStyle(
                                color: AppColors.yellowColor,
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                              ),
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
        ),
      ),
    );
  }
}
