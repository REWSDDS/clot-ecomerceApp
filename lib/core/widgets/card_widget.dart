import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/model/cloth_model.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/core/utils/hive_service.dart';
import 'package:alfa/core/widgets/like_button.dart';
import 'package:alfa/features/product/page/product_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.model,
    this.onTapNeed = false,
    this.onTap,
  });

  final ClothModel model;
  final bool onTapNeed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => ProductScreen(
                    model: model,
                  ))),
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        width: 159,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color:
                checkCurrentTheme(MediaQuery.of(context).platformBrightness) ==
                        AppThemeMode.dark
                    ? ColorConst.darkGrey
                    : ColorConst.grey),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 8,
              child: Stack(
                children: [
                  // !
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(18),
                        topLeft: Radius.circular(18)),
                    child: Image.network(
                      height: double.infinity,
                      width: MediaQuery.of(context).size.width,
                      model.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      right: 1,
                      child: StatefulBuilder(builder: (context, setState) {
                        return LikeButton(
                            onTap: onTapNeed
                                ? onTap!
                                : () {
                                    if (HiveService.getAllLikedCloths()
                                        .contains(model)) {
                                      HiveService.unLikeCloth(model);
                                    } else {
                                      HiveService.likeCloth(model);
                                    }
                                    setState(() {});
                                  },
                            isLiked:
                                HiveService.getAllLikedCloths().contains(model)
                                    ? true
                                    : false);
                      }))
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      model.disCount
                          ? Row(
                              children: [
                                Text(
                                  '\$${model.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '\$${model.oldPrice}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            ColorConst.black.withOpacity(0.5),
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                )
                              ],
                            )
                          : Text(
                              '\$${model.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
