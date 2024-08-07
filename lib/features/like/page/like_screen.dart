
import 'package:alfa/core/model/cloth_model.dart';
import 'package:alfa/core/utils/hive_service.dart';
import 'package:alfa/core/widgets/app_back_button.dart';
import 'package:alfa/core/widgets/card_widget.dart';
import 'package:alfa/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class LikeScreen extends StatefulWidget {
  const LikeScreen({super.key});

  @override
  State<LikeScreen> createState() => _LikeScreenState();
}

class _LikeScreenState extends State<LikeScreen> {
  ValueNotifier<String> teststring = ValueNotifier('My favourites');

  @override
  void initState() {
    super.initState();
    likedCloths = ValueNotifier(HiveService.getAllLikedCloths());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingWidth: 80,
        leading: const AppBackButton(),
        titleText: likedCloths.value.isNotEmpty
            ? 'My favourites (${likedCloths.value.length})'
            : "My favourites",
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 32, right: 24, left: 24),
        child: ValueListenableBuilder(
            valueListenable: likedCloths,
            builder: (context, value, child) {
              return SizedBox(
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: likedCloths.value.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      var info = likedCloths.value[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: CardWidget(
                            onTapNeed: true,
                            onTap: () {
                              if (HiveService.getAllLikedCloths()
                                  .contains(info)) {
                                HiveService.unLikeCloth(info);
                              } else {
                                HiveService.likeCloth(info);
                              }
                              List<ClothModel> temp =
                                  List.from(HiveService.getAllLikedCloths());
                              likedCloths.value = temp;

                              setState(() {});
                            },
                            model: info),
                      );
                    }),
              );
            }),
      ),
    );
  }
}

// ValueNotifier<List<ClothModel>> likeCloths = ValueNotifier([]);

// ValueNotifier(likeCloths.value.isNotEmpty
//             ? 'My favourites (${likeCloths.value.length})'
//             : "My favourites");

ValueNotifier<List<ClothModel>> likedCloths = ValueNotifier([]);
