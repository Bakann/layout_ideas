import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PopupMenuOption {
  signIn,
  orders,
  account,
}

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: GestureDetector(
      //   child: const Icon(Icons.close_rounded, color: Colors.black),
      //   onTap: () => Router.neglect(context, () => context.pop()),
      // ),
      // leadingWidth: 1000,
      // leading: Row(
      //   children: [
      //     IconButton(
      //       color: Colors.black,
      //       onPressed: () {},
      //       icon: const Icon(Icons.arrow_back_ios_new, size: 10),
      //     ),
      //     const Text(
      //       "Retour",
      //       style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
      //     )
      //   ],
      // ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(47.250);
}
