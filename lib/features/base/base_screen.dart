import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travela_assignment/config/routes/app_router.gr.dart';
import 'package:travela_assignment/core/utility/constants/asset_manger.dart';
import 'package:travela_assignment/core/utility/constants/color_manager.dart';
import 'package:travela_assignment/core/utility/constants/font_manager.dart';
import 'package:travela_assignment/core/utility/constants/style_manager.dart';
import 'package:travela_assignment/core/utility/constants/values_manager.dart';
import 'package:travela_assignment/core/utility/snack_bar/feedback_helper.dart';

@RoutePage()
class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        _handleBackPress(context);
      },
      child: AutoTabsRouter(
        routes: _getRoutes(),
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);
          return Scaffold(
            body: child,
            bottomNavigationBar: _buildBottomNavigationBar(tabsRouter),
          );
        },
      ),
    );
  }

  void _handleBackPress(BuildContext context) {
    DateTime? lastPressed;
    final now = DateTime.now();
    const maxDuration = Duration(seconds: 2);

    if (lastPressed == null || now.difference(lastPressed) > maxDuration) {
      lastPressed = now;
      FeedBackHelper.showSnackBar(
        context: context,
        title: 'Press back again to exit',
        type: FeedbackType.success,
      );
    } else {
      SystemNavigator.pop();
    }
  }

  /// Define the routes for AutoTabsRouter
  List<PageRouteInfo> _getRoutes() {
    return [
      const ExploreRoute(),
      const BookingRoute(),
      const InboxRoute(),
      const ProfileRoute(),
      const HostRoute(),
    ];
  }

  /// Build the BottomNavigationBar
  Widget _buildBottomNavigationBar(TabsRouter tabsRouter) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.kBaseColor,
      unselectedItemColor: ColorManager.kNavColor,
      selectedLabelStyle: getBoldStyle(fontSize: FontSize.s10),
      unselectedLabelStyle: getMediumStyle(fontSize: FontSize.s10),
      currentIndex: tabsRouter.activeIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: (value) {
        tabsRouter.setActiveIndex(value);
      },
      items: _getBottomNavBarItems(),
    );
  }

  /// Define BottomNavigationBar items
  List<BottomNavigationBarItem> _getBottomNavBarItems() {
    return [
      _buildNavItem(
        icon: ImageAssets.navExploreIcon,
        label: 'Explore',
      ),
      _buildNavItem(
        icon: ImageAssets.navBookingIcon,
        label: 'Booking',
      ),
      _buildNavItem(
        icon: ImageAssets.navInboxIcon,
        label: 'Inbox',
      ),
      _buildNavItem(
        icon: ImageAssets.navProfileIcon,
        label: 'Profile',
      ),
      _buildNavItem(
        icon: ImageAssets.navHostIcon,
        label: 'Be a Host',
      ),
    ];
  }

  /// Build a single BottomNavigationBarItem
  BottomNavigationBarItem _buildNavItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 8),
        child: SvgPicture.asset(
          icon,
          height: AppSize.s24,
          width: AppSize.s24,
          fit: BoxFit.cover,
        ),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 8),
        child: SvgPicture.asset(
          icon,
          height: AppSize.s24,
          width: AppSize.s24,
          fit: BoxFit.cover,
          color: ColorManager.kBaseColor,
        ),
      ),
      label: label,
    );
  }
}
