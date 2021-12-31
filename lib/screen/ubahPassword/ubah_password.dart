import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UbahPassword extends StatelessWidget {
  const UbahPassword({Key? key}) : super(key: key);

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
          title: const Hero(
            tag: "ubahpw",
            child: Text(
              "Ubah Password",
              style: TextStyle(fontSize: 16),
            ),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 50),
                labelText("kata sandi sekarang"),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  child: passField(),
                ),
                const SizedBox(height: 10),
                labelText("kata sandi baru"),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  child: passField(),
                ),
                const SizedBox(height: 10),
                labelText("konfirmasi kata sandi baru"),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 60,
                  color: Colors.white,
                  child: passField(),
                ),
                const SizedBox(height: 30),
                loginBtn()
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

  Widget loginBtn() {
    return Row(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 65.h,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Simpan"),
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

  Widget passField() {
    return TextFormField(
      decoration: InputDecoration(
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
    );
  }
}
