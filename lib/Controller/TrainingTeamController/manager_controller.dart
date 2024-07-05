// player_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Model/TrainingTeamModel/manager_model.dart';


class PlayerController extends GetxController {
  var player = Player(name: '', role: '').obs;
  final playerNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    playerNameController.text = player.value.name;
    playerNameController.addListener(() {
      setName(playerNameController.text);
    });
  }

  void setName(String name) {
    player.update((val) {
      val?.name = name;
    });
  }

  void setRole(String role) {
    player.update((val) {
      val?.role = role;
    });
  }

  void savePlayer() {
    // Perform save operation here (e.g., save to database, API call, etc.)
    print('Player saved: ${player.toJson()}');
  }

  @override
  void onClose() {
    playerNameController.dispose();
    super.onClose();
  }
}
