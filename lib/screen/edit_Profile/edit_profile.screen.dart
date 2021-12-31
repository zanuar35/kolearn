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
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 33.h)),
                  Stack(
                    children: <Widget>[
                      Hero(
                        tag: "fotoProfil",
                        child: CircleAvatar(
                          radius: 55.r,
                          backgroundColor: Colors.blue,
                        ),
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
                    height: 45.h,
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              // width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    labelText("Nama"),
                    SizedBox(
                      height: 10.h,
                    ),
                    const InputTextField(),
                    SizedBox(
                      height: 25.h,
                    ),
                    labelText("Email"),
                    SizedBox(
                      height: 10.h,
                    ),
                    const InputTextField(),
                    SizedBox(
                      height: 25.h,
                    ),
                    labelText("No telp"),
                    SizedBox(
                      height: 10.h,
                    ),
                    const InputTextField(),
                    SizedBox(
                      height: 25.h,
                    ),
                    labelText("Gender"),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      height: 60.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: const Color(0xffEFEFEF),
                      ),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: const Text("Jenis Kelamin"),
                        items: <String>['Laki-laki', 'Perempuan']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 55.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          primary: const Color(0xff7383BF),
                        ),
                        child: Text(
                          "Simpan",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ],
        ));
  }

  Widget labelText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class InputTextField extends StatelessWidget {
  const InputTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        height: 60.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: const Color(0xffEFEFEF),
        ),
        child: Center(
          child: TextFormField(
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ));
  }
}
