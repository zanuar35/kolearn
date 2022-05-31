import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/core/app_colors.dart';
import 'package:kolearn/core/app_text_styles.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class QuizResult extends StatefulWidget {
  const QuizResult({Key? key}) : super(key: key);

  @override
  State<QuizResult> createState() => _QuizResultState();
}

class _QuizResultState extends State<QuizResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        padding: EdgeInsets.all(50.h),
        width: double.infinity,
        height: double.infinity,
        color: Colors.green,
        child: Column(
          children: [
            const Text("Selesai"),
            AnimatedButton(
              text: 'No Header Dialog',
              color: Colors.cyan,
              pressEvent: () {
                AwesomeDialog(
                  customHeader: Container(
                    color: Colors.transparent,
                    child: CircularPercentIndicator(
                      radius: 50.0,
                      lineWidth: 8.0,
                      percent: 0.1,
                      center: const Text("10%"),
                      progressColor: Colors.green,
                    ),
                  ),
                  context: context,
                  body: Column(children: [
                    Container(
                      padding: EdgeInsets.all(10.h),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(25.r)),
                      child: Text(
                        "+30 XP",
                        style: AppTextStyles.body16White,
                      ),
                    ),
                    const Text("Selesai",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Kamu telah menyelesaikan \nkuis materi ini",
                      style: AppTextStyles.body16Grey,
                      textAlign: TextAlign.center,
                    )
                  ]),
                  headerAnimationLoop: false,
                  dialogType: DialogType.NO_HEADER,
                  btnOkOnPress: () {
                    debugPrint('OnClcik');
                  },
                  btnOkIcon: Icons.check_circle,
                ).show();
              },
            ),
          ],
        ),
      ),
    );
  }
}
