import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/notification_screen/notif_widgets.dart';
import 'package:asman_work/app/view/notification_screen/section_add.dart';
import 'package:asman_work/app/view/profile/fill_about_yourself/fill_data.dart';
import 'package:asman_work/app/view/profile/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: screenWidth(context),
            height: 50.h,
            color: kcPrimaryColor,
            child: Center(
              child: BoxText.headline(
                'Profile',
                color: kcSecondaryTextColor,
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: screenWidth(context),
              height: screenHeight(context),
              color: const Color.fromRGBO(241, 241, 241, 1),
              child: ListView(
                padding: EdgeInsets.zero,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceRegular,
                  profileHeadSection(),
                  verticalSpaceMedium,
                  AddSection(
                    rightPadding: 0,
                    leftPadding: 0,
                    bottomPadding: 0,
                    customHeight: 340,
                    widget: Column(
                      children: [
                        Material(
                          child: Ink(
                            child: InkWell(
                              splashColor:
                                  const Color.fromRGBO(239, 246, 255, 1),
                              onTap: () {},
                              child: MenuItems(
                                context: context,
                                title: 'Gizlinlik',
                                leading: Assets.key,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                        Material(
                          child: Ink(
                            child: InkWell(
                              splashColor:
                                  const Color.fromRGBO(239, 246, 255, 1),
                              onTap: () {
                                Navigator.push<dynamic>(
                                  context,
                                  MaterialPageRoute<dynamic>(
                                    builder: (context) =>
                                        const FillDataAboutYourself(),
                                  ),
                                );
                              },
                              child: MenuItems(
                                context: context,
                                title: 'Özüň barada maglumat goş',
                                leading: Assets.about,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                        Material(
                          child: Ink(
                            child: InkWell(
                              splashColor:
                                  const Color.fromRGBO(239, 246, 255, 1),
                              onTap: () {},
                              child: MenuItems(
                                context: context,
                                title: 'Tehniki kömek',
                                leading: Assets.help,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                        Material(
                          child: Ink(
                            child: InkWell(
                              splashColor:
                                  const Color.fromRGBO(239, 246, 255, 1),
                              onTap: () {},
                              child: MenuItems(
                                context: context,
                                title: 'Sazlamalar',
                                leading: Assets.setting,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                        Material(
                          child: Ink(
                            child: InkWell(
                              splashColor:
                                  const Color.fromRGBO(239, 246, 255, 1),
                              onTap: () {},
                              child: MenuItems(
                                context: context,
                                title: 'Halanlarym',
                                leading: Assets.favourites,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          indent: 20,
                          endIndent: 20,
                        ),
                        Material(
                          child: Ink(
                            child: InkWell(
                              splashColor:
                                  const Color.fromRGBO(239, 246, 255, 1),
                              onTap: () {},
                              child: MenuItems(
                                context: context,
                                title: 'Profilden çykmak',
                                leading: Assets.logout,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SectionName(
                    headlineWord: 'Dil saýla',
                  ),
                  AddSection(
                    customHeight: 50,
                    rightPadding: 0,
                    leftPadding: 0,
                    widget: Material(
                      child: Ink(
                        child: InkWell(
                          splashColor: const Color.fromRGBO(239, 246, 255, 1),
                          onTap: () {},
                          child:
                              MenuItems(context: context, title: 'Türkmençe'),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceRegular,
                  AddSection(
                    customHeight: 50,
                    widget: MenuItems(
                      context: context,
                      title: 'Wersiýa',
                      trailing: BoxText.headline(
                        '1.1',
                        color: kcHardGreyColor,
                      ),
                    ),
                  ),
                  verticalSpaceLarge,
                  verticalSpaceMedium,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  AddSection profileHeadSection() {
    return AddSection(
      customHeight: 105,
      widget: Container(
          width: 322.w,
          height: 80.h,
          alignment: Alignment.center,
          padding: REdgeInsets.symmetric(vertical: 11, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kcLightestGreyColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(Assets.profileBig),
              horizontalSpaceRegular,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoxText.headline('Berdiyewa Oguljemal'),
                  // verticalSpaceTiny,
                  BoxText.subheading(
                    'Ýetmeýän maglumatlaryňyzy dolduryň',
                    color: kcHardGreyColor,
                  ),
                  verticalSpaceTiny,
                  SizedBox(
                    width: 174,
                    height: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: const SizedBox(
                        height: 10,
                        child: LinearProgressIndicator(
                          value: 0.35, // percent filled
                          valueColor:
                              AlwaysStoppedAnimation<Color>(kcSecondaryColor),
                          backgroundColor: Color.fromRGBO(62, 82, 188, 0.13),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
