// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/register/cubit/register_cubit.dart';

class RegisterButton extends StatefulWidget {
  const RegisterButton({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passController,
    required TextEditingController confirmPassController,
    required TextEditingController nameController,
    required GlobalKey<FormState> formKey1,
  })  : _formKey1 = formKey1,
        _emailController = emailController,
        _passwordController = passController,
        _nameController = nameController,
        _confirmPassController = confirmPassController,
        super(key: key);

  final GlobalKey<FormState> _formKey1;

  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPassController;
  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print(widget._confirmPassController);
        print(widget._passwordController);
        // Send request to server
        if (widget._passwordController.text ==
                widget._confirmPassController.text &&
            widget._formKey1.currentState!.validate()) {
          BlocProvider.of<RegisterCubit>(context).registerEvent(
            widget._nameController.text,
            widget._emailController.text,
            widget._passwordController.text,
          );
        }
        // password not match
        else if (widget._passwordController.text !=
            widget._confirmPassController.text) {
          EasyLoading.showError('Password berbeda',
              maskType: EasyLoadingMaskType.custom,
              duration: const Duration(milliseconds: 1200));
        } else {
          EasyLoading.showError('Terjadi kesalahan',
              maskType: EasyLoadingMaskType.custom,
              duration: const Duration(milliseconds: 1500));
        }
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width, 55.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        // primary: const Color(0xff52C3FF),
      ),
      child: Text(
        "Daftar",
        style: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
