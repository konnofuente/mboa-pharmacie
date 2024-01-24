import 'dart:io';

import 'package:flutter/material.dart';

class HeaderImage extends StatelessWidget {
  final String bannerUrl;

  HeaderImage(this.bannerUrl);

  @override
  Widget build(BuildContext context) {
    return Image.file(File(bannerUrl,
    ));
  }
}
