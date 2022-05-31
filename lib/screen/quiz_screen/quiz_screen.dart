import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/quiz/cubit/quiz_cubit.dart';

import 'package:kolearn/core/app_colors.dart';
import 'package:kolearn/core/app_text_styles.dart';
import 'package:kolearn/screen/course_detail/course_detail_screen.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

int selectedIndex = 0;
QuizCubit quizCubit = QuizCubit();

final _pageController = PageController(initialPage: 0);

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<QuizCubit>(context).loadQuiz();
    selectedIndex = 0;
  }

  int? nilai;
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, pageIndex) {
              return Container(
                  padding: const EdgeInsets.all(16),
                  color: AppColors.backgroundColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                showDialogBox(context);
                              },
                              icon: const Icon(Icons.close)),
                          Expanded(child: Container()),
                          Text(nilai == null ? '0' : nilai.toString())
                        ],
                      ),
                      Row(
                        children: [
                          BlocBuilder<QuizCubit, QuizState>(
                              builder: ((context, state) {
                            if (state is QuizLoading) {
                              return Expanded(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  color: Colors.transparent,
                                  child: const Center(
                                    child: Text("Loading...",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              );
                            }
                            if (state is QuizLoaded) {
                              return Expanded(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  color: Colors.transparent,
                                  child: Center(
                                    child: Text(
                                        state.list[_currentIndex]['questions']
                                            [pageIndex]['title'],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              );
                            }
                            return Container();
                          })),
                        ],
                      ),
                      Expanded(
                          child: Container(
                        color: Colors.transparent,
                      )),
                      Container(
                          width: double.infinity,
                          color: Colors.white38,
                          child: GridView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.5,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index1) {
                                return BlocBuilder<QuizCubit, QuizState>(
                                    builder: ((context, state) {
                                  if (state is QuizLoading) {
                                    return answerBox("loading", '', 4, 4);
                                  }
                                  if (state is QuizLoaded) {
                                    return answerBox(
                                        state.list[_currentIndex]['questions']
                                                [pageIndex]['answers'][index1]
                                            ['title'],
                                        state.list[pageIndex]['questions']
                                                [pageIndex]['answers'][index1]
                                            ['isRight'],
                                        index1 + 1,
                                        pageIndex);
                                  }
                                  return Container();
                                }));
                              }))
                    ],
                  ));
            }),
      ),
    );
  }

  Widget answerBox(String text, isRight, int index, int pageIndex) {
    return InkWell(
      onTap: () {
        selectedIndex = index;
        setState(() {});
        if (selectedIndex != 0 && index == selectedIndex && isRight == true) {
          quizCubit.correctAnswer();
        }
        nilai = quizCubit.getNilai();

        // Future.delayed(const Duration(seconds: 1), () {
        //   _pageController.nextPage(
        //       duration: const Duration(milliseconds: 2000),
        //       curve: Curves.linearToEaseOut);
        //   selectedIndex = 0;
        // });
        pageIndex != 3
            ? Future.delayed(const Duration(seconds: 1), () {
                _pageController.nextPage(
                    duration: const Duration(milliseconds: 2000),
                    curve: Curves.linearToEaseOut);
                selectedIndex = 0;
              })
            : finishDialog(context);
        // Future.delayed(const Duration(seconds: 1), () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => const QuizResult(),
        //       ),
        //     );
        //   });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGreen),
          color: selectedIndex != 0
              ? index == selectedIndex
                  ? isRight == true
                      ? Colors.green[300]
                      : Colors.red[300]
                  : isRight == true
                      ? Colors.green[300]
                      : Colors.amber
              : Colors.amber,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: text == "loading"
                    ? AppTextStyles.body13
                    : AppTextStyles.answerBody,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future finishDialog(BuildContext context) {
  return AwesomeDialog(
    dismissOnTouchOutside: false,
    dismissOnBackKeyPress: false,
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
            color: Colors.blue, borderRadius: BorderRadius.circular(25.r)),
        child: const Text(
          "+30 XP",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      const Text("Selesai",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      SizedBox(
        height: 10.h,
      ),
      const Text(
        "Kamu telah menyelesaikan \nkuis materi ini",
        style: TextStyle(
            color: Colors.grey, fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      )
    ]),
    headerAnimationLoop: false,
    dialogType: DialogType.NO_HEADER,
    btnOkOnPress: () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => CourseDetail(
                    index: selectedIndex,
                  )),
          (route) => false);
      debugPrint('OnClcik');
    },
    btnOkIcon: Icons.check_circle,
  ).show();
}

Future<dynamic> showDialogBox(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Yakin ingin keluar?'),
      content: const Text('Progress quiz tidak akan disimpan'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Batal'),
          child: const Text('Batal'),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context, 'OK');
            Navigator.pop(context, 'OK');
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ),
  );
}
