import 'package:asman_work/utils/globals/enums.dart';
import 'package:bloc/bloc.dart';

class BottomNavigationProvider extends Cubit<EnumScreenName> {
  BottomNavigationProvider() : super(EnumScreenName.home);

  void changeScreen(EnumScreenName name) {
    emit(name);
  }
}
