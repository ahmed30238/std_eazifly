import 'package:cached_network_image/cached_network_image.dart';
import 'package:eazifly_student/core/extensions/num_extentions.dart';
import 'package:eazifly_student/core/images/my_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarImage extends StatelessWidget {
  final String? imageUrl;
  final double? width;
  final double? height;
  final double? radius;
  final BoxShape shape;
  final double borderWidth;
  final Color borderColor;
  final Widget? child;
  final String fallbackAssetPath;

  const AvatarImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.radius,
    this.shape = BoxShape.rectangle,
    this.borderWidth = 0,
    this.borderColor = Colors.transparent,
    this.child,
    this.fallbackAssetPath = Assets.imagesPersona, // تأكد من وجودها
  });

  bool _isSvgImage(String url) {
    return url.toLowerCase().endsWith('.svg') || url.contains('.svg');
  }

  Widget _buildImage() {
    final url = imageUrl ?? "https://hossam.mallahsoft.com/storage/client/instructor/1742280038.png";
    
    // Check if it's an asset path
    if (url.startsWith('assets/') || url.startsWith('asset/')) {
      if (_isSvgImage(url)) {
        return SvgPicture.asset(
          url,
          fit: BoxFit.cover,
        );
      } else {
        return Image.asset(
          url,
          fit: BoxFit.cover,
        );
      }
    }
    
    // Handle network images
    if (_isSvgImage(url)) {
      return SvgPicture.network(
        url,
        fit: BoxFit.cover,
        placeholderBuilder: (context) => 
            const Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    } else {
      return CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.cover,
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator(strokeWidth: 2)),
        errorWidget: (context, url, error) => _buildFallbackImage(),
      );
    }
  }

  Widget _buildFallbackImage() {
    if (_isSvgImage(fallbackAssetPath)) {
      return SvgPicture.asset(
        fallbackAssetPath,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        fallbackAssetPath,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: width ?? 48.w,
      height: height ?? 48.w,
      decoration: BoxDecoration(
        shape: shape,
        border: Border.all(
          width: borderWidth,
          color: borderColor,
        ),
        borderRadius: shape == BoxShape.rectangle ? 8.cr : null,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildImage(),
          if (child != null) child!,
        ],
      ),
    );
  }
}