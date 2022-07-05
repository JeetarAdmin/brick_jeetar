import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

enum ImageType { svg, png }

class {{name.pascalCase()}}CacheImage extends StatelessWidget {
  final String imgUrl;
  final double? height;
  final double? width;
  final BoxFit boxFit;
  final double borderRadius;
  final bool showPlaceholder;
  final Widget? errorWidget;
  final int? memCacheHeight;
  final int? memCacheWidth;

  const {{name.pascalCase()}}CacheImage(
      {Key? key,
      this.height,
      this.width,
      required this.imgUrl,
      this.borderRadius = 0,
      this.boxFit = BoxFit.cover,
      this.showPlaceholder = false,
      this.errorWidget,
      this.memCacheHeight = 400,
      this.memCacheWidth = 400})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: getImageType(imgUrl) == ImageType.svg
          ? svgImageViewer()
          : CachedNetworkImage(
              imageUrl: imgUrl,
              height: height,
              width: width,
              fit: boxFit,
              memCacheHeight: memCacheHeight,
              memCacheWidth: memCacheWidth,
            ),
    );
  }

  Widget svgImageViewer() {
    return SvgPicture.network(
      imgUrl,
      height: height,
      width: width,
      fit: boxFit,
    );
  }

  ImageType getImageType(String url) {
    var path = url.split(".");
    String ext = path[path.length - 1];
    if (ext == "svg") return ImageType.svg;
    return ImageType.png;
  }
}

class ${{name.pascalCase()}}Lottie extends StatelessWidget {
  final String url;
  final double? height, width;
  const ${{name.pascalCase()}}Lottie({Key? key, required this.url, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height ?? 148.h,
        width: 148.w,
        child: Lottie.network(
          url,
        ));
  }
}
