
import 'package:get/get.dart';

class MainTeamController extends GetxController {
  var teams = <String>[].obs;

  void addTeam(String team) {
    teams.add(team);
  }
}
//Created MainTeamController to manage the list of teams.
// Updated MainTeamPage to use MainTeamController and display the list of teams.
// Updated CreateTeam to use MainTeamController and add new teams to the list.