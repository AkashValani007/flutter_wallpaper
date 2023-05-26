import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wallpaper/app/constant/utils/color_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/font_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/image_constant.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nb_utils/nb_utils.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  State<AboutUsView> createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.backgroundColorBlackH,
        body: Center(
          child: Column(
            children: [
              15.height,
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        height: 38.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                          color: ColorConstant.menuAndSearchColor,
                          borderRadius: const BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Center(
                          child: Image.asset(ImageConstant.imgArrowBack,height: 14.h,width: 14.w),
                        ),
                      ),
                    ),
                    15.width,
                    Text("Privacy Policy", style: TextStyle(color: Colors.white, fontSize: 19.sp,fontFamily: AssetsFont.fontBold)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      maxRadius: 75.w,
                      backgroundColor: ColorConstant.menuAndSearchColor,
                      child: Image.asset(ImageConstant.imgAboutsApp,height: 110,width: 110),
                    ),
                    //SizedBox(height: 7.h),
                    7.height,
                    Text("Wallpaper app".toUpperCase(),style: TextStyle(color: const Color(0XFFFFDEE5),fontFamily: AssetsFont.fontExtraBold,fontSize: 18.sp)),
                    6.height,
                    Text("App Version 1.0",style: TextStyle(color: Colors.white,fontSize: 15.sp,fontFamily: AssetsFont.fontSemiBold)),
                    5.height,
                    Text("Copyright © 2023 einfach infotech\nAll rights reserved",textAlign: TextAlign.center,style: TextStyle(color: Color(0xffD4D7E1),fontSize: 13.sp,fontFamily: AssetsFont.fontMedium)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
