import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:template_app/animated_drawer/zoom_drawer_screen.dart';
import 'package:template_app/animated_onboarding/animated_onboarding.dart';
import 'package:template_app/collapsible_sidebar/sidebar_screen.dart';
import 'package:template_app/core/extensions/project_extensions.dart';
import 'package:template_app/floating_bottom_bar/floating_bottom_bar_screen.dart';
import 'package:template_app/home_screen.dart';
import 'package:template_app/onboarding/on_boarding_screen.dart';
import 'package:template_app/tinder_swipe_cards/tinder_swipe_screen.dart';
import 'app_routes.dart';

abstract class Routes {
  static Route generateRoute(RouteSettings settings) {
    final url = Uri.parse(settings.name ?? "/");
    switch (url.path) {
      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnBoardingPage());
      case AppRoutes.animatedOnboardingScreen:
        return MaterialPageRoute(builder: (_) => AnimatedOnboarding());
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case AppRoutes.sideBarScreen:
        return MaterialPageRoute(builder: (_) => SidebarScreen());
      case AppRoutes.zoomDrawerScreen:
        return MaterialPageRoute(builder: (_) => ZoomDrawerScreen());
      case AppRoutes.tinderSwipeScreen:
        return MaterialPageRoute(builder: (_) => TinderSwipeScreen());
      case AppRoutes.floatingBottomBarScreen:
        return MaterialPageRoute(builder: (_) => FloatingBottomBarScreen(title: "Aswani",));
      default:
        return MaterialPageRoute(builder: (context) => NotFoundScreen());
    }
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 6,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/no_routes.png",
                  width: context.width,
                  height: context.height,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 50,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      FadeAnimatedText(
                        "404 Not Found ",
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 50,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Oops! We couldn't find the page you're looking for.",
                  style: TextStyle(fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                (context.height * 0.02).heightBox,
                SizedBox(
                  width: context.width * 0.6,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.onBoardingScreen,
                      );
                    },
                    child: Text("Go to Home"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
