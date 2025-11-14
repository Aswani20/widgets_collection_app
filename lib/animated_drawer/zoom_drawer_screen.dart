import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:template_app/core/route/app_routes.dart';

import 'main_screen.dart';
import 'menu_screen.dart';

class ZoomDrawerScreen extends StatefulWidget {
  const ZoomDrawerScreen({super.key});

  @override
  _ZoomDrawerScreenState createState() => _ZoomDrawerScreenState();
}

class _ZoomDrawerScreenState extends State<ZoomDrawerScreen> {
  final ZoomDrawerController _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      menuScreen: MenuScreen(
        onItemSelected: () {
          _drawerController.toggle!();
          Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        },
      ),
      mainScreen: MainScreen(
        onMenuPressed: () {
          _drawerController.toggle!();
        },
      ),
      borderRadius: 24.0,
      showShadow: true,
      angle: -12.0,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
    );
  }
}