import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kick_reels/utils/AppColors/color.dart';
import 'package:kick_reels/utils/widgets/bottom_bar.dart';
import '../../Controller/My Teams/main_team_controller.dart';


class CreateTeam extends StatefulWidget {
  const CreateTeam({super.key});

  @override
  State<CreateTeam> createState() => _CreateTeamState();
}

class _CreateTeamState extends State<CreateTeam> {
  final MainTeamController mainTeamController = Get.find<MainTeamController>();
  final teamName = TextEditingController();

  @override
  void dispose() {
    teamName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      bottomNavigationBar: persistentBottomBar(1),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "New team",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor),
        ),
        leading: const BackButton(
          color: AppColors.blackColor,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.065,
            decoration: BoxDecoration(
              color: Colors.grey[100],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.055),
                  child: const Text(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.055),
                child: const Text(
                  'Enter team name',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: AppColors.blackColor),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Container(
            margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            child: TextFormField(
              style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: AppColors.secondaryTextColor),
              controller: teamName,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: "Team name",
                hintStyle: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                    color: AppColors.secondaryTextColor),
                fillColor: Colors.grey[100],
                filled: true,
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
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
            height: height * 0.02,
          ),
          Container(
            margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TeamTypeBox(
                  imagePath: "assets/images/football.svg",
                  game: "Football",
                ),
                TeamTypeBox(
                  imagePath: "assets/images/football.svg",
                  game: "Basketball",
                ),
                TeamTypeBox(
                  imagePath: "assets/images/football.svg",
                  game: "Soccer",
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          InkWell(
            onTap: () {
              mainTeamController.addTeam(teamName.text);
              Get.back();
            },
            child: Container(
              margin: EdgeInsets.only(left: width * 0.05, right: width * 0.05),
              height: height * 0.07,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 0.02),
                color: Colors.grey[200],
              ),
              child: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TeamTypeBox extends StatefulWidget {
  final String imagePath;
  final String game;
  const TeamTypeBox({super.key, required this.game, required this.imagePath});

  @override
  State<TeamTypeBox> createState() => _TeamTypeBoxState();
}

class _TeamTypeBoxState extends State<TeamTypeBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.grey[200],
              ),
              child: SvgPicture.asset(
                widget.imagePath,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              widget.game,
              style: const TextStyle(
                  color: AppColors.secondaryTextColor, fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
