// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'obscuretext_state.dart';

class ObscuretextCubit extends Cubit<ObscuretextState> {
  ObscuretextCubit() : super(ObscuretextInitial());

  bool _isObscure = true;
  bool get isObscure => _isObscure;

  void showPassword() {
    _isObscure = !_isObscure;
    if (_isObscure == false) {
      emit(ObscureFalse());
    }
    if (_isObscure == true) {
      emit(ObscureTrue());
    }
  }
}
