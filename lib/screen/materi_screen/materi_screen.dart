import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MateriScreen extends StatefulWidget {
  const MateriScreen({Key? key}) : super(key: key);

  @override
  _MateriScreenState createState() => _MateriScreenState();
}

class _MateriScreenState extends State<MateriScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xffE6F6FF),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 30.w, top: 30.h),
                  child: Icon(
                    Icons.close_rounded,
                    color: Color(0xff858585),
                    size: 30,
                  ),
                ),
                SizedBox(
                  height: 70.h,
                ),
                Center(
                  child: Container(
                    width: 352.h,
                    height: 350.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.30),
                            offset: Offset(0, 4),
                            blurRadius: 4)
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 15.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'ㄱ ',
                            style: TextStyle(
                                fontSize: 120.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                          Text(
                            'g',
                            style: TextStyle(
                                fontSize: 30.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(),
                              ),
                              Container(
                                width: 30.w,
                                height: 30.w,
                                child: Icon(
                                  Icons.volume_up_rounded,
                                  color: Color(0xffF8F8F8),
                                ),
                                decoration: const BoxDecoration(
                                    color: Color(0xff636363),
                                    shape: BoxShape.circle),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                detailMateri(),
                button()
              ],
            )),
      ),
    );
  }

  Widget detailMateri() {
    return Container(
      width: double.infinity,
      height: 176.h,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(-4, -3),
              blurRadius: 4)
        ],
        color: Color(0xffFDF8EE),
      ),
    );
  }

  Widget button() {
    return Container(
      width: double.infinity,
      height: 72.h,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(115, 131, 191, 1),
      ),
      child: Center(
          child: Text(
        "Lanjut",
        style: TextStyle(
            fontSize: 22.sp, color: Colors.white, fontWeight: FontWeight.w600),
      )),
    );
  }
}
