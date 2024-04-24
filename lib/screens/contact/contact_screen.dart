import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_all_projects/screens/contact/widgets/contact_button.dart';
import 'package:my_all_projects/utils/app_colors.dart';
import 'package:my_all_projects/utils/app_images.dart';
import 'package:my_all_projects/utils/size_utils.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cFDFDFD,
      appBar: AppBar(
        backgroundColor: AppColors.cFDFDFD,
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppImages.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppImages.pdf),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Contact",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            36.getH(),
            Text(
              "Hello there! I live in Uzbekistan, Narpay (Samarkand), and there are many ways to contact me:",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 24.sp,
              ),
            ),
            20.getH(),
            ContactButton(
              iconsPath: AppImages.callSvg,
              title: "+998 91 011 03 53",
              onTab: () {
                final Uri phoneUrl = Uri(
                  scheme: 'tel',
                  path: '+998910110353',
                );
                UrlLauncher.launchUrl(phoneUrl);
              },
            ),
            10.getH(),
            ContactButton(
              iconsPath: AppImages.messegSvg,
              title: "ulugbekmirvokhidov@gmail.com",
              onTab: () {},
            ),
            10.getH(),
            ContactButton(
              iconsPath: AppImages.globusSvg,
              title: "ulugbekmirvokhidov@gmail.com",
              onTab: () {},
            ),
            30.getH(),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Uri instagramUrl = Uri.parse(
                        "https://www.linkedin.com/in/ulugbek-mirvokhidov-21a2b72b4/");
                    UrlLauncher.launchUrl(instagramUrl);
                  },
                  child: SvgPicture.asset(
                    AppImages.linkSvg,
                    width: 32.w,
                  ),
                ),
                32.getW(),
                InkWell(
                  onTap: () {
                    Uri instagramUrl =
                        Uri.parse("https://www.instagram.com/not_legal_187?igsh=MTdxaWZjcjloOHI5cQ==");
                    UrlLauncher.launchUrl(instagramUrl);
                  },
                  child: SvgPicture.asset(
                    AppImages.instagramSvg,
                    width: 32.w,
                  ),
                ),
                32.getW(),
                InkWell(
                  onTap: () {
                    Uri instagramUrl = Uri.parse("https://t.me/ulugbek171");
                    UrlLauncher.launchUrl(instagramUrl);
                  },
                  child: SvgPicture.asset(
                    AppImages.watsapSvg,
                    width: 32.w,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
