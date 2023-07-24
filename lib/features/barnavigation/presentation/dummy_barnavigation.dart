import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../dummy/presentation/dummy_favorit.dart';
import '../../dummy/presentation/dummy_screen.dart';

class BarNavigation extends StatefulWidget {
  const BarNavigation({super.key});

  @override
  State<BarNavigation> createState() => _BarNavigationState();
}

class _BarNavigationState extends State<BarNavigation> {
  // void state() {
  //   if (mounted) {
  //     super.initState();
  //   }
  // }

  int _selectedTableIndex = 0;

  void _onNavbarTapped(int index) {
    setState(
      () {
        _selectedTableIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final listPage = <Widget>[
      DummyScreen(),
      const DummyFavorit(),
    ];

    final bottomNavbarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: '',
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.favorite,
        ),
        label: '',
      ),
    ];

    final bottomNavbar = BottomNavigationBar(
      backgroundColor:
          const Color.fromARGB(255, 117, 245, 121).withOpacity(0.7),
      items: bottomNavbarItems,
      currentIndex: _selectedTableIndex,
      selectedItemColor: Colors.yellow,
      unselectedItemColor: Colors.white,
      onTap: _onNavbarTapped,
    );
    return Scaffold(
      body: listPage[_selectedTableIndex],
      // body: Navigator(
      //   key: Get.nestedKey(1),
      //   pages: [
      //     MaterialPage(
      //       child: listPage[_selectedTableIndex],
      //     ),
      //   ],
      //   onPopPage: (route, result) {
      //     if (!route.didPop(result)) {
      //       return false;
      //     }
      //     setState(() {
      //       _selectedTableIndex = 0;
      //     });
      //     return true;
      //   },
      // ),

      // listPage[_selectedTableIndex],
      bottomNavigationBar: bottomNavbar,
    );
  }
}
