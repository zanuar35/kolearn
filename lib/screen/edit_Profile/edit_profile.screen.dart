// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/user_profile/cubit/user_profile_cubit.dart';
import 'package:kolearn/models/user/user_model.dart';
import 'package:kolearn/screen/edit_Profile/widget/camera_icon.dart';
import 'package:kolearn/screen/edit_Profile/widget/input_textfield.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _nameController = TextEditingController();

  final _telpController = TextEditingController();

  late String dataAwal;
  List data = [
    {'judul': "Laki-Laki", 'data': 'Laki-Laki'},
    {'judul': "Perempuan", 'data': 'Perempuan'},
  ];

  @override
  void initState() {
    dataAwal = data[0]["data"];
    BlocProvider.of<UserProfileCubit>(context).getUserProfile();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _telpController.dispose();
    super.dispose();
  }

  UserModel? userModel;

  String hint = 'Loading';
  String hintNama = '';
  String hintEmail = '';
  String hintTelp = '';

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
                      const CameraIcon()
                    ],
                  ),
                  SizedBox(
                    height: 35.h,
                  )
                ],
              ),
            ),
            Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      labelText("Nama"),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlocBuilder<UserProfileCubit, UserProfileState>(
                        builder: (context, state) {
                          if (state is UserProfileLoading) {
                            return InputTextField(
                              hints: "Loading..",
                              controller: _nameController,
                            );
                          }
                          if (state is UserProfileLoaded) {
                            return InputTextField(
                              hints: state.user.data!.name.toString(),
                              controller: _nameController,
                            );
                          }
                          if (state is UserProfileUpdated) {
                            return InputTextField(
                              hints: state.user.data!.name.toString(),
                              controller: _nameController,
                            );
                          }
                          return Container();
                        },
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      labelText("Email"),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlocBuilder<UserProfileCubit, UserProfileState>(
                        builder: (context, state) {
                          if (state is UserProfileLoading) {
                            return InputTextField(
                              hints: "Loading..",
                              controller: _emailController,
                            );
                          }
                          if (state is UserProfileLoaded) {
                            return InputTextField(
                              hints: state.user.data!.email.toString(),
                              controller: _emailController,
                            );
                          }
                          if (state is UserProfileUpdated) {
                            return InputTextField(
                              hints: state.user.data!.email.toString(),
                              controller: _emailController,
                            );
                          }
                          return Container();
                        },
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      labelText("No telp"),
                      SizedBox(
                        height: 10.h,
                      ),
                      BlocBuilder<UserProfileCubit, UserProfileState>(
                        builder: (context, state) {
                          if (state is UserProfileLoading) {
                            return InputTextField(
                              hints: "Loading..",
                              controller: _telpController,
                            );
                          }
                          if (state is UserProfileLoaded) {
                            return InputTextField(
                              hints: state.user.data!.telp.toString(),
                              controller: _telpController,
                            );
                          }
                          if (state is UserProfileUpdated) {
                            return InputTextField(
                              hints: state.user.data!.telp.toString(),
                              controller: _telpController,
                            );
                          }
                          return Container();
                        },
                      ),
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
                            value: dataAwal,
                            items: data
                                .map((e) => DropdownMenuItem(
                                    child: Text("${e['judul']}"),
                                    value: "${e['data']}"))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                dataAwal = value!;
                              });
                            }),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<UserProfileCubit>(context)
                                .updateUserProfile(
                                    _nameController.text,
                                    _emailController.text,
                                    _telpController.text,
                                    dataAwal);
                            _formKey.currentState?.reset();
                            _nameController.clear();
                            _emailController.clear();
                            _telpController.clear();
                          },
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
                      BlocConsumer<UserProfileCubit, UserProfileState>(
                        listener: (context, state) {
                          if (state is UserProfileLoading) {
                            EasyLoading.show(
                              status: 'loading...',
                              maskType: EasyLoadingMaskType.black,
                            );
                          }
                          if (state is UserProfileUpdated) {
                            EasyLoading.dismiss();
                            EasyLoading.showSuccess('Berhasil');
                          }
                          if (state is UserProfileLoaded) {
                            EasyLoading.dismiss();
                          }
                          if (state is UserProfileError) {
                            EasyLoading.showError('Terjadi kesalahan');
                          }
                        },
                        builder: (context, state) {
                          return Container();
                        },
                      )
                    ]),
              ),
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
