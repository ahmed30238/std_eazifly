// import 'package:eazifly/core/component/avatar_image.dart';
import 'package:eazifly_student/core/component/avatar_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FullScreenImageView extends StatelessWidget {
  final String imageUrl;

  const FullScreenImageView({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // الصورة في ملء الشاشة
          Center(
            child: Hero(
              tag: 'image_hero', // نفس الـ tag المستخدم في الصورة الأصلية
              child: InteractiveViewer(
                // يسمح بالتكبير والتصغير
                minScale: 0.1,
                maxScale: 4.0,
                child: AvatarImage(
                  imageUrl: imageUrl,
                  // fit: BoxFit.contain,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
          ),
          // زر الإغلاق
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
