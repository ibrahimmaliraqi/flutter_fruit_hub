import 'package:flutter/material.dart';
import 'package:fruit_hub/constants.dart';
import 'package:fruit_hub/core/services/shared_prefs.dart';
import 'package:fruit_hub/core/utils/app_styles.dart';
import 'package:fruit_hub/core/utils/assets.dart';
import 'package:fruit_hub/core/utils/widgets/notification_widget.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({
    super.key,
    this.onNotiTap,
  });
  final VoidCallback? onNotiTap;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  String username = '';

  Future<void> getname() async {
    final name = await SharedPrefs.getString(key: kUserName);

    setState(() {
      username = name ?? '';
    });
  }

  @override
  void initState() {
    super.initState();
    getname();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'صباح الخير !..',
        textAlign: TextAlign.right,
        style: AppStyles.regular16.copyWith(
          color: Color(0xFF949D9E),
        ),
      ),

      subtitle: Text(
        username,
        textAlign: TextAlign.right,
        style: AppStyles.bold16.copyWith(
          color: Colors.black,
        ),
      ),

      leading: Image.asset(
        Assets.assetsImagesProfileImage,
      ),
      trailing: InkWell(onTap: widget.onNotiTap, child: NotificationWidget()),
    );
  }
}
