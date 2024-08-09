import 'package:flutter/material.dart';
import 'package:store_responsive_dashboard/constaints.dart';
import 'package:store_responsive_dashboard/widgets/sidebar_menu_item.dart';
import 'package:store_responsive_dashboard/pages/home.dart';
import 'package:store_responsive_dashboard/pages/dashboard.dart';
import 'package:store_responsive_dashboard/pages/user.dart';
import 'package:store_responsive_dashboard/pages/contact.dart';
import 'package:store_responsive_dashboard/pages/game_selection_tracking_page.dart';

import '../model.dart';

final List<MenuItem> menuItems = [
  MenuItem('Home', Icons.home_outlined, HomePage()),
  MenuItem('Dashboard', Icons.dashboard_outlined, Dashboard()),
  MenuItem('Games', Icons.games_outlined, GameSelectionTrackingPage()),
  MenuItem('User', Icons.person, UserPage()),
  MenuItem('Contact', Icons.contact_mail, ContactPage()),
];

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final bool _isDesktop = _size.width >= screenLg;
    return Container(
      decoration: BoxDecoration(color: primary),
      width: _isDesktop ? sideBarDesktopWidth : sideBarMobileWidth,
      padding:
          EdgeInsets.symmetric(vertical: 24, horizontal: _isDesktop ? 24 : 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: primaryAncient),
            width: 45,
            height: 45,
            child: Center(
              child: Text(
                'Re',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: menuItems
                .map((e) => SideBarMenuItem(
                      item: e,
                      isDesktop: _isDesktop,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) => e.page,
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                    ))
                .toList(),
          ))
        ],
      ),
    );
  }
}