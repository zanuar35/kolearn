import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/materi/cubit/materi_cubit.dart';
import 'package:kolearn/screen/materi_screen/materi_screen.dart';

class SubmitBtn extends StatefulWidget {
  const SubmitBtn({Key? key, required this.id}) : super(key: key);

  final int id;
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
                BlocProvider.of<MateriCubit>(context).getMateri(widget.id);
                print(widget.id);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const MateriScreen(),
                //   ),
                // );
              },
              child: const Text("Submit"),
            ),
          ),
        ),
      ],
    );
  }
}
