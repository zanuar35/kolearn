import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CameraIcon extends StatelessWidget {
  const CameraIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: InkWell(
        child: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 4,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ], color: Colors.red, shape: BoxShape.circle),
          child: const Center(
            child: Icon(
              Icons.camera_alt_rounded,
              color: Colors.white,
            ),
          ),
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => BottomSheet(
                onClosing: () {},
                builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.camera),
                          title: const Text('Camera'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.w),
                          child: const Divider(
                            thickness: 2,
                          ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.filter),
                          title: const Text('Galeri'),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    )),
          );
        },
      ),
    );
  }
}
