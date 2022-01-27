// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/login/cubit/login_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required GlobalKey<FormState> formKey,
  })  : _emailController = emailController,
        _passwordController = passwordController,
        _formKey = formKey,
        super(key: key);

  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: 55.h),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // BlocProvider.of<LoginBloc>(context).add(LoginSubmit(
                  //     _emailController.text, _passwordController.text));
                  BlocProvider.of<LoginCubit>(context).loginEvent(
                      _emailController.text, _passwordController.text);
                }
              },
              child: Text(
                "Masuk",
                style: TextStyle(
                  fontSize: 18.sp,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 60.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
