import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerBadgeProfile extends StatelessWidget {
  const ContainerBadgeProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          top: 15.h,
        ),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: "fotoProfil",
              child: CircleAvatar(
                radius: 40.r,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Contoh Nama",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: Container(
                padding: EdgeInsets.only(top: 10.h),
                color: Colors.white,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "1000",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                        const Text("Points"),
                      ],
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: VerticalDivider(
                        width: 4.w,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "4",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                        const Text("Courses"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
