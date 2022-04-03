// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/screen/auth/login/service/cubit/obscuretext_cubit.dart';

class PassField extends StatefulWidget {
  const PassField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;
  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.h,
      width: 354.w,
      child: TextFormField(
        controller: widget.controller,
        obscureText: isObscure,
        style: TextStyle(fontSize: 16.sp),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock_open_rounded),
          suffixIcon: BlocBuilder<ObscuretextCubit, ObscuretextState>(
            builder: (context, state) {
              if (state is ObscureFalse) {
                return IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                      BlocProvider.of<ObscuretextCubit>(context).showPassword();
                    },
                    icon: Icon(Icons.visibility_off));
              }
              if (state is ObscureTrue) {
                return IconButton(
                    onPressed: () {
                      BlocProvider.of<ObscuretextCubit>(context).showPassword();
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(Icons.visibility));
              }
              return IconButton(
                  onPressed: () {
                    BlocProvider.of<ObscuretextCubit>(context).showPassword();
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(Icons.visibility));
            },
          ),
          hintText: "Password ",
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 13.sp, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0.r),
            borderSide: const BorderSide(
              color: Color(0xffDDE5E9),
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0.r),
            borderSide: const BorderSide(
              color: Color(0xffDDE5E9),
              width: 2.0,
            ),
          ),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter password';
          }
          return null;
        },
      ),
    );
  }
}


/*



*/