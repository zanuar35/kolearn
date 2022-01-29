import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/accountPage/widget/row_button.dart';
import 'package:kolearn/screen/edit_Profile/edit_profile.screen.dart';
import 'package:kolearn/screen/ubahPassword/ubah_password.dart';

class ContainerAkun extends StatelessWidget {
  const ContainerAkun({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.loose,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 17.h),
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Akun",
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            RowBtn(
              icons: Icons.account_circle,
              textBtn: "Ubah Profile",
              isNext: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  const EditProfile(),
                  ),
                );
              },
            ),
            SizedBox(height: 3.h),
            const Divider(
              thickness: 2,
            ),
            SizedBox(height: 3.h),
            RowBtn(
              icons: Icons.lock_open,
              textBtn: "Ubah Password",
              isNext: true,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UbahPassword(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
