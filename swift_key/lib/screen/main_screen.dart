import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_key/Menu/navbar.dart';
import 'package:swift_key/screen/account.dart';
import 'package:swift_key/screen/home.dart';

import 'access.dart';

final bottomNavigatorIndex = StateProvider<int>((ref) => 1);

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  Widget getFragment(int index) {
    switch (index) {
      case 0:
        return const AccessScreen();
      case 1:
        return const HomeScreen();
      case 2:
        return const AccountScreen();
    }
    return const HomeScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getFragment(ref.watch(bottomNavigatorIndex)),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }
}
