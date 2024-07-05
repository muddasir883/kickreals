import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/TrainingTeamController/manager_controller.dart';
import '../../utils/AppColors/color.dart';


class Manager extends StatefulWidget {
  const Manager({super.key});

  @override
  State<Manager> createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {
  final playerController = Get.put(PlayerController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Manager",
          style: TextStyle(
              fontSize: 16,
              color: AppColors.blackColor,
              fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(
          color: AppColors.blackColor,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.025,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.black54,
                ),
                child: const Text(
                  "J",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.yellowColor),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Padding(
            padding: EdgeInsets.only(left: width * 0.05),
            child: const Text(
              "Name",
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.normal,
                color: AppColors.primaryTextTextColor,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            child: TextFormField(
              style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: AppColors.secondaryTextColor),
              controller: playerController.playerNameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "JohnDoe@gmail.com",
                hintStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: AppColors.secondaryTextColor),
                fillColor: Colors.grey[200],
                filled: true,
                border: const OutlineInputBorder(
                  borderSide:
                  BorderSide(color: AppColors.textFieldDefaultBorderColor),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.yellowColor),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          InkWell(
            onTap: () {
              playerController.setRole("Owner");
            },
            child: Container(
              height: height * 0.07,
              margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(width * 0.02),
              ),
              child: Padding(
                padding:
                EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Owner",
                      style: TextStyle(
                        color: AppColors.primaryTextTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.blackColor,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.035,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const ChangeRoleSheet(),
              );
            },
            child: Container(
              margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              height: height * 0.07,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.02),
                color: AppColors.yellowColor,
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primaryTextTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChangeRoleSheet extends StatelessWidget {
  const ChangeRoleSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final playerController = Get.find<PlayerController>();
    return Container(
      height: height * 0.9,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(width * 0.05),
          topRight: Radius.circular(width * 0.05),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Change member role",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Which role would you like to have?",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.secondaryTextColor),
              ),
              SizedBox(height: height * 0.03),
              RoleBox(
                title: "Manager",
                onTap: () {
                  playerController.setRole("Manager");
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: height * 0.02),
              RoleBox(
                title: "Player manager",
                onTap: () {
                  playerController.setRole("Player manager");
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: height * 0.02),
              RoleBox(
                title: "Coach",
                onTap: () {
                  playerController.setRole("Coach");
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: height * 0.02),
              RoleBox(
                title: "Fan",
                onTap: () {
                  playerController.setRole("Fan");
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: height * 0.02),
              RoleBox(
                title: "Player",
                onTap: () {
                  playerController.setRole("Player");
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: height * 0.03),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: height * 0.07,
                  width: width * 1,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                        color: AppColors.secondaryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoleBox extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const RoleBox({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height * 0.05,
        width: width * 1,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(width * 0.02),
            color: Colors.grey[100]),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.blackColor),
          ),
        ),
      ),
    );
  }
}
