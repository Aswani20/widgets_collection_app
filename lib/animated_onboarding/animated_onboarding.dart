import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:template_app/core/route/app_routes.dart';

class AnimatedOnboarding extends StatelessWidget {
  AnimatedOnboarding({super.key});

  final data = [
    ItemData(
      title: "SEND MESSAGES",
      subtitle: "Send messages to your friends and family. ",
      image: const AssetImage("assets/images/image-2.png"),
      backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
      titleColor: Colors.amber,
      subtitleColor: Colors.white,

    ),
    ItemData(
      title: "CREATE GROUPS",
      subtitle: "Connent with your friends through groups.",
      image: const AssetImage("assets/images/image-3.png"),
      backgroundColor: Colors.white,
      titleColor: Colors.purple,
      subtitleColor: const Color.fromRGBO(0, 10, 56, 1),

    ),
    ItemData(
      title: "BE PRODUCTIVE",
      subtitle: "Get work done with your friends and be productive.",
      image: const AssetImage("assets/images/image-4.png"),
      backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
      titleColor: Colors.orange.shade600,
      subtitleColor: Colors.white,

    ),
    ItemData(
      title: "ADVANCE MESSAGING",
      subtitle: "Use advanced messaging features to get more out our app.",
      image: const AssetImage("assets/images/image-1.png"),
      backgroundColor: Colors.white,
      titleColor: Colors.red.shade400,
      subtitleColor: Colors.black,

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        onFinish: () => Navigator.pushReplacementNamed(context, AppRoutes.homeScreen),
        radius: 40,
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return ItemWidget(data: data[index]);
        },
      ),
    );
  }
}

class ItemData {
  final String title;
  final String subtitle;
  final ImageProvider image;
  final Color backgroundColor;
  final Color titleColor;
  final Color subtitleColor;

  ItemData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    required this.subtitleColor,
  });
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({required this.data, super.key});

  final ItemData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Flexible(flex: 20, child: Image(image: data.image)),
              const Spacer(flex: 1),
              Text(
                data.title,
                style: TextStyle(
                  color: data.titleColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                maxLines: 1,
              ),
              const Spacer(flex: 1),
              Text(
                data.subtitle,
                style: TextStyle(color: data.subtitleColor, fontSize: 20),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              const Spacer(flex: 10),
            ],
          ),
        ),
      ],
    );
  }
}