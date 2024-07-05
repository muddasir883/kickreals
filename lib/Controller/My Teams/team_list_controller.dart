// controllers/team_controller.dart
import 'package:get/get.dart';
import '../../Model/My Teams/team_list_model.dart';

class TeamController extends GetxController {
  var teams = <Team>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTeams();
  }

  void fetchTeams() {
    // Simulate fetching data from an API or database
    var teamData = [
      Team(title: "Training team", desc: "1 team member", status: true),
      Team(title: "New team", desc: "3 team member", status: false),
      Team(title: "Training team 2", desc: "4 team member", status: false),
      Team(title: "Rejected team", desc: "9 team member", status: true),
    ];
    teams.addAll(teamData);
  }

  void updateTeamStatus(int index, bool status) {
    teams[index].status = status;
    teams.refresh(); // Refresh the observable list to update UI
  }

  void addTeam(Team team) {
    teams.add(team);
  }

  void removeTeam(int index) {
    teams.removeAt(index);
  }
}
