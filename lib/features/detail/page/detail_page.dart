import 'package:alfa/core/model/cloth_model.dart';
import 'package:alfa/core/widgets/app_back_button.dart';
import 'package:alfa/core/widgets/card_widget.dart';
import 'package:alfa/features/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatigoriesDetailPage extends StatelessWidget {
  const CatigoriesDetailPage(
      {super.key, required this.data, required this.index});

  final List<ClothModel> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              "${context.watch<HomeProvider>().categoires[index].name}(${data.length})",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 23,
            ),
            SizedBox(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    var info = data[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CardWidget(model: info),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
