import 'package:asman_work/utils/globals/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavigationProvider extends Cubit<EnumScreenName> {
  BottomNavigationProvider(super.initialState);

  void changeScreen(EnumScreenName name) {
    emit(name);
  }
}
