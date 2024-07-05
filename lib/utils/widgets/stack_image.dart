import 'package:flutter/material.dart';
import 'package:kick_reels/utils/AppColors/color.dart';

class ImageStack extends StatelessWidget {
  const ImageStack({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height*1;
    final width = MediaQuery.sizeOf(context).width*1;
    return  SizedBox(
      height: height*0.22,
      width: width*1,
      child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left:width*0.03, right: width*0.03),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(width*0.05),
                  child: Image.asset('assets/images/football.png', fit: BoxFit.fill, width: double.infinity,
                    height: double.infinity,),
                  ),
                ),
              // Positioned(
              //   bottom: height*0.015,
              //   right: width*0.055,
              //   child: Container(
              //     height:40,
              //     width: 40,
              //     alignment: Alignment.center,
              //     // padding: EdgeInsets.all(width*0.035),
              //     decoration: BoxDecoration(
              //       color: Colors.black38,
              //       borderRadius: BorderRadius.circular(20),
              //       // border: Border.all(color: AppColors.yellowColor )
              //     ),
              //     child: const Text(
              //       'J',
              //       style: TextStyle(
              //         color: AppColors.yellowColor,
              //         fontSize: 18,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
    );
  }
}