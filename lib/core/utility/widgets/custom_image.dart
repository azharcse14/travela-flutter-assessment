import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travela_assignment/core/utility/constants/asset_manger.dart';

class CustomImage extends StatelessWidget {
  final String imgUrl;
  final double? imgHeight;
  final double? imgWidth;
  final BoxFit? imgFit;
  final BoxShape boxShape;
  final double borderRadius;

  const CustomImage({
    super.key,
    required this.imgUrl,
    this.imgHeight,
    this.imgWidth,
    this.imgFit = BoxFit.cover,
    this.boxShape = BoxShape.rectangle,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imgWidth ?? 348,
      height: imgHeight,
      child: CachedNetworkImage(
        imageUrl:
            imgUrl.isNotEmpty ? imgUrl : ImageAssets.placeHolderNetworkImage,
        imageBuilder: (context, imageProvider) => DecoratedBox(
          decoration: BoxDecoration(
            shape: boxShape,
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
              image: imageProvider,
              fit: imgFit,
            ),
          ),
        ),
        placeholder: (context, url) => Transform.scale(
          scale: 1.0,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFF7F8FA),
                  Color(0xFFEDF2FA),
                ],
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                ImageAssets.placeHolderSvgImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Transform.scale(
          scale: 1.0,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFFF7F8FA),
                  Color(0xFFEDF2FA),
                ],
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                ImageAssets.placeHolderSvgImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
