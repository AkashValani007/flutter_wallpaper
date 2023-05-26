import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wallpaper/app/constant/utils/color_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/connectivity_utils.dart';
import 'package:flutter_wallpaper/app/constant/utils/font_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/image_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/string_constant.dart';
import 'package:flutter_wallpaper/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    ConnectivityUtils.instance.init();
    checkIsLogin();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColorBlackS,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageConstant.imgSplash,
                height: 200.h,
                width: 200.w,
              ),
              Text(LocaleKeys.appName,style: TextStyle(color:  ColorConstant.appNameColor,fontSize: 32.sp,fontFamily: AssetsFont.fontExtraBold),),
            ],
          ),
        ),
      ),
    );
  }

  void checkIsLogin() async {
    Timer(const Duration(seconds: 3), () {
      Get.offNamed(Routes.HOME);
    });
  }
}
