import 'package:flutter/material.dart';
import 'package:template_app/core/extensions/project_extensions.dart';
import 'package:template_app/core/route/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.onBoardingScreen),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[400],
                foregroundColor: Colors.white
              ),
              child: Text("Go To OnBoarding Screen"),
            ),
            16.heightBox,
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.sideBarScreen),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  foregroundColor: Colors.white
              ),
              child: Text("Go To Sidebar Screen"),
            ),
            16.heightBox,
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.zoomDrawerScreen),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  foregroundColor: Colors.white
              ),
              child: Text("Go To Animated Drawer"),
            ),
            16.heightBox,
            ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.tinderSwipeScreen),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[400],
                  foregroundColor: Colors.white
              ),
              child: Text("Go To Tinder Swipe Cards"),
            ),
          ],
        ),
      ),
    );
  }
}
