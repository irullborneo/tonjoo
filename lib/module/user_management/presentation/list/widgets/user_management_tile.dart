import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tonjoo/core/helpers/common_helper.dart';
import 'package:tonjoo/core/utils/tj_colors.dart';
import 'package:tonjoo/core/utils/tj_styles.dart';
import 'package:tonjoo/core/widgets/tj_avatar_file.dart';
import 'package:tonjoo/core/widgets/tj_avatar_network.dart';
import 'package:tonjoo/module/user_management/domain/entities/user_entity.dart';

class UserManagementTile extends StatelessWidget {
  final UserEntity data;
  final Function()? onDelete;
  const UserManagementTile({Key? key, required this.data, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Row(
        children: [
          CommonHelper.isLocaleImage(data.avatar)
              ? TjAvatarFile(
                  path: data.avatar,
                  radius: 35.w,
                )
              : TjAvatarNetwork(
                  url: data.avatar,
                  radius: 35.w,
                ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.fullName(),
                style: TjStyles.title,
              ),
              Text(
                data.gender ?? "-",
                style: TjStyles.caption,
              ),
              Text(
                data.email ?? "-",
                style: TjStyles.subTitle,
              ),
            ],
          ),
          const Spacer(),
          IconButton(
              onPressed: onDelete,
              icon: const Icon(
                Icons.clear,
                color: TjColors.dangerMain,
              ))
        ],
      ),
    );
  }
}
