// training_team_controller.dart

import 'package:get/get.dart';


import '../../Model/TrainingTeamModel/training_team_Model.dart';

class TrainingTeamController extends GetxController {
  final RxList<TeamMember> teamMembers = <TeamMember>[].obs;

  @override
  void onInit() {
    // Initialize with dummy data for demonstration
    teamMembers.addAll([
      TeamMember(name: "John Doe", email: "johndoe@gmail.com", role: "Manager"),
      TeamMember(name: "Jane Smith", email: "janesmith@gmail.com", role: "Player"),
      TeamMember(name: "Alex Johnson", email: "alexjohnson@gmail.com", role: "Player"),
    ]);
    super.onInit();
  }

// Add methods here to manage team members as needed
}
