import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/materi/cubit/materi_cubit.dart';
import 'package:kolearn/screen/materiPage/materi_page.dart';

import '../../../blocs/my_course/cubit/mycourse_cubit.dart';

class SubmitBtn extends StatefulWidget {
  const SubmitBtn({
    Key? key,
    required this.id,
    required this.courseName,
    required this.jumlahMateri,
  }) : super(key: key);

  final int id;
  final String courseName;
  final String jumlahMateri;

  @override
  _SubmitBtnState createState() => _SubmitBtnState();
}

class _SubmitBtnState extends State<SubmitBtn> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: 60.h),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: const Color(0xff7383BF)),
              onPressed: () {
                // Update status course
                BlocProvider.of<MateriCubit>(context).updateMateri(widget.id);

                // Simpan ke myCourse
                BlocProvider.of<MycourseCubit>(context).saveCourse(
                    widget.courseName,
                    widget.id.toString(),
                    widget.jumlahMateri,
                    'started');

                // Navigate to materi page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MateriPage(
                      courseName: widget.courseName,
                      jumlahMateri: widget.jumlahMateri,
                      id: widget.id,
                    ),
                  ),
                ).then((value) {
                  if (mounted) {
                    setState(() {
                      // Your state change code goes here
                    });
                  }
                });
              },
              child: const Text("Lanjutkan"),
            ),
          ),
        ),
      ],
    );
  }
}
