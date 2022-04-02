import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/user_profile/cubit/user_profile_cubit.dart';

class ContainerProfile extends StatefulWidget {
  const ContainerProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<ContainerProfile> createState() => _ContainerProfileState();
}

class _ContainerProfileState extends State<ContainerProfile> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserProfileCubit>(context).getUserProfile();
  }

  @override
  void dispose() {
    super.dispose();
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
                BlocBuilder<UserProfileCubit, UserProfileState>(
                  builder: (context, state) {
                    if (state is UserProfileLoading) {
                      return Text("Loading...",
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                          ));
                    }
                    if (state is UserProfileLoaded) {
                      String name =
                          state.user.data!.name.toString()[0].toUpperCase() +
                              state.user.data!.name
                                  .toString()
                                  .substring(1)
                                  .toLowerCase();
                      return Text(name,
                          style: TextStyle(
                            fontSize: 24.sp,
                            letterSpacing: 0.7,
                            fontWeight: FontWeight.w600,
                          ));
                    }
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
