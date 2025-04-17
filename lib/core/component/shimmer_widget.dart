import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFeaeaea),
      highlightColor: const Color(0xFFF8F8F8),
      period: const Duration(milliseconds: 1000),
      direction: ShimmerDirection.rtl,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color(0xFFffffff),
      ),
    );
  }
}
