import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:notices_app/presentation/cubits/navigation_cubit.dart';

class Appbottomnavigationbar extends StatelessWidget {
  const Appbottomnavigationbar({super.key});
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationItems>(
      builder: (context, state) {
        int currentIndex = 0;
        if (state == NavigationItems.favorites) {
          currentIndex = 1;
        }

        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
          ],
          currentIndex: currentIndex,
          selectedItemColor: Colors.green[800],
          onTap: (int index) {
            BlocProvider.of<NavigationCubit>(context).navigateTo(index);
            switch (index) {
              case 0:
                context.go('/home');
                break;
              case 1:
                context.go('/favorites');
                break;
            }
          },
        );
      },
    );
  }
}
