
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../Model/TrainingTeamModel/add_player_model.dart';

class AddPlayerController extends GetxController {
  late final TextEditingController playerNameController;
  late final TextEditingController playerNumberController;

  final Rx<Player> player = Player(name: "", number: "").obs;

  @override
  void onInit() {
    playerNameController = TextEditingController();
    playerNumberController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    playerNameController.dispose();
    playerNumberController.dispose();
    super.onClose();
  }

  void savePlayer() {
    player.value = Player(
      name: playerNameController.text,
      number: playerNumberController.text,
    );
    // Here you can add logic to save the player data to your backend or perform other actions
  }
}
