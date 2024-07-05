import 'package:get/get.dart';

class PlayerTypeController extends GetxController {
  var tappedStates = <String, bool>{}.obs;

  void toggleTappedState(String title) {
    if (tappedStates.containsKey(title)) {
      tappedStates[title] = !tappedStates[title]!;
    } else {
      tappedStates[title] = true;
    }
  }
}
// Controller: The PlayerTypeController manages the tapped states of the
// buttons using an observable map (tappedStates).
// PlayerType: This widget uses the PlayerTypeController to handle
// the state of the buttons. The Obx widget listens for changes in the state and updates the UI accordingly.
// PlayerTypeBox: The PlayerTypeBox widget uses the PlayerTypeController
// to get the current tapped state and toggle it when tapped.