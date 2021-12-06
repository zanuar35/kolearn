import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Edit Profile"),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left_rounded),
        ),
      ),
      body: ListView(
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Container(
                padding: EdgeInsets.only(top: 33.h),
                width: double.infinity,
                color: Colors.blue.shade100,
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 55.r,
                          backgroundColor: Colors.blue,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 0,
                                blurRadius: 4,
                                offset: const Offset(
                                    0, 2), // changes position of shadow
                              ),
                            ], color: Colors.red, shape: BoxShape.circle),
                            child: const Center(
                              child: Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 60.h,
                    )
                  ],
                )),
          ),
          Flexible(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            color: Colors.green.shade100,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Nama"),
                TextFormField(),
                SizedBox(
                  height: 25.h,
                ),
                const Text("Nama"),
                TextFormField(),
                SizedBox(
                  height: 25.h,
                ),
                const Text("Nama"),
                TextFormField(),
                SizedBox(
                  height: 25.h,
                ),
                const Text("Nama"),
                TextFormField(),
                SizedBox(
                  height: 35.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 55.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      primary: const Color(0xffEC3528),
                    ),
                    child: Text(
                      "Log out",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 55.h,
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
