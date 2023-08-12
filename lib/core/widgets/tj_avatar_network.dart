import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tonjoo/core/utils/tj_icons.dart';

class TjAvatarNetwork extends StatelessWidget {
  final String? url;
  final double? radius;
  final EdgeInsetsGeometry? margin;
  final GestureTapCallback? onTap;
  const TjAvatarNetwork(
      {this.url,
      this.radius,
      this.margin,
      this.onTap,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (url != null) {
      return CachedNetworkImage(
        imageUrl: url!,
        imageBuilder: (context, imageProvider) {
          return InkWell(
            onTap: onTap,
            child: CircleAvatar(
              radius: radius,
              backgroundImage: imageProvider,
            ),
          );
        },
        placeholder: (context, url) {
          return CircleAvatar(
            radius: radius,
          );
        },
        errorWidget: (context, url, error) {
          return CircleAvatar(
            radius: radius,
            backgroundImage: const AssetImage(TjIcons.noAvatar),
          );
        },
      );
    } else {
      return CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage(TjIcons.noAvatar),
      );
    }
  }
}
