// ignore_for_file: must_be_immutable, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/course_detail/cubit/course_detail_cubit.dart';
import 'package:kolearn/blocs/my_course/cubit/mycourse_cubit.dart';
import 'package:kolearn/core/app_colors.dart';
import 'package:kolearn/home_page.dart';
import 'package:kolearn/screen/course_detail/widget/row_btn.dart';
import 'package:kolearn/screen/home/home_screen.dart';
import 'package:kolearn/screen/materiPage/materi_page.dart';
import 'package:kolearn/screen/quiz_screen/quiz_screen.dart';
import 'package:shimmer/shimmer.dart';

import '../../blocs/materi/cubit/materi_cubit.dart';
import 'widget/course_card.dart';

class CourseDetail extends StatefulWidget {
  CourseDetail({required this.index, Key? key}) : super(key: key);

  int index;
  @override
  _CourseDetailState createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CourseDetailCubit>(context).getDetail(widget.index + 1);
    BlocProvider.of<MateriCubit>(context).getMateri(widget.index + 1);
  }

  int length = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Detail'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
              (route) => false,
            );

            // Navigator.pop(context);
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (_) {
            //     return HomePage();
            //   },
            //   settings: RouteSettings(
            //     name: 'SecondPage',
            //   ),
            // ));
          },
          icon: const Icon(Icons.chevron_left),
        ),
      ),
      body: Container(
        color: const Color(0xffE6F6FF),
        width: double.infinity,
        height: double.infinity,
        child: Column(children: <Widget>[
          BlocBuilder<CourseDetailCubit, CourseDetailState>(
            builder: (context, state) {
              if (state is CourseDetailLoading) {
                return Shimmer.fromColors(
                    baseColor: AppColors.baseColor,
                    highlightColor: AppColors.highlightColor,
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 27.w, right: 27.w, top: 40.h, bottom: 100.h),
                      child: Container(
                        width: double.infinity,
                        height: 150.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ],
                        ),
                      ),
                    ));
              }
              return Container();
            },
          ),
          BlocBuilder<CourseDetailCubit, CourseDetailState>(
            builder: (context, state) {
              if (state is CourseDetailSuccess) {
                EasyLoading.dismiss();
                return CourseCard(
                  title: state.courseDetail.data.courseName,
                  hangul: state.courseDetail.data.title,
                  index: widget.index + 1,
                  length: length,
                );
              }
              if (state is CourseDetailNew) {
                EasyLoading.dismiss();
                return CourseCard(
                  title: state.courseNew.data.courseName,
                  hangul: state.courseNew.data.title,
                  index: widget.index + 1,
                  length: length,
                );
              }
              return Container();
            },
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 27.w, right: 27.w),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                      offset: Offset(-2, -2),
                      blurRadius: 5)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  BlocBuilder<CourseDetailCubit, CourseDetailState>(
                    builder: (context, state) {
                      if (state is CourseDetailLoading) {
                        return Shimmer.fromColors(
                            baseColor: AppColors.baseColor,
                            highlightColor: AppColors.highlightColor,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 2.w,
                                  right: 2.w,
                                  top: 4.h,
                                  bottom: 10.h),
                              child: Container(
                                width: double.infinity,
                                height: 50.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1.r),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.3),
                                        offset: Offset(0, 4),
                                        blurRadius: 4)
                                  ],
                                ),
                              ),
                            ));
                      }
                      if (state is CourseDetailSuccess) {
                        return Text(
                          state.courseDetail.data.courseName.toUpperCase(),
                          style: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.bold),
                        );
                      }
                      if (state is CourseDetailNew) {
                        return Text(
                          state.courseNew.data.courseName.toUpperCase(),
                          style: TextStyle(
                              fontSize: 30.sp, fontWeight: FontWeight.bold),
                        );
                      }
                      return Container();
                    },
                  ),
                  BlocConsumer<MateriCubit, MateriState>(
                    listener: (context, state) {
                      if (state is MateriLoaded) {
                        setState(() {
                          length = state.materi.length;
                        });
                      }
                    },
                    builder: (context, state) {
                      return Row();
                    },
                  ),
                  const Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
                    style: TextStyle(
                        color: Color(0xff9F98AD), fontWeight: FontWeight.w600),
                  ),
                  BlocBuilder<CourseDetailCubit, CourseDetailState>(
                    builder: (context, state) {
                      if (state is CourseDetailLoading) {
                        return RowBtn(
                            isSubmited: 0,
                            text: "Materi",
                            icon: Icons.pending,
                            child: Icon(
                              Icons.description_outlined,
                              size: 34.w,
                              color: Color(0xff3F3F3F),
                            ));
                      }
                      if (state is CourseDetailSuccess) {
                        return RowBtn(
                            isSubmited: state.courseDetail.data.isSubmited,
                            text: "Materi",
                            icon: state.courseDetail.data.status == 'progress'
                                ? Icons.check_circle_outline
                                : state.courseDetail.data.status == 'started'
                                    ? Icons.lock_open_rounded
                                    : Icons.lock_outline,
                            child: Icon(
                              Icons.description_outlined,
                              size: 34.w,
                              color: Color(0xff3F3F3F),
                            ));
                      }
                      if (state is CourseDetailNew) {
                        return RowBtn(
                            isSubmited: state.courseNew.data.isSubmited,
                            text: "Materi",
                            icon: Icons.lock,
                            child: Icon(
                              Icons.description_outlined,
                              size: 34.w,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ));
                      }
                      return Container();
                    },
                  ),
                  BlocBuilder<CourseDetailCubit, CourseDetailState>(
                    builder: (context, state) {
                      if (state is CourseDetailLoading) {
                        return RowBtn(
                            isSubmited: 0,
                            text: "Latihan Soal",
                            icon: Icons.pending,
                            child: Icon(
                              Icons.edit_note_rounded,
                              size: 34.w,
                              color: Color(0xff3F3F3F),
                            ));
                      }
                      if (state is CourseDetailSuccess) {
                        return RowBtn(
                            isSubmited: state.courseDetail.data.isSubmited,
                            text: "Latihan Soal",
                            icon: state.courseDetail.data.status == 'started' ||
                                    state.courseDetail.data.status == 'progress'
                                ? Icons.lock
                                : Icons.task_alt,
                            child: Icon(
                              Icons.edit_note_rounded,
                              size: 34.w,
                              color: Color(0xff3F3F3F),
                            ));
                      }
                      if (state is CourseDetailNew) {
                        return RowBtn(
                            isSubmited: state.courseNew.data.isSubmited,
                            text: "Latihan Soal",
                            icon: Icons.lock,
                            child: Icon(
                              Icons.edit_note_rounded,
                              size: 34.w,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ));
                      }
                      return Container();
                    },
                  ),
                  BlocBuilder<CourseDetailCubit, CourseDetailState>(
                    builder: (context, state) {
                      if (state is CourseDetailLoading) {
                        return loadingBtn();
                      }
                      if (state is CourseDetailSuccess) {
                        return _submitBtn(
                            state.courseDetail.data.courseName,
                            state.courseDetail.data.status,
                            state.courseDetail.data.id.toString(),
                            length.toString());
                      }
                      if (state is CourseDetailNew) {
                        return _submitBtn(
                            state.courseNew.data.courseName,
                            'started',
                            state.courseNew.data.id.toString(),
                            length.toString());
                      }
                      return Container();
                    },
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _submitBtn(
      String courseName, String status, String id, String jumlahMateri) {
    return Row(
      children: [
        Expanded(
            child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(height: 60.h),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: const Color(0xff7383BF)),
              onPressed: () {
                if (status == 'progress') {
                  // show dialog to confirm take the quiz
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      content: const Text('Ingin mengambil kuis sekarang? '),
                      actions: <Widget>[
                        // Cancel button
                        TextButton(
                          onPressed: () =>
                              // close the dialog
                              Navigator.of(context, rootNavigator: true)
                                  .pop('dialog'),
                          child: const Text('Cancel'),
                        ),
                        // Ok button
                        TextButton(
                          onPressed: () {
                            // close alert dialog
                            Navigator.of(context, rootNavigator: true)
                                .pop('dialog');
                            // navigate to new route
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(),
                              ),
                            );
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                } else if (status == 'started') {
                  BlocProvider.of<MycourseCubit>(context).saveCourse(
                      courseName,
                      id,
                      jumlahMateri,
                      status); // save course if status is started

                  // // Ke halaman materi dan atau latihan soal
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MateriPage(
                        id: widget.index + 1,
                      ),
                    ),
                  ).then((value) {
                    if (mounted) {
                      setState(() {
                        // Your state change code goes here
                      });
                    }
                  });
                }

                // // Save course
                // BlocProvider.of<MycourseCubit>(context)
                //     .saveCourse(courseName, id, jumlahMateri, status);
              },
              child: Text("Submit")),
        ))
      ],
    );
  }

  Widget loadingBtn() {
    return Row(
      children: [
        Expanded(
            child: ConstrainedBox(
          constraints: BoxConstraints.tightFor(height: 60.h),
          child: ElevatedButton(onPressed: null, child: Text("Loading")),
        ))
      ],
    );
  }
}
