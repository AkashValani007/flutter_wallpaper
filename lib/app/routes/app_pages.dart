import 'package:flutter_wallpaper/app/modules/aboutsus/abouts_us_view.dart';
import 'package:flutter_wallpaper/app/modules/home/home_view.dart';
import 'package:flutter_wallpaper/app/modules/preview/preview_view.dart';
import 'package:flutter_wallpaper/app/modules/privacypolicy/privacy_policy_view.dart';
import 'package:flutter_wallpaper/app/modules/search/search_view.dart';
import 'package:flutter_wallpaper/app/modules/splash/splash_view.dart';
import 'package:flutter_wallpaper/app/modules/wallpapershow/wallpaper_show_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
    ),
    GetPage(
      name: _Paths.WALLPAPERSHOW,
      page: () => const WallpaperShowView(),
    ),
    GetPage(
      name: _Paths.ABOUTUS,
      page: () => const AboutUsView(),
    ),
    GetPage(
      name: _Paths.PRIVACYPOLICY,
      page: () => const PrivacyPolicyView(),
    ),
    GetPage(
      name: _Paths.PRIVIEW,
      page: () => const PreView(),
    ),
    GetPage(
      name: _Paths.PRIVIEW,
      page: () => const PreView(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
    ),
  ];
}
