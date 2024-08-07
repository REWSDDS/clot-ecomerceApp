import 'package:alfa/core/constants/color/color_const.dart';
import 'package:alfa/core/constants/icons/icons_const.dart';
import 'package:alfa/core/model/notification_model.dart';
import 'package:alfa/core/utils/check_current_mode.dart';
import 'package:alfa/core/widgets/custom_app_bar.dart';
import 'package:alfa/core/widgets/custom_app_button.dart';
import 'package:alfa/features/catigories/page/catigories_page.dart';
import 'package:alfa/features/notification/provider/notification_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleText: 'Notifications',
      ),
      body: context.watch<NotificationProvider>().notifcations.isEmpty
          ? const NoNotificationWidget()
          : const NotificationHaveWidget(),
    );
  }
}

class NotificationHaveWidget extends StatelessWidget {
  const NotificationHaveWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ListView.builder(
          itemCount: context.watch<NotificationProvider>().notifcations.length,
          itemBuilder: (context, index) {
            final model =
                context.watch<NotificationProvider>().notifcations[index];
            return CupertinoContextMenu.builder(
              actions: <CupertinoContextMenuAction>[
                CupertinoContextMenuAction(
                  onPressed: () {
                    context
                        .read<NotificationProvider>()
                        .readNotificatoin(index);
                    Navigator.pop(context);
                  },
                  trailingIcon: CupertinoIcons.bell,
                  child: Text(
                    'Read notification',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                CupertinoContextMenuAction(
                  onPressed: () {
                    context
                        .read<NotificationProvider>()
                        .deleteNotificaton(index);
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Delete notification',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: Colors.red),
                  ),
                )
              ],
              builder: (context, animation) {
                return Material(
                    color: Colors.transparent,
                    child: NotificationWidget(model: model));
              },
            );
          }),
    );
  }
}

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.model,
  });

  final NotificationModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: checkModeAndGiveColor(
            mode: MediaQuery.of(context).platformBrightness,
            lightColor: ColorConst.grey,
            darkColor: ColorConst.darkGrey),
      ),
      child: ListTile(
        leading: Stack(
          children: [
            SvgPicture.asset(
              model.isUnread
                  ? IconsConst.notificationRed
                  : IconsConst.notification,
              colorFilter: ColorFilter.mode(
                  checkModeAndGiveColor(
                      mode: MediaQuery.of(context).platformBrightness,
                      lightColor: ColorConst.black,
                      darkColor: ColorConst.white),
                  BlendMode.srcIn),
            ),
            Visibility(
              visible: model.isUnread,
              child: const Positioned(
                  top: 0,
                  right: 1,
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.red,
                  )),
            )
          ],
        ),
        subtitle: Text(
          model.description,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        title: Text(
          model.notificatoinText,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}

class NoNotificationWidget extends StatelessWidget {
  const NoNotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // ! 1
          Image.asset(
            'assets/images/bell.png',
            height: 100,
            width: 100,
            fit: BoxFit.contain,
          ),
          // ! 2
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              'No notification yet',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          CustomAppButon(
              isMaximumWidth: false,
              title: 'Explore Categories',
              onTap: () {
                Navigator.push(context,
                    CupertinoPageRoute(builder: (_) => const CatigoriesPage()));
              })
        ],
      ),
    );
  }
}
