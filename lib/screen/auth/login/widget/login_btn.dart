// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/bloc/login_bloc.dart';

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
                    BlocProvider.of<LoginBloc>(context).add(LoginSubmit(
                        _emailController.text, _passwordController.text));
                  }
                },
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 18.sp,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )),
          ),
        )
      ],
    );
  }
}





// class LoginBtn extends StatelessWidget {
//   const LoginBtn({
//     Key? key,
//     required GlobalKey<FormState> formKey,
//   })  : _formKey = formKey,
//         super(key: key);

//   final GlobalKey<FormState> _formKey;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: ConstrainedBox(
//             constraints: BoxConstraints.tightFor(height: 55.h),
//             child: ElevatedButton(
//               onPressed: () {
//                 login(_formKey, context);
//               },
//               child: Text(
//                 "Login",
//                 style: TextStyle(
//                   fontSize: 18.sp,
//                   letterSpacing: 1,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// Future<void> login(GlobalKey<FormState> formKey, BuildContext context) async {
//   if (formKey.currentState!.validate()) {
    // EasyLoading.show(
    //   status: 'loading...',
    //   maskType: EasyLoadingMaskType.black,
    // );
//     var response = await http.post(
//       Uri.parse("https://reqres.in/api/login"),
//       body: ({
//         'email': 'eve.holt@reqres.in',
//         'password': 'cityslicka',
//       }),
//     );

//     if (response.statusCode == 200) {
//       EasyLoading.showSuccess('Login Success');
//       Timer(Duration(seconds: 2), () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => HomePage(),
        //   ),
        // );
//       });
//       print(response.body);
//     } else {
//       print(response.statusCode);
//     }
//   }
// }
