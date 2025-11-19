// Example file showing how to use flutter_gen generated assets
// This file can be deleted - it's just for reference

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app_initial_structure/gen/assets.gen.dart';

class AssetsExample extends StatelessWidget {
  const AssetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Example 1: Using PNG/JPG images
        // After adding logo.png to assets/images/
        // Image.asset(Assets.images.logo),
        
        // Example 2: Using SVG icons
        // After adding home.svg to assets/icons/
        // SvgPicture.asset(
        //   Assets.icons.home,
        //   width: 24,
        //   height: 24,
        //   colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
        // ),
        
        // Example 3: Using custom fonts
        // After configuring fonts in pubspec.yaml
        // Text(
        //   'Hello World',
        //   style: TextStyle(
        //     fontFamily: FontFamily.customFont,
        //     fontSize: 16,
        //   ),
        // ),
        
        const Text('See ASSETS_GUIDE.md for complete usage instructions'),
      ],
    );
  }
}
