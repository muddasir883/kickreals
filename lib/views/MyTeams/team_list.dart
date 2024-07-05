import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/utils/widgets/TeamsPopUp_Button.dart';
import 'package:kick_reels/views/TrainingTeam/training_team.dart';
import '../../Controller/My Teams/team_list_controller.dart';


class TeamList extends StatelessWidget {
  const TeamList({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    final teamController = Get.put(TeamController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "My Teams",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.primaryTextTextColor),
        ),
        leading: const BackButton(
          color: AppColors.blackColor,
        ),
        actions: const [
          PopUpTeamsButton(),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.065,
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Active Teams',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.5,
                          color: AppColors.blackColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Obx(() {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: teamController.teams.length,
                itemBuilder: (context, index) {
                  final team = teamController.teams[index];
                  return TeamTile(
                    title: team.title,
                    desc: team.desc,
                    status: team.status,
                    onStatusChange: (newStatus) {
                      teamController.updateTeamStatus(index, newStatus);
                    },
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class TeamTile extends StatelessWidget {
  final String title;
  final String desc;
  final bool status;
  final Function(bool) onStatusChange;

  const TeamTile({
    super.key,
    required this.title,
    required this.desc,
    required this.status,
    required this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey[50],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xee324B4D),
                    ),
                    child: const Image(
                      image: AssetImage(
                        'assets/images/splashlogo.png',
                      ),
                      fit: BoxFit.cover,
                      height: 30,
                      width: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(const TrainingTeam());
                    },
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            title,
                            style: const TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            desc,
                            style: const TextStyle(
                                color: AppColors.blackColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const SubscriptionPlan(),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: status
                                ? Colors.grey[300]
                                : AppColors.yellowColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, right: 15, left: 15),
                              child: Text(
                                status ? "Subscribed" : " Subscribe",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColors.blackColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: status,
                        onChanged: (newValue) {
                          onStatusChange(newValue);
                        },
                      ),
                    ],
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
class SubscriptionPlan extends StatelessWidget {
  const SubscriptionPlan({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
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
                "Choose Your Plan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: height * 0.02),
              const PlanTypeBox(
                textColor: AppColors.blackColor,
                priceColor: AppColors.blackColor,
                status: true,
                price: "\$9.99/monthly",
                title: "Family Plan - ",
                description:
                "Ideal for Parents and athletes, Free for \neveryone else on your Apple Family Plan",
              ),
              SizedBox(height: height * 0.02),
              const PlanTypeBox(
                textColor:  AppColors.secondaryTextColor,
                priceColor:  AppColors.secondaryTextColor,
                price: "\$9.99/monthly",
                status: false,
                title: "Team Plan - ",
                description:
                "Great for parent, coaches, players and fans. \nFree for everyone who joins your team",
              ),
              SizedBox(height: height * 0.02),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: height * 0.07,
                  width: width * 1,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.yellowColor,
                      borderRadius: BorderRadius.circular(width * 0.03)),
                  child: const Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
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
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PlanTypeBox extends StatelessWidget {
  final String title;
  final String price;
  final Color textColor;
  final Color priceColor;
  final String description;
  final bool status;

  const PlanTypeBox({
    super.key,
    required this.status,
    required this.title,
    required this.description,
    required this.price,
    required this.textColor,
    required this.priceColor,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(width * 0.04),
        border: status
            ? Border.all(color: Colors.transparent)
            : Border.all(color: AppColors.lightGrey),
        color: status ? Colors.orange[50]! : Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: textColor,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: priceColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
                color: AppColors.secondaryTextColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}