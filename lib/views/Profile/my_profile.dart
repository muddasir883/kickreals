import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
// import 'package:path_provider/path_provider.dart';
import 'dart:convert';

import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/utils/widgets/profile_menu.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _googleUser;
  File? _image;

  @override
  void initState() {
    super.initState();
    // Initialize _googleUser with the current signed in user
    _googleUser = _googleSignIn.currentUser;
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _updateProfilePicture() async {
    if (_image == null) return;

    // Prepare the request
    final url = Uri.parse('http://192.168.43.45:3000/api/profile/profile-picture');
    final token = ''; // Replace with your authentication token if needed
    final headers = {
      HttpHeaders.authorizationHeader: 'Bearer $token',
      HttpHeaders.contentTypeHeader: 'multipart/form-data',
    };

    var request = http.MultipartRequest('PUT', url)
      ..headers.addAll(headers)
      ..files.add(await http.MultipartFile.fromPath('profilePicture', _image!.path));

    // Send the request
    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        // Update UI or show a success message
        print('Profile picture updated');
      } else {
        // Handle errors
        print('Failed to update profile picture: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error updating profile picture: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Training team",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: AppColors.primaryTextTextColor,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: const [
          ProfileMenuButton(),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: height * 0.025),
          InkWell(
            onTap: () {
              _getImageFromGallery(); // Trigger image selection
            },
            child: Stack(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.black54,
                  ),
                  child: _image != null
                      ? CircleAvatar(
                    backgroundImage: FileImage(_image!),
                    radius: 35,
                  )
                      : (_googleUser != null && _googleUser!.photoUrl != null
                      ? CircleAvatar(
                    backgroundImage: NetworkImage(_googleUser!.photoUrl!),
                    radius: 35,
                  )
                      : const Text(
                    "J",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.yellowColor,
                    ),
                  )),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.yellowColor,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.04),
          Container(
            color: Colors.grey[100],
            child: ListTile(
              title: Text(
                _googleUser != null ? _googleUser!.email ?? "" : "Email not found",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextTextColor,
                ),
              ),
              subtitle: const Text(
                "Owner",
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.normal,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            color: Colors.grey[100],
            child: const ListTile(
              title: Text(
                "Latest messages",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryTextTextColor,
                ),
              ),
              subtitle: Text(
                "None",
                style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.normal,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.33),
          InkWell(
            onTap: () {
              _googleSignIn.signOut().then((_) {
                // Navigate to login or any other screen after logout
                Get.offAllNamed('/');
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: width * 0.03, right: width * 0.03),
              height: height * 0.07,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.02),
                color: Colors.grey[100],
              ),
              child: const Text(
                "Log out",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColors.redColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
