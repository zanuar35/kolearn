import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolearn/blocs/notification/cubit/notification_cubit.dart';
import 'package:shimmer/shimmer.dart';

class NotifScreen extends StatefulWidget {
  const NotifScreen({Key? key}) : super(key: key);

  @override
  State<NotifScreen> createState() => _NotifScreenState();
}

class _NotifScreenState extends State<NotifScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotificationCubit>(context).getNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE6F6FF),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text("Notification"),
      ),
      body: SafeArea(
        child: BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            if (state is NotificationLoading) {
              return Shimmer.fromColors(
                  baseColor: const Color.fromARGB(255, 216, 211, 211),
                  highlightColor: const Color.fromARGB(255, 231, 231, 231),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 2,
                    itemBuilder: (context, index) => Card(
                      elevation: 6,
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          backgroundColor: Colors.green[300],
                        ),
                        title: const Text(''),
                        subtitle: const Text(""),
                        trailing: const Text(""),
                      ),
                    ),
                  ));
            }
            if (state is NotificationLoaded) {
              return state.myCourse.isEmpty
                  ? const Center(
                      child: Text(
                        "Belum ada data",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.myCourse.length,
                      itemBuilder: (context, index) => Card(
                            elevation: 6,
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              leading: CircleAvatar(
                                  child: state.myCourse[index]['status'] ==
                                          'started'
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        )
                                      : const Icon(
                                          Icons.emoji_events,
                                          color: Colors.white,
                                        ),
                                  backgroundColor: state.myCourse[index]
                                              ['status'] ==
                                          'started'
                                      ? Colors.green[500]
                                      : Colors.blue[500]),
                              title:
                                  state.myCourse[index]['status'] == 'started'
                                      ? const Text('Berhasil Memulai')
                                      : const Text('Menyelesaikan Kelas'),
                              subtitle:
                                  Text(state.myCourse[index]['course_name']),
                              trailing:
                                  Text(state.myCourse[index]['changed_at']),
                            ),
                          ));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
