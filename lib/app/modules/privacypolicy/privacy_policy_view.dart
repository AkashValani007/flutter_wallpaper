import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wallpaper/app/constant/utils/color_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/font_constant.dart';
import 'package:flutter_wallpaper/app/constant/utils/image_constant.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nb_utils/nb_utils.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColorBlackH,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w,right: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.height,
                Row(
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
                18.height,
                privacyText("Einfach infotech built the Wallpaper app as a Free app. This SERVICE is provided by Einfach infotech at no cost and is intended for use as is."),
                18.height,
                privacyText("This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service"),
                18.height,
                privacyText("If you choose to use my Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy."),
                18.height,
                privacyText("The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Hindi Movies unless otherwise defined in this Privacy Policy."),
                18.height,
                Text("Information Collection and Use",style: TextStyle(color: Colors.white,fontSize: 13.sp,fontFamily: AssetsFont.fontSemiBold)),
                7.height,
                privacyText("For a better experience, while using our Service, I may require you to provide us with certain personally identifiable information. The information that I request will be retained on your device and is not collected by me in any way."),
                privacyText("The app does use third-party services that may collect information used to identify you."),
                18.height,
                privacyText("Link to the privacy policy of third-party service providers used by the app"),
                10.height,
                privacyTextTwo("Google Play Services"),
                10.height,
                privacyTextTwo("AdMob"),
                10.height,
                privacyTextTwo("Google Analytics for Firebase"),
                10.height,
                privacyTextTwo("Firebase Crashlytics"),
                10.height,
                privacyTextTwo("Facebook"),
                10.height,
                privacyTextTwo("Unity"),
                10.height,
                privacyTextTwo("One Signal"),
                10.height,
                privacyTextTwo("AppLovin"),
                18.height,
                Text("Log Data",style: TextStyle(color: Colors.white,fontSize: 13.sp,fontFamily: AssetsFont.fontSemiBold)),
                7.height,
                privacyText("I want to inform you that whenever you use my Service, in a case of an error in the app I collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing my Service, the time and date of your use of the Service, and other statistics."),
                18.height,
                Text("Cookies",style: TextStyle(color: Colors.white,fontSize: 13.sp,fontFamily: AssetsFont.fontSemiBold)),
                7.height,
                privacyText("Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device's internal memory.This Service does not use these “cookies” explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service."),
                18.height,
                Text("Service Providers",style: TextStyle(color: Colors.white,fontSize: 13.sp,fontFamily: AssetsFont.fontSemiBold)),
                7.height,
                privacyText("I may employ third-party companies and individuals due to the following reasons:"),
                7.height,
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.w),
                      height: 4,
                      width: 4,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    10.width,
                    Text("To facilitate our Service;",style:  TextStyle(color: Color(0xffD4D7E1),fontSize: 13.sp)),
                  ],
                ),
                7.height,
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.w,bottom: 8.w),
                      height: 4,
                      width: 4,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    10.width,
                    Container(
                        height: 21.h,
                        width: 315.w,
                        child: Text("To provide the Service on our behalf;",style:  TextStyle(color: Color(0xffD4D7E1),fontSize: 13.sp,overflow: TextOverflow.ellipsis))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.w,bottom: 8.w),
                      height: 4,
                      width: 4,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    10.width,
                    Container(
                        height: 21.h,
                        width: 315.w,
                        child: Text("To perform Service-related services; or",style:  TextStyle(color: Color(0xffD4D7E1),fontSize: 13.sp,overflow: TextOverflow.ellipsis))),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.w,bottom: 8.w),
                      height: 4,
                      width: 4,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    10.width,
                    Container(
                        height: 21.h,
                        width: 315.w,
                        child: Text("To assist us in analyzing how our Service is used.",style:  TextStyle(color: Color(0xffD4D7E1),fontSize: 13.sp,overflow: TextOverflow.ellipsis))),
                  ],
                ),
                7.height,
                privacyText("I want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose."),
                18.height,
                Text("Security",style: TextStyle(color: Colors.white,fontSize: 13.sp,fontFamily: AssetsFont.fontSemiBold)),
                7.height,
                privacyText("I value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security."),
                18.height,
                Text("Links to Other Sites",style: TextStyle(color: Colors.white,fontSize: 13.sp,fontFamily: AssetsFont.fontSemiBold)),
                7.height,
                privacyText("This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by me. Therefore, I strongly advise you to review the Privacy Policy of these websites. I have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services."),
                18.height,
                Text("Children’s Privacy",style: TextStyle(color: Colors.white,fontSize: 13.sp,fontFamily: AssetsFont.fontSemiBold)),
                7.height,
                privacyText("These Services do not address anyone under the age of 13. I do not knowingly collect personally identifiable information from children under 13 years of age. In the case I discover that a child under 13 has provided me with personal information, I immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact me so that I will be able to do the necessary actions."),
                18.height,
                Text("Changes to This Privacy Policy",style: TextStyle(color: Colors.white,fontSize: 13.sp,fontFamily: AssetsFont.fontSemiBold)),
                7.height,
                privacyText("I may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.This policy is effective as of 2023-01-24"),
                18.height,
                Text("Contact Us",style: TextStyle(color: Colors.white,fontSize: 13.sp,fontFamily: AssetsFont.fontSemiBold)),
                7.height,
                privacyText("If you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at rutvikkachhadiya09@gmail.com."),
                18.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
  Text privacyText(text){
    return Text(text,style: TextStyle(color: const Color(0xffD4D7E1), fontSize: 14.sp,fontFamily: AssetsFont.fontRegular));
  }

  Row privacyTextTwo(text){
    return  Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10.w),
          height: 4,
          width: 4,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        10.width,
        Text(text,style: const TextStyle(color: Color(0xffD4D7E1),fontSize: 13,decoration: TextDecoration.underline,)),
      ],
    );
  }
}
