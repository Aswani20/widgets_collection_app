import 'package:flutter/material.dart';
import 'package:widgets_collection_app/core/extensions/project_extensions.dart';
import 'package:widgets_collection_app/core/route/app_routes.dart';
import 'dot_indecator.dart';
import 'on_boarding_model.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  List<OnBoardingModel> onBoardingList = [
    OnBoardingModel(),
    OnBoardingModel(),
    OnBoardingModel(),
    OnBoardingModel(),
    OnBoardingModel(),
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentIndex = _pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x99202020),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: onBoardingList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(
                        onBoardingList[index].imagePath,
                        height: context.height * 0.45,
                      ),
                      SizedBox(height: context.height * 0.03),
                      Text(
                        onBoardingList[index].title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffE2BE7F),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      if (onBoardingList[index].description != null)
                        Padding(
                          padding: EdgeInsets.only(
                            top: context.height * 0.06,
                            left: context.width * 0.03,
                            right: context.width * 0.03,
                          ),
                          child: Text(
                            onBoardingList[index].description ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffE2BE7F),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      Spacer(),
                    ],
                  );
                },
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: currentIndex != 0
                          ? () {
                        _pageController.animateToPage(
                          currentIndex - 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.bounceInOut,
                        );
                      }
                          : null,
                      child: Text(
                        currentIndex != 0 ? "Back" : "",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffE2BE7F),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (currentIndex == 4) {
                          // saveOnBoarding();
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.homeScreen,
                          );
                        } else {
                          _pageController.animateToPage(
                            currentIndex + 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.bounceInOut,
                          );
                        }
                      },
                      child: Text(
                        currentIndex != 4? "Next" : "Finish",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xffE2BE7F),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotIndicator(active: currentIndex == 0),
                    DotIndicator(active: currentIndex == 1),
                    DotIndicator(active: currentIndex == 2),
                    DotIndicator(active: currentIndex == 3),
                    DotIndicator(active: currentIndex == 4),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Future<void> saveOnBoarding() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool("onBoarding", true);
  // }
}
