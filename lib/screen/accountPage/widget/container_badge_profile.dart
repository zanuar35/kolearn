import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/core/app_shared_preferences.dart';

class ContainerBadgeProfile extends StatefulWidget {
  const ContainerBadgeProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<ContainerBadgeProfile> createState() => _ContainerBadgeProfileState();
}

class _ContainerBadgeProfileState extends State<ContainerBadgeProfile> {
  @override
  void initState() {
    super.initState();

    getName();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getName() async {
    SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
    nama = await sharedPreferencesHelper.getUserName();
    courseLenght = await sharedPreferencesHelper.getCourseLength();
    setState(() {});
  }

  String? nama;
  int? courseLenght;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(
          top: 5.h,
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
                child: Image.network(
                    'https://ui-avatars.com/api/?name=$nama&background=0D8ABC&color=fff&rounded=true'),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              nama.toString().toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  letterSpacing: 1),
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
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          courseLenght.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                        const Text("Materi"),
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
