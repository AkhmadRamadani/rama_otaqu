import 'package:flutter/material.dart';
import 'package:rama_otaqu/core/assets/gen/assets.gen.dart';

class PoweredByOtaquWidget extends StatelessWidget {
  const PoweredByOtaquWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Powered by',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        Assets.images.brands.otaquBanner.image(height: 20, fit: BoxFit.cover),
      ],
    );
  }
}
