import 'package:flutter/material.dart';
import 'package:otex_flutter_task/core/bases/base_stateful_widget_state.dart';
import 'package:otex_flutter_task/core/colors/app_colors.dart';
import 'package:otex_flutter_task/core/constants/assets_paths.dart';
import 'package:otex_flutter_task/core/l10n/app_localizations.dart';
import 'package:otex_flutter_task/ui/home/manager/home_screen_view_model.dart';
import 'package:otex_flutter_task/ui/home/pages/account/account_page.dart';
import 'package:otex_flutter_task/ui/home/pages/add/add_ad_page.dart';
import 'package:otex_flutter_task/ui/home/pages/ads/my_ads_page.dart';
import 'package:otex_flutter_task/ui/home/pages/chats/chats_page.dart';
import 'package:otex_flutter_task/ui/home/pages/main/main_page.dart';
import 'package:otex_flutter_task/ui/home/widgets/navigation_dest_custom_icon.dart';
import '../../core/di/di.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStatefulWidgetState<HomeScreen> {
  HomeScreenViewModel homeScreenViewModel = getIt.get<HomeScreenViewModel>();

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const MainPage(),
      const ChatsPage(),
      const AddAdPage(),
      const MyAdsPage(),
      const AccountPage(),
    ];
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appLocalizations = AppLocalizations.of(context)!;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => homeScreenViewModel,
      child: Consumer<HomeScreenViewModel>(
        builder: (context, homeScreenViewModel, child) {
          return Scaffold(
            body: PageView(
              controller: homeScreenViewModel.pageViewController,
              onPageChanged: homeScreenViewModel.onPageChange,
              children: pages,
            ),
            bottomNavigationBar: NavigationBar(
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              indicatorColor: Colors.transparent,
              selectedIndex: homeScreenViewModel.currentNavItemIndex,
              onDestinationSelected: homeScreenViewModel.changeSelectedNavItem,
              destinations: [
                NavigationDestination(
                  icon: NavigationDestCustomIcon(
                    iconPath: AssetsPaths.homeIcon,
                    showBottomBorder:
                        homeScreenViewModel.currentNavItemIndex == 0,
                    label: appLocalizations.homePage,
                  ),
                  label: "",
                ),
                NavigationDestination(
                  icon: NavigationDestCustomIcon(
                    iconPath: AssetsPaths.chatsIcon,
                    label: appLocalizations.chatsPage,
                    showBottomBorder:
                        homeScreenViewModel.currentNavItemIndex == 1,
                  ),
                  label: "",
                ),
                NavigationDestination(
                  icon: NavigationDestCustomIcon(
                    iconPath: AssetsPaths.addBoxIcon,
                    iconColor: AppColors.blue,
                    label: appLocalizations.addAdPage,
                    showBottomBorder:
                        homeScreenViewModel.currentNavItemIndex == 2,
                  ),
                  label: "",
                ),
                NavigationDestination(
                  icon: NavigationDestCustomIcon(
                    iconPath: AssetsPaths.adsIcon,
                    label: appLocalizations.myAdsPage,
                    showBottomBorder:
                        homeScreenViewModel.currentNavItemIndex == 3,
                  ),
                  label: "",
                ),
                NavigationDestination(
                  icon: NavigationDestCustomIcon(
                    iconPath: AssetsPaths.accountIcon,
                    label: appLocalizations.accountPage,
                    showBottomBorder:
                        homeScreenViewModel.currentNavItemIndex == 4,
                  ),
                  label: "",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
