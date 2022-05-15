import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/user_profile/cubit/user_profile_cubit.dart';
import 'package:kolearn/core/app_shared_preferences.dart';

class ContainerProfile extends StatefulWidget {
  const ContainerProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<ContainerProfile> createState() => _ContainerProfileState();
}

class _ContainerProfileState extends State<ContainerProfile> {
  @override
  void dispose() {
    super.dispose();
  }

  void getName() async {
    SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
    nama = await sharedPreferencesHelper.getUserName();
    setState(() {});
  }

  String? nama;

  @override
  void initState() {
    super.initState();
    nama == null ? getName() : null;
    BlocProvider.of<UserProfileCubit>(context).getUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hello, ",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff747474)),
                ),
                Text(
                  nama.toString()[0].toUpperCase() +
                      nama.toString().substring(1).toLowerCase(),
                  style: TextStyle(
                    fontSize: 24.sp,
                    letterSpacing: 0.7,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                BlocBuilder<UserProfileCubit, UserProfileState>(
                  builder: (context, state) {
                    return Container();
                  },
                ),
              ],
            ),
            CircleAvatar(
              radius: 30.r,
            )
          ],
        ),
      ),
    );
  }
}
