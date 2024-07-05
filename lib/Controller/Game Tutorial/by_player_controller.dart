import 'package:get/get.dart';

class ByPlayerController extends GetxController {
  var activeTab = 'By players'.obs;

  void setActiveTab(String tab) {
    activeTab.value = tab;
  }
}
//the ByPlayerController manages the active tab state.
//The ByPlayer widget listens to changes in the controller's state using Obx widgets,
//which automatically update when the state changes.
//This approach keeps the UI code clean and separates the state management logic.