// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseCard extends StatefulWidget {
  CourseCard({
    required this.title,
    required this.hangul,
    required this.index,
    required this.length,
    Key? key,
  }) : super(key: key);

  final String title;
  final String hangul;
  final int index;
  final int length;

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  // int length = 0;

  @override
  void initState() {
    super.initState();
    // BlocProvider.of<MateriCubit>(context).getMateri(widget.index);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 27.w, right: 27.w, top: 40.h, bottom: 150.h),
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
        child: Padding(
          padding: EdgeInsets.only(left: 34.w, right: 30.w),
          child: Row(
            children: <Widget>[
              Container(
                width: 68.w,
                height: 68.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: Colors.yellow[700]),
                child: Center(
                  child: Text(
                    widget.hangul,
                    style: TextStyle(
                      fontSize: 48.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              // BlocConsumer<MateriCubit, MateriState>(
              //   listener: (context, state) {
              //     if (state is MateriLoaded) {
              //       setState(() {
              //         length = state.materi.length;
              //       });
              //     }
              //   },
              //   builder: (context, state) {
              //     return SizedBox(
              //       height: 0,
              //     );
              //   },
              // ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.title.toUpperCase(),
                    style:
                        TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.library_books_rounded),
                      SizedBox(
                        width: 10.w,
                      ),
                      widget.length == 0
                          ? Text('Loading')
                          : Text(widget.length.toString() + ' materi'),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
