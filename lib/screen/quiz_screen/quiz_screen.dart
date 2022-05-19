import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolearn/blocs/quiz/cubit/quiz_cubit.dart';

import 'package:kolearn/core/app_colors.dart';
import 'package:kolearn/core/app_text_styles.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

int selectedIndex = 0;
final _pageController = PageController(initialPage: 0);

class _QuizScreenState extends State<QuizScreen> {
  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
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
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<QuizCubit>(context).loadQuiz();
                              },
                              icon: const Icon(Icons.download))
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
                                            [index]['title'],
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
                                    return answerBox("loading", '', 4);
                                  }
                                  if (state is QuizLoaded) {
                                    return answerBox(
                                        state.list[_currentIndex]['questions']
                                            [index]['answers'][index1]['title'],
                                        state.list[index]['questions'][index]
                                            ['answers'][index1]['isRight'],
                                        index1 + 1);
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

  Widget answerBox(String text, isRight, int index) {
    return InkWell(
      onTap: () {
        selectedIndex = index;
        setState(() {});
        Future.delayed(const Duration(seconds: 1), () {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.linearToEaseOut);
          selectedIndex = 0;
        });
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
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
