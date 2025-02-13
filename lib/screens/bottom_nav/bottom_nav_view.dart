import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:print_app/screens/home/home_view.dart';
import 'package:provider/provider.dart';
import '../../utils/export.dart';
import '../new_habit/export.dart';
import 'bottom_nav_viewmodel.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BottomNavViewModel(),
      child: Scaffold(
        body: _BottomNavViewBody(),
      ),
    );
  }
}

class _BottomNavViewBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {
          AppNav().to(
            context: context,
              screen: const NewHabitView());
          // Handle floating action button press
        },
        backgroundColor: AppColors().primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Consumer<BottomNavViewModel>(
        builder: (context, viewModel, child) {
          return AnimatedBottomNavigationBar(
            notchMargin: 4.0,
            icons: viewModel.iconList,
            activeIndex: viewModel.bottomNavIndex,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.smoothEdge,
            onTap: (index) => viewModel.updateIndex(index),
            activeColor: AppColors().primaryColor,
            inactiveColor: AppColors().greyColor, // Set your desired inactive icon color
          );
        },
      ),
      body: Consumer<BottomNavViewModel>(
        builder: (context, viewModel, child) {
          return _buildBody(viewModel.bottomNavIndex);
        },
      ),
    );
  }

  Widget _buildBody(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomeView();
      case 1:
        return  NewHabitView();
      case 2:
        return const NewHabitView();
      case 3:
        return const NewHabitView();
      default:
        return Container();
    }
  }
}


