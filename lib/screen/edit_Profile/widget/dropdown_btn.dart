import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderDropdownBtn extends StatefulWidget {
  const GenderDropdownBtn({
    Key? key,
  }) : super(key: key);

  @override
  State<GenderDropdownBtn> createState() => _GenderDropdownBtnState();
}

class _GenderDropdownBtnState extends State<GenderDropdownBtn> {
  @override
  Widget build(BuildContext context) {
    String _gender = '';
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.green[50],
        ),
        child: DropdownButton<String>(
            value: _gender,
            isExpanded: true,
            hint: Text(_gender),
            items: <String>['Laki-laki', 'Perempuan'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                _gender = value!;
              });
            }));
  }
}
