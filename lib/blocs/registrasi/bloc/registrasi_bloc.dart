import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kolearn/models/user/user_regis.dart';
import 'package:kolearn/repositories/user/user_regis_repo.dart';

part 'registrasi_event.dart';
part 'registrasi_state.dart';

class RegistrasiBloc extends Bloc<RegistrasiEvent, RegistrasiState> {
  final UserRegisRepository userRegisRepository;
  RegistrasiBloc(this.userRegisRepository) : super(RegistrasiInitial()) {
    on<RegistrasiSubmit>((event, emit) async {
      try {
        emit(RegistrasiLoading());
        List<UserRegist> userRegist = await userRegisRepository.registrasiUser(
            event.email, event.password);
        emit(RegistrasiSuccess(userRegist));
      } catch (e) {
        emit(RegistrasiFailed());
      }
    });
  }
}
