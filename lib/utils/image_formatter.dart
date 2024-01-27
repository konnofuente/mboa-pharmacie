import 'package:flutter_svg/flutter_svg.dart';
  import 'package:flutter/material.dart';

  class ImageFormatter {
    
static Widget buildImageAsset(String assetName, [double width = 450]) {
    return Image.asset(assetName, width: width);
  }

  static Widget buildImageSvg(String assetName, [double? width=450]) {
  return SvgPicture.asset(
    assetName,
    width: width, // Optionally set width, if needed
    // You might also want to set a `height` or other properties
  );
}

  }

