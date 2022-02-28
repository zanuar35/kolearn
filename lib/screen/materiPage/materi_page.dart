// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kolearn/blocs/materi/cubit/materi_cubit.dart';

class MateriPage extends StatefulWidget {
  final int id;
  const MateriPage({Key? key, required this.id}) : super(key: key);

  @override
  _MateriPageState createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  int length = 0;
  final pageController = PageController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MateriCubit>(context).getMateri(widget.id);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: length == 0 ? 1 : length + 1,
        itemBuilder: (context, position) {
          return position <= length - 1 || position == 0
              ? _buildPage(position)
              : _buildPage2();
        },
      ),
    );
  }

  Widget _buildPage(int position) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text((position + 1).toString()),
        BlocBuilder<MateriCubit, MateriState>(
          builder: (context, state) {
            if (state is MateriLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MateriLoaded) {
              return Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 20.h),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close_rounded,
                          color: Color(0xff858585),
                          size: 30,
                        ),
                      )),
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
                              state.materi[position].hangeul,
                              style: TextStyle(
                                  fontSize: 120.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                            Text(
                              state.materi[position].bunyiHuruf,
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
                                  child: const Icon(
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
                  detailMateri(),
                  position != length - 1
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      pageController.nextPage(
                                          duration: Duration(
                                            milliseconds: 350,
                                          ),
                                          curve: Curves.fastLinearToSlowEaseIn);
                                    },
                                    child: const Text("Next"),
                                  ),
                                )
                              ]),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(width: 7),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    pageController.nextPage(
                                        duration: Duration(
                                          milliseconds: 350,
                                        ),
                                        curve: Curves.easeInExpo);
                                  },
                                  child: const Text("Finish"),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              );
            }
            return Container();
          },
        ),
        BlocConsumer<MateriCubit, MateriState>(
          listener: (context, state) {
            if (state is MateriLoaded) {
              setState(() {
                length = state.materi.length;
              });
            }
          },
          builder: (context, state) {
            return Container();
          },
        )
      ],
    );
  }

  Widget _buildPage2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Center(
          child: Text("Selesai"),
        ),
        ElevatedButton(onPressed: () {}, child: const Text("Finish"))
      ],
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.leave_bags_at_home_rounded,
                color: Colors.red[300],
              ),
              Text(
                "Tas",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "가 방",
                style: TextStyle(
                  fontSize: 45.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Ga bang",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Container(
            width: 30.w,
            height: 30.w,
            child: const Icon(
              Icons.volume_up_rounded,
              color: Color(0xffF8F8F8),
            ),
            decoration: const BoxDecoration(
                color: Color(0xff636363), shape: BoxShape.circle),
          )
        ],
      ),
    );
  }
}
