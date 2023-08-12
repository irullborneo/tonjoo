import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tonjoo/core/utils/tj_icons.dart';

class TjAvatarFile extends StatelessWidget {
  final String? path;
  final double? radius;
  final EdgeInsetsGeometry? margin;
  final GestureTapCallback? onTap;
  const TjAvatarFile(
      {this.path, this.radius, this.margin, this.onTap, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (path == null) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage(TjIcons.noAvatar),
      );
    }
    final File file = File(path!);
    if (file.existsSync()) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: FileImage(file),
      );
    } else {
      return CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage(TjIcons.noAvatar),
      );
    }
  }
}
