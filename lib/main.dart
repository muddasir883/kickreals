import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/views/CreateAccount/create_account.dart';
import 'package:kick_reels/views/FAQ/faq_page.dart';
import 'package:kick_reels/views/Login/login.dart';
import 'package:kick_reels/views/MyTeams/create_team.dart';
import 'package:get/get.dart';
import 'package:kick_reels/views/MyTeams/main_teamPage.dart';
import 'package:kick_reels/views/MyTeams/team_list.dart';
import 'package:kick_reels/views/SplashScreen/splash_screen.dart';
import 'package:kick_reels/views/TrainingTeam/training_team.dart';
import 'firebase_options.dart';
import 'views/Profile/my_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kick-Reels',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent
          // primarySwatch: Colors.blue,
          ),
      home: const SplashScreen(),
    );
  }
}
