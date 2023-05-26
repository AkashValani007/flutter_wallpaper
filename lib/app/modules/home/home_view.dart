import 'package:flutter/material.dart';
import 'package:flutter_wallpaper/app/constant/utils/connectivity_utils.dart';
import 'package:flutter_wallpaper/app/modules/home/all_api.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wallpaper/app/constant/utils/color_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/font_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/image_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/string_constant.dart';
import 'package:flutter_wallpaper/app/model/wallpaper_model.dart';
import 'package:flutter_wallpaper/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin{
  static GlobalKey<ScaffoldState> drawerKey = GlobalKey();

  TabController? _tabController;
  ScrollController? _scrollViewController;
  int _currentTabIndex = 0;
  late Future<WallpaperResponse?>  fetchAllWallpaper;
  late Future<WallpaperResponse?>  fetchNature;
  late Future<WallpaperResponse?>  fetchArchitecture;
  late Future<WallpaperResponse?>  fetchSunsets;
  late Future<WallpaperResponse?>  fetchMountains;

  @override
  void initState() {
    super.initState();
    if(ConnectivityUtils.instance.hasInternet) {

    }else{
      flutterToastBottom("Internet not available!");
    }
    fetchAllWallpaper = fetchAllWallpaperData();
    fetchNature = fetchNatureData();
    fetchArchitecture = fetchArchitectureData();
    fetchSunsets = fetchSunsetsData();
    fetchMountains = fetchMountainsData();
    _tabController = TabController(length: 5,vsync: this);
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _scrollViewController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: ColorConstant.backgroundColorBlackH,
        key: drawerKey,
        drawer: Drawer(
          width: 260.w,
          backgroundColor: ColorConstant.backgroundColorBlackH,
          child: SafeArea(
            child: Padding(
              padding:  EdgeInsets.only(left: 12.w),
              child: Column(
                children: [
                  SizedBox(height: 50.h),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          drawerKey.currentState?.closeDrawer();
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
                      20.width,
                      Text("Setting",style: TextStyle(color: Colors.white,fontSize: 19.sp,fontFamily: AssetsFont.fontBold)),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  drawerContainer((){
                    Get.toNamed(Routes.ABOUTUS);
                    drawerKey.currentState?.closeDrawer();
                  },const Color(0xff3189E0),ImageConstant.imgAboutUS,"About Us"),
                  drawerContainer((){
                    Get.toNamed(Routes.PRIVACYPOLICY);
                    drawerKey.currentState?.closeDrawer();
                  },const Color(0xff48CF84),ImageConstant.imgPrivacyPolicy,"Privacy Policy"),
                  drawerContainer((){},const Color(0xffED7172),ImageConstant.imgShare,"Share this App"),
                  drawerContainer((){},const Color(0xffFFA337),ImageConstant.imgRate,"Rate Us"),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("App Version 1.0",style: TextStyle(color: Color(0xffD4D7E1),fontFamily: AssetsFont.fontSemiBold)),
                        SizedBox(height: 25.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: NestedScrollView(
            controller: _scrollViewController,
            headerSliverBuilder: (context,innerBoxIsScrolled) {
              return <Widget>[
                SliverList  (
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: const EdgeInsets.all(9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: (){
                                  drawerKey.currentState?.openDrawer();
                                },
                                child: Container(
                                  height: 50.h,
                                  width: 52.w,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.menuAndSearchColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                                  ),
                                  child: Center(
                                    child: Image.asset(ImageConstant.imgMenu,height: 35.h,width: 35.w),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 9,
                                child: Text(LocaleKeys.appName.toUpperCase(),textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 17.sp,fontFamily: AssetsFont.fontExtraBold,overflow: TextOverflow.ellipsis),)),
                            Expanded(
                              flex: 2,
                              child: GestureDetector(
                                onTap: (){
                                  Get.toNamed(Routes.SEARCH);
                                },
                                child: Container(
                                  height: 50.h,
                                  width: 52.w,
                                  decoration: BoxDecoration(
                                    color: ColorConstant.menuAndSearchColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(16)),

                                  ),
                                  child: Center(
                                    child: Image.asset(ImageConstant.imgSearch,height: 32.h,width: 32.w),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverAppBar(
                  toolbarHeight: 1.h,
                  backgroundColor: ColorConstant.backgroundColorBlackH,
                  pinned: true,
                  automaticallyImplyLeading: false,
                  bottom: TabBar(
                    onTap: (int index){
                      setState(() {
                        _currentTabIndex = 1;
                      });
                    },
                    controller: _tabController,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    isScrollable: true,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      //color: Colors.white,
                    ),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 5),
                    padding: EdgeInsets.only(left: 7.w,right: 7.w),
                    tabs:   [
                      Container(
                          height: 30.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: ColorConstant.menuAndSearchColor,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: _tabController?.index == 0 ? Border.all(color: Colors.white,width: 0.6) : Border.all(),
                          ),
                          child: Tab(
                              child: Text("All",style: TextStyle(fontSize: 12.sp,fontFamily: AssetsFont.fontSemiBold),))),
                      Container(
                          height: 30.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: ColorConstant.menuAndSearchColor,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: _tabController?.index == 1 ? Border.all(color: Colors.white,width: 0.6) : Border.all(),
                          ),
                          child: Tab(
                              child: Text(LocaleKeys.nature,style: TextStyle(fontSize: 12.sp,fontFamily: AssetsFont.fontSemiBold),))),
                      Container(
                          height: 30.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                            color: ColorConstant.menuAndSearchColor,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: _tabController?.index == 2 ? Border.all(color: Colors.white,width: 0.6) : Border.all(),
                          ),
                          child: Tab(child: Text(LocaleKeys.architecture,style: TextStyle(fontSize: 12.sp,fontFamily: AssetsFont.fontSemiBold,overflow: TextOverflow.ellipsis),))),
                      Container(
                          height: 30.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: ColorConstant.menuAndSearchColor,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: _tabController?.index == 3 ? Border.all(color: Colors.white,width: 0.6) : Border.all(),
                          ),
                          child: Tab(child: Text(LocaleKeys.sunsets,style: TextStyle(fontSize: 12.sp,fontFamily: AssetsFont.fontSemiBold,overflow: TextOverflow.ellipsis),))),
                      Container(
                          height: 30.h,
                          width: 90.w,
                          decoration: BoxDecoration(
                            color: ColorConstant.menuAndSearchColor,
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            border: _tabController?.index == 4 ? Border.all(color: Colors.white,width: 0.6) : Border.all(),
                          ),
                          child: Tab(child: Text(LocaleKeys.mountains,style: TextStyle(fontSize: 12.sp,fontFamily: AssetsFont.fontSemiBold,overflow: TextOverflow.ellipsis),))),
                    ],
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.all(7),
              child: Column(
                children: [
                  10.height,
                  Flexible(
                    child: TabBarView(
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children:  [
                        gridViewBuilderCommaN(fetchAllWallpaper),
                        gridViewBuilderCommaN(fetchNature),
                        gridViewBuilderCommaN(fetchArchitecture),
                        gridViewBuilderCommaN(fetchSunsets),
                        gridViewBuilderCommaN(fetchMountains),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  ScrollConfiguration gridViewBuilderCommaN(fetchData) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: FutureBuilder(
        future: fetchData,
        builder: (context,snapshot){
          if(snapshot.hasData){
            WallpaperResponse? response = snapshot.data as WallpaperResponse;
              return GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(2),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,crossAxisSpacing: 10, mainAxisSpacing: 10,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.5),
                ),
                itemCount: response.photos?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async{
                      Get.toNamed(Routes.WALLPAPERSHOW,arguments: response.photos?[index].src?.large);
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
                          imageUrl: response.photos?[index].src?.large,
                          errorWidget: (context, url, error) => const Icon(Icons.error,color: Colors.white),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              );
          }
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        },
      ),
    );
  }

  GestureDetector drawerContainer(onTap,containerColor,img,name){
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 13.w),
        child: Row(
          children: [
            Container(
              height: 43.h,
              width: 43.w,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              child: Center(
                child: Image.asset(
                  img,
                  width: 22.h,
                  height: 22.w,
                  fit: BoxFit.cover,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 17.w),
            Expanded(
              child: Text(name, style: TextStyle(color: Colors.white, fontSize: 15.sp,fontFamily: AssetsFont.fontSemiBold)),
            ),
          ],
        ),
      ),
    );
  }

}
class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child,
      ScrollableDetails details) {
    return child;
  }
}

void flutterToastBottom(errorMessage) {
  Fluttertoast.showToast(
      msg: errorMessage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

