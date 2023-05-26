import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wallpaper/app/constant/utils/color_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/font_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/image_constant.dart';
import 'package:flutter_wallpaper/app/routes/app_pages.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';

class WallpaperShowView extends StatefulWidget {
  const WallpaperShowView({Key? key}) : super(key: key);

  @override
  State<WallpaperShowView> createState() => _WallpaperShowViewState();
}

class _WallpaperShowViewState extends State<WallpaperShowView> {

  dynamic argumentData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColorBlackH,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Column(
            children: [
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      height: 40.h,
                      width: 48.w,
                      decoration: BoxDecoration(
                        color: ColorConstant.menuAndSearchColor,
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Center(
                        child: Image.asset(ImageConstant.imgArrowBack,height: 20.h,width: 20.w),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(Routes.PRIVIEW,arguments: argumentData);
                    },
                    child: Container(
                      //margin: EdgeInsets.only(right: 15.w),
                      height: 40.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: ColorConstant.menuAndSearchColor,
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(ImageConstant.imgPreview,height: 32.h,width: 32.w),
                          const Text("Preview",style: TextStyle(fontSize: 12,fontFamily: AssetsFont.fontSemiBold,color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              24.height,
              Container(
                height: 470.h,
                width: 330.w,
                decoration:  BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(19)),
                    image: DecorationImage(
                      image: NetworkImage(argumentData),
                      fit: BoxFit.cover,
                    ),
                ),
              ),
              45.height,
              GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 180.h,
                        width: double.infinity,
                        decoration:  BoxDecoration(
                          color:  ColorConstant.menuAndSearchColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  setWallpaper(argumentData,
                                      WallpaperManager.LOCK_SCREEN);
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Lock Screen",style: TextStyle(color: Colors.white),)),
                            GestureDetector(
                                onTap: () {
                                  setWallpaper(argumentData,
                                      WallpaperManager.HOME_SCREEN);
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Home Screen",style: TextStyle(color: Colors.white),)),
                            GestureDetector(
                                onTap: () {
                                  setWallpaper(argumentData,
                                      WallpaperManager.BOTH_SCREEN);
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Home & Lock Screen",style: TextStyle(color: Colors.white),)),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cancel",style: TextStyle(color: Colors.white),)),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 40.h,
                  width: 300.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      "Set Wallpaper",
                      style: TextStyle(
                          color: Colors.black,fontFamily: AssetsFont.fontBold,fontSize: 17.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
void setWallpaper(path,widget) async{
  try {
    var location = widget;
    var file = await DefaultCacheManager().getSingleFile(path);
    final bool result =
    await WallpaperManager.setWallpaperFromFile(file.path, location);
    print(result);
  } on PlatformException {}
}

