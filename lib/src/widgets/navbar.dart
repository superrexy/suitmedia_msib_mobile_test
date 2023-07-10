import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title,
        style: AppTextStyle.poppins.copyWith(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(
          color: AppColors.purpleColor,
          thickness: 2,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(0),
          ),
        ),
        icon: const Icon(
          Icons.chevron_left,
          color: AppColors.purpleColor,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
