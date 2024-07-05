import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:kick_reels/views/dashboard/dashboard.dart';

import '../../utils/AppColors/color.dart';
import '../CreateAccount/create_account.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  bool isLoading = false;
  bool _isSigningIn = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });

   final url = Uri.parse('http://192.168.43.45:3000/api/auth/login');
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
      final responseData = jsonDecode(response.body);
      final token = responseData['token'];

      // Store the token in secure storage if needed
      // Navigate to the Dashboard after successful login
      Get.to(const Dashboard());
    } else {
      // Show error message
      final errorData = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorData['msg'] ?? 'Login failed')),
      );
    }
  }
  Future<void> _handleGoogleSignIn() async {
    setState(() {
      _isSigningIn = true; // Start the signing in process
    });

    try {
      // Implement your Google sign-in logic here
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        print("Logged in user email: ${googleUser.email}");
        print("Logged in user name: ${googleUser.displayName}");
        // Navigate to the Dashboard after successful sign-in
        Get.to(const Dashboard());
      }
    } catch (error) {
      print(error);
    } finally {
      setState(() {
        _isSigningIn = false; // End the signing in process
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
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
                  height: height * 0.035,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Log in",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
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
                        suffixIcon: const Icon(Icons.email_outlined,
                            color: AppColors.secondaryTextColor),
                      ),
                      onFieldSubmitted: (value) {
                        emailFocus.unfocus();
                        FocusScope.of(context).requestFocus(passwordFocus);
                      },
                    ),
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
                        hintText: "Password",
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
                        suffixIcon: const Icon(Icons.visibility_off,
                            color: AppColors.secondaryTextColor),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot password?",
                          style: TextStyle(
                              fontSize: 13,
                              color: AppColors.primaryTextTextColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    InkWell(
                      onTap: login,
                      child: Container(
                        height: height * 0.07,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.02),
                            color: AppColors.yellowColor),
                        child: isLoading
                            ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                            : const Text(
                          "Log In",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.035,
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
                      height: height * 0.035,
                    ),
                    _isSigningIn
                        ? Center(
                      child: CircularProgressIndicator(),
                    )
                        : InkWell(
                      onTap: _handleGoogleSignIn,
                      child: Container(
                        height: height * 0.07,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(width * 0.02),
                          color: AppColors.whiteColor,
                          border: Border.all(color: AppColors.grey),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: width * 0.048,
                              backgroundImage: const AssetImage(
                                  "assets/images/google.png"),
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
                        ),
                      ),
                    ),
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
                              backgroundImage: const AssetImage(
                                  "assets/images/apple.png"),
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
                      height: height * 0.065,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(const CreateAccount());
                            },
                            child: const Text(
                              "Sign Up",
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
