part of 'dark_mode_cubit.dart';

class DarkModeState {
  final bool isSwitched;
  late ThemeData theme;

  DarkModeState({required this.isSwitched}) {
    if(isSwitched == false)
    {
      theme = ThemeData.light();
    } else {
      theme = ThemeData.dark();
    }
  }

  DarkModeState copyWith({required bool changeState}) {
    return DarkModeState(isSwitched: changeState);
  }
}
