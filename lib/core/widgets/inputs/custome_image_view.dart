import 'dart:io';

import 'package:app_initial_structure/core/theme/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../gen/assets.gen.dart';

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (startsWith('http') || startsWith('https')) {
      if (endsWith('.svg')) {
        return ImageType.networkSvg;
      }
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('/')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

enum ImageType { svg, png, network, networkSvg, file, unknown }

class AppImage extends StatelessWidget {
  AppImage({
    super.key,
    String? imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.placeHolder,
    this.greyOut = false,
  }) : imagePath =
           (imagePath == null || imagePath.isEmpty)
               ? Assets.images.noImageFound.path
               : imagePath;

  final String imagePath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final String? placeHolder;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final BoxBorder? border;
  final bool greyOut;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment!, child: _buildWidget())
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(onTap: onTap, child: _buildCircleImage()),
    );
  }

  ///build the image with border radius
  _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: _buildImageWithBorder(),
      );
    } else {
      return _buildImageWithBorder();
    }
  }

  ///build the image with border and border radius style
  _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(border: border, borderRadius: radius),
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    Widget image;

    switch (imagePath.imageType) {
      case ImageType.svg:
        image = SizedBox(
          height: height,
          width: width,
          child: SvgPicture.asset(
            imagePath,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
            colorFilter:
                color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
          ),
        );
        break;

      case ImageType.file:
        image = Image.file(
          File(imagePath),
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          color: color,
        );
        break;

      case ImageType.networkSvg:
        image = SvgPicture.network(
          imagePath,
          height: height,
          width: width,
          fit: fit ?? BoxFit.contain,
          colorFilter:
              color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
        );
        break;

      case ImageType.network:
        image = CachedNetworkImage(
          height: height,
          width: width,
          fit: fit,
          imageUrl: imagePath,
          color: color,
          placeholder:
              (context, url) => SizedBox(
                height: 30,
                width: 30,
                child: LinearProgressIndicator(
                  color: AppColors.grey,
                  backgroundColor: AppColors.greyLight,
                ),
              ),
          errorWidget:
              (context, url, error) => Image.network(
                placeHolder ?? Assets.images.noImageFound.path,
                height: height,
                width: width,
                fit: fit ?? BoxFit.cover,
              ),
        );
        break;

      case ImageType.png:
      default:
        image = Image.asset(
          imagePath,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
          color: color,
        );
        break;
    }

    if (greyOut) {
      image = ColorFiltered(
        colorFilter: const ColorFilter.matrix(<double>[
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0,      0,      0,      1, 0,
        ]),
        child: image,
      );
    }

    return image;
  }
}
