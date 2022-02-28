import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/materiPage/materi_page.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  MateriPage(
                      id: widget.id,
                    ),
                  ),
                );
              },
              child: const Text("Submit"),
            ),
          ),
        ),
      ],
    );
  }
}
