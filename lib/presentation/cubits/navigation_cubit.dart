import 'package:flutter_bloc/flutter_bloc.dart';

enum NavigationItems { home, favorites }

class NavigationCubit extends Cubit<NavigationItems> {
  NavigationCubit() : super(NavigationItems.home);

  void navigateTo(int index) {
    switch (index) {
      case 0:
        emit(NavigationItems.home);
        break;
      case 1:
        emit(NavigationItems.favorites);
        break;
    }
  }
}
