import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'dark_mode_state.dart';

class DarkModeCubit extends Cubit<DarkModeState> {
  DarkModeCubit() : super(DarkModeState(isSwitched: false));

  void switchThemeMode(bool value) => emit(state.copyWith(changeState: value));
}
