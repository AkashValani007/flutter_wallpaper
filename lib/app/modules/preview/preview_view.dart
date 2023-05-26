import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wallpaper/app/constant/utils/color_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/image_constant.dart';
import 'package:get/get.dart';

class PreView extends StatefulWidget {
  const PreView({Key? key}) : super(key: key);

  @override
  State<PreView> createState() => _PreViewState();
}

class _PreViewState extends State<PreView> {

  dynamic argumentData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Image.network(argumentData,fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(9),
              child: Column(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
