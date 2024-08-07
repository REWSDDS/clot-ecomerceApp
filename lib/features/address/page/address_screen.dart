import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/model/address_model.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/core/utils/hive_service.dart';
import 'package:alfa/core/widgets/app_back_button.dart';
import 'package:alfa/core/widgets/custom_app_bar.dart';
import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:alfa/features/address/add_address/page/address_add_screen.dart';
import 'package:alfa/features/address/add_address/provider/add_address_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late List<AddressModel> address = [];
  @override
  void initState() {
    super.initState();
    // Provider.of<AddAddressProvider>(context).address = HiveService.allAddress();
    address += HiveService.allAddress();
  }

  @override
  Widget build(context) {
    final mode = checkCurrentTheme(MediaQuery.platformBrightnessOf(context)) ==
        AppThemeMode.light;
    final text = Theme.of(context).textTheme;
    return Scaffold(
      floatingActionButton: address.isEmpty
          ? const SizedBox()
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (_) => AddressAddScreen()));
              },
              child: SvgPicture.asset(
                IconsConst.increment,
                colorFilter: ColorFilter.mode(
                    mode ? ColorConst.white : ColorConst.black,
                    BlendMode.srcIn),
                width: 35,
              ),
            ),
      appBar: const CustomAppBar(
        leadingWidth: 80,
        leading: AppBackButton(),
        isTitleText: true,
        titleText: "Address",
      ),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: address.isEmpty
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  address.isEmpty
                      ? const SizedBox(
                          height: 200,
                        )
                      : const SizedBox(
                          height: 42,
                        ),
                  address.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 150,
                                  child: Image.asset(IconsConst.location)),
                              Text(
                                "You do not have an address",
                                style: text.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              CustomAppButon(
                                title: "Add Address",
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                          builder: (_) => AddressAddScreen()));
                                },
                                width: 140,
                              ),
                              const SizedBox(height: 100)
                            ],
                          ),
                        )
                      : ListView.builder(
                          itemCount: address.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              key: ObjectKey(index),
                              direction: DismissDirection.endToStart,
                              background: SizedBox(),
                              secondaryBackground: ColoredBox(
                                color: ColorConst.red,
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Text("Delete",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium),
                                    )),
                              ),
                              onDismissed: (direction) {
                                print('Direction $direction');
                                if (direction == DismissDirection.endToStart) {
                                  context
                                      .read<AddAddressProvider>()
                                      .delete(address[index]);
                                  
                                }
                              },
                              child: Container(
                                width: double.infinity,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                margin: const EdgeInsets.only(
                                    bottom: 12, left: 24, right: 24),
                                decoration: BoxDecoration(
                                    color: mode
                                        ? ColorConst.grey
                                        : ColorConst.darkBg,
                                    borderRadius: BorderRadius.circular(8)),
                                child: ListTile(
                                    leading: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Text(
                                        "${address[index].street},${address[index].city} ,${address[index].state},${address[index].zipCode}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16,
                                            ),
                                        maxLines: 2,
                                      ),
                                    ),
                                    trailing: Padding(
                                      padding: const EdgeInsets.only(top: 18),
                                      child: GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            "Edit",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .copyWith(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: ColorConst.kPrimary),
                                          )),
                                    )),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
