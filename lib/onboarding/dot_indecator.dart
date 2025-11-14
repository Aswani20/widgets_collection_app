import 'package:flutter/material.dart';
import 'package:widgets_collection_app/core/extensions/project_extensions.dart';

class DotIndicator extends StatelessWidget {
  final bool active;
  const DotIndicator({super.key, required this.active});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: (context.width) * 0.01),
      height: 10,
      width: active ? 20 : 10 ,
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: active ? Color(0xffE2BE7F) : Colors.grey[400],
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
