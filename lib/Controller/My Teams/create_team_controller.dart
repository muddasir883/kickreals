import 'package:get/get.dart';

import '../../Model/My Teams/create_team_model.dart';
 // Import the Team model

class TeamController extends GetxController {
  var teams = <Team>[].obs; // Observable list of teams

  void addTeam(String name, String game) {
    teams.add(Team(name: name, game: game));
  }
}
