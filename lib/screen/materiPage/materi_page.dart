import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kolearn/blocs/materi/cubit/materi_cubit.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({Key? key}) : super(key: key);

  @override
  _MateriPageState createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  int length = 0;
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MateriCubit>(context).getMateri(3);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: length == 0 ? 1 : length,
        itemBuilder: (context, position) {
          return _buildPage(position);
        },
      ),
    );
  }

  Widget _buildPage(int position) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(position.toString()),
        BlocBuilder<MateriCubit, MateriState>(
          builder: (context, state) {
            if (state is MateriLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MateriLoaded) {
              return Column(
                children: [
                  Text(state.materi[position].hangeul),
                  Text(state.materi[position].bunyiHuruf),
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
}
