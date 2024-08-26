abstract class DarkModeStates {
  const DarkModeStates();
}

class DarkModeInitialState extends DarkModeStates {}

class DarkModeChangeState extends DarkModeStates {
  final bool isDark;
  const DarkModeChangeState({required this.isDark});
}
