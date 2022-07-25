import 'package:budget_tracker/widget/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:velocity_x/velocity_x.dart';

import 'colors.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: screenSize.width / 4,
      lineWidth: 10.0, // how thick the line is
      percent: .5, // percent goes from 0 -> 1
      backgroundColor: Colors.white,
      center: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          "\$0"
              .text
              .textStyle(
                GoogleFonts.nunito(
                  fontSize: height(context) * .05,
                ),
              )
              .bold
              .make(),
          "Balance"
              .text
              .textStyle(
                GoogleFonts.nunito(
                  fontSize: height(context) * .022,
                ),
              )
              .medium
              .make(),
        ],
      ),
      progressColor: ColorData.primary,
    );
  }
}
