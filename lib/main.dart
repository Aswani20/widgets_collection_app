import 'package:flutter/material.dart';
import 'package:template_app/collapsible_sidebar/sidebar_screen.dart';
import 'package:template_app/core/route/app_routes.dart';
import 'package:template_app/core/route/routes.dart';
import 'package:template_app/tinder_swipe_cards/tinder_swipe_screen.dart';
import 'animated_drawer/zoom_drawer_screen.dart' show ZoomDrawerScreen;
import 'animated_onboarding/animated_onboarding.dart';
import 'floating_bottom_bar/floating_bottom_bar_screen.dart';
import 'home_screen.dart';
import 'onboarding/on_boarding_screen.dart';

void main(){
 runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Template App",
      locale: Locale("en"),
      onGenerateRoute: Routes.generateRoute,
      initialRoute: AppRoutes.homeScreen,
      routes: {
        AppRoutes.homeScreen: (context) => HomeScreen(),
        AppRoutes.onBoardingScreen: (context) => OnBoardingPage(),
        AppRoutes.sideBarScreen: (context) => SidebarScreen(),
        AppRoutes.zoomDrawerScreen: (context) => ZoomDrawerScreen(),
        AppRoutes.tinderSwipeScreen: (context) => TinderSwipeScreen(),
        AppRoutes.floatingBottomBarScreen: (context) => FloatingBottomBarScreen(title: "Aswani",),
        AppRoutes.animatedOnboardingScreen: (context) => AnimatedOnboarding()

      },
    );
  }
}

