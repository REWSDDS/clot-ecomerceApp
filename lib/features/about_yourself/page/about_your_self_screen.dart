import 'package:alfa/core/utils/local_db_service.dart';
import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:alfa/core/widgets/custom_drop_down_widget.dart';
import 'package:alfa/features/about_yourself/provider/about_yourself_provider.dart';
import 'package:alfa/features/about_yourself/widgets/gender_pick_widget.dart';
import 'package:alfa/features/main/page/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AboutYourSelfScreen extends StatelessWidget {
  const AboutYourSelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 150),
              Text(
                'Tell us about yourself',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 22),
                child: Text(
                  'Who do you shop for ?',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const GenderPickWidget(),
              Padding(
                padding: const EdgeInsets.only(top: 56, bottom: 13),
                child: Text(
                  'How old are you ?',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              CustomDropDownWidget(
                itemValues: context.watch<AboutYourselfProvider>().itemValue,
                defaultValue: context.watch<AboutYourselfProvider>().age,
                onChanged: (value) {
                  context
                      .read<AboutYourselfProvider>()
                      .pickAge(value.toString());
                },
              ),
              const Spacer(),
              CustomAppButon(
                title: 'Finish',
                onTap: () {
                  final gender =
                      Provider.of<AboutYourselfProvider>(context, listen: false)
                                  .pickedGenderMen ==
                              PickedGender.men
                          ? 'Men'
                          : 'Women';
                  LocalDbService.saveData(key: 'gender', value: gender);
                  LocalDbService.saveData(
                      key: 'age',
                      value: Provider.of<AboutYourselfProvider>(context,
                              listen: false)
                          .age
                          .toString());
                  Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const MainScreen()),
                      (_) => false);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
