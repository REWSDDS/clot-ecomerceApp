import 'package:alfa/core/model/cloth_model.dart';
import 'package:alfa/core/utils/hive_service.dart';
import 'package:alfa/core/widgets/app_back_button.dart';
import 'package:alfa/core/widgets/like_button.dart';
import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({
    super.key,
    required this.model,
  });

  final ClothModel model;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 65,
      leading: AppBackButton(),
      actions: [
        StatefulBuilder(builder: (context, setState) {
          return LikeButton(
              onTap: () {
                if (HiveService.getAllLikedCloths().contains(model)) {
                  HiveService.unLikeCloth(model);
                } else {
                  HiveService.likeCloth(model);
                }
                setState(() {});
              },
              isLiked: HiveService.getAllLikedCloths().contains(model)
                  ? true
                  : false);
        })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
