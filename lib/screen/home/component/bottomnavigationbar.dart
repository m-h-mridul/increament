// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:incrementapp/AppColor.dart';

class Bottomnavigationbar {
  BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: 0,
    backgroundColor: AppColor().background,
    selectedItemColor: Color(0xFF6C63FF),
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        backgroundColor: AppColor().greay,
        icon: Icon(
          Icons.home_outlined,
          size: 32,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        backgroundColor: AppColor().greay,
        icon: Icon(
          Icons.search,
          size: 32,
        ),
        label: '',
      ),
      BottomNavigationBarItem(
        backgroundColor: AppColor().greay,
        icon: Icon(Icons.save_alt, size: 32),
        label: '',
      ),
      BottomNavigationBarItem(
        backgroundColor: AppColor().greay,
        icon: Icon(Icons.menu, size: 32),
        label: '',
      ),
      BottomNavigationBarItem(
        backgroundColor: Color(0xFF5A6861),
        icon: Icon(Icons.person, size: 32),
        label: '',
      ),
    ],
  );
}
