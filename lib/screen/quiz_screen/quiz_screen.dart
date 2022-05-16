import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolearn/blocs/quiz/cubit/quiz_cubit.dart';

import 'package:kolearn/core/app_colors.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
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
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('AlertDialog Title'),
                                    content:
                                        const Text('AlertDialog description'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
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
                              },
                              icon: const Icon(Icons.close)),
                          IconButton(
                              onPressed: () {
                                BlocProvider.of<QuizCubit>(context).loadQuiz();
                              },
                              icon: const Icon(Icons.download))
                        ],
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: Text("Quiz",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      // const SizedBox(height: 200),
                      Expanded(
                          child: Container(
                        color: Colors.transparent,
                      )),
                      Container(
                        width: double.infinity,
                        color: Colors.white38,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child: answerBox()),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(child: answerBox()),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Expanded(child: answerBox()),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(child: answerBox()),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      )
                    ],
                  ));
            }),
      ),
    );
  }
}

Widget answerBox() {
  return Container(
    width: 100,
    height: 100,
    color: Colors.red,
  );
}
