import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/app/constant/utils/connectivity_utils.dart';
import 'package:flutter_wallpaper/app/modules/home/home_view.dart';
import 'package:flutter_wallpaper/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart'as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wallpaper/app/constant/utils/color_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/font_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/image_constant.dart';
import 'package:flutter_wallpaper/app/model/wallpaper_model.dart';
import 'package:nb_utils/nb_utils.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if(ConnectivityUtils.instance.hasInternet) {

    }else{
      flutterToastBottom("Internet not available!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColorBlackH,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.height,
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
              14.height,
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: ColorConstant.menuAndSearchColor,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: Row(
                  children: [
                    8.width,
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        ImageConstant.imgSearch,
                        height: 22.h,
                        width: 22.w,
                        fit: BoxFit.contain,
                        color: const Color(0xffBABABA),
                      ),
                    ),
                    8.width,
                    Expanded(
                      flex: 8,
                      child: TextFormField(
                        onFieldSubmitted: (value){
                          print(value);
                          setState(() {
                            fetchSearchData();
                          });
                        },
                        controller: searchController,
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.done,
                        style: const TextStyle(color: Colors.white,fontFamily: AssetsFont.fontMedium),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              color: const Color(0xffBABABA), fontSize: 17.sp, fontFamily: AssetsFont.fontSemiBold),
                          hintText: "Search Something....",
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              14.height,
              Expanded(
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child:
                  searchController.text.isEmpty
                  ?  Center(child: Text("Search your wallpaper",style: TextStyle(color: const Color(0xffBABABA),fontFamily: AssetsFont.fontSemiBold,fontSize: 17.sp)))
                  : FutureBuilder(
                    future: fetchSearchData(),
                    builder: (context,snapshot) {
                      if(snapshot.hasData) {
                        WallpaperResponse? response = snapshot.data;
                        return response?.totalResults == 0
                        ? Center(child: Text("No Result Found",style: TextStyle(color: const Color(0xffBABABA),fontFamily: AssetsFont.fontSemiBold,fontSize: 17.sp)))
                        : GridView.builder(
                          shrinkWrap: true,
                          //physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(2),
                          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,crossAxisSpacing: 10, mainAxisSpacing: 10,
                            childAspectRatio: MediaQuery.of(context).size.width /
                                (MediaQuery.of(context).size.height / 1.5),
                          ),
                          itemCount: response?.photos?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.WALLPAPERSHOW,arguments: response?.photos?[index].src?.large);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorConstant.menuAndSearchColor,
                                  borderRadius:  const BorderRadius.all(Radius.circular(14)),
                                ),
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(14)),
                                  child: CachedNetworkImage(
                                    imageUrl: response?.photos?[index].src?.large,
                                    // progressIndicatorBuilder: (context, url, downloadProgress) =>
                                    //     Center(child: CircularProgressIndicator(value: downloadProgress.progress,color: Colors.white)),
                                    errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.white),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                      return const Center(child: CircularProgressIndicator(color: Colors.white));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<WallpaperResponse?> fetchSearchData() async{
    try{
      http.Response response = await http.get(Uri.parse('https://api.pexels.com/v1/search?query=${searchController.text}'),
          headers:{
            "Authorization": "sGf171nJYHlH2EEJCxy9yI782FNppiKA9CfBo1fgdwSap5xhKxrfmEYy",
          }
      );
      if(response.statusCode == 200){Map<String,dynamic> data = jsonDecode(response.body);
        WallpaperResponse s1 = WallpaperResponse.fromJson(data);
        print("===========${response.body}");
        log("======*************======${s1.totalResults}");
        return s1;
      }
    } catch(e,s){
      print(e.toString());
      print(s.toString());
    }
    return null;
  }

}
