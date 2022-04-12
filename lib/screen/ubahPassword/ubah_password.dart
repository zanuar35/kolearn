import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/changePass/cubit/changepass_cubit.dart';

class UbahPassword extends StatefulWidget {
  const UbahPassword({Key? key}) : super(key: key);

  @override
  State<UbahPassword> createState() => _UbahPasswordState();
}

class _UbahPasswordState extends State<UbahPassword> {
  final _passOldC = TextEditingController();
  final _passwordBaruC = TextEditingController();
  final _konfirmPassBaru = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.chevron_left),
          ),
          title: const Text(
            "Ubah Password",
            style: TextStyle(fontSize: 16),
          )),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Kata sandi baru harus berbeda dengan kata sandi sekarang",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 35),
                labelText("Kata sandi sekarang"),
                const SizedBox(height: 10),
                PassTextField(isObscure: true, controller: _passOldC),
                const SizedBox(height: 10),
                labelText("kata sandi baru"),
                const SizedBox(height: 10),
                PassTextField(
                  controller: _passwordBaruC,
                  isObscure: true,
                ),
                const SizedBox(height: 10),
                labelText("konfirmasi kata sandi baru"),
                const SizedBox(height: 10),
                PassTextField(
                  controller: _konfirmPassBaru,
                  isObscure: true,
                ),
                const SizedBox(height: 30),
                saveBtn(),
                BlocConsumer<ChangepassCubit, ChangepassState>(
                  listener: (context, state) {
                    if (state is ChangepassSuccess) {
                      const snackBar = SnackBar(
                        backgroundColor: Color(0xff003663),
                        duration: Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        content: Text('Password berhasil diubah'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      // delay for 2 seconds
                      Future.delayed(const Duration(milliseconds: 2500), () {
                        Navigator.pop(context);
                      });
                    }
                    if (state is ChangepassFailed) {
                      final snackBar = SnackBar(
                        backgroundColor: const Color(0xffC73E1D),
                        duration: const Duration(seconds: 2),
                        behavior: SnackBarBehavior.floating,
                        content: Text(state.message),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  builder: (context, state) {
                    return Container();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget labelText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Widget saveBtn() {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 65.h,
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<ChangepassCubit>(context).changePassEvent(
                  _passOldC.text,
                  _passwordBaruC.text,
                  _konfirmPassBaru.text,
                );
              },
              child: BlocBuilder<ChangepassCubit, ChangepassState>(
                  builder: (context, state) {
                if (state is ChangepassLoading) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.transparent,
                        width: 20,
                        height: 20,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 4,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Loading...",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  );
                } else {
                  return const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  );
                }
              }),
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff7383BF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class PassTextField extends StatefulWidget {
  PassTextField({Key? key, required this.controller, required this.isObscure})
      : super(key: key);

  final TextEditingController controller;
  bool isObscure;

  @override
  State<PassTextField> createState() => _PassTextFieldState();
}

class _PassTextFieldState extends State<PassTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.white,
      child: TextFormField(
        obscureText: widget.isObscure,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                widget.isObscure = !widget.isObscure;
              });
            },
            icon: widget.isObscure == true
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
          hintText: "Enter your password here",
          hintStyle: const TextStyle(
              fontWeight: FontWeight.w400, fontSize: 14, color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Color(0xffDDE5E9),
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Color(0xffDDE5E9),
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
