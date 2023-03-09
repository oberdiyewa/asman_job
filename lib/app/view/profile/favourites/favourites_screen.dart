import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/components/ui/screens/base_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

TextEditingController textController = TextEditingController();

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  TextStyle subheadingStyle = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: kcHardGreyColor,
  );
  int itemCount = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
        appBar: const BaseAppbar(
          title: 'Halanlarym',
        ),
        body: ListView.builder(
          padding: EdgeInsets.only(left: 10, right: 15, top: 15),
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoxText.headline('Satyjy gerek'),
                    ],
                  ),
                  // isThreeLine: true,
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceTiny,
                      Text(
                        'Zaman market',
                        style: TextStyle(
                          color: kcHardGreyColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                        ),
                      ),
                      verticalSpaceTiny,
                      Row(
                        children: [
                          Text(
                            'Aşgabat, Taslama',
                            style: TextStyle(
                              color: kcHardGreyColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  leading: Image.asset(Assets.avatarImage),
                  trailing: InkWell(
                      onTap: () {
                        itemCount--;
                        print(itemCount);
                        setState(() {});
                      },
                      child: SvgPicture.asset(Assets.liked)),
                ),
                const Divider(
                  indent: 3,
                  endIndent: 3,
                  thickness: 1,
                ),
              ],
            );
          },
        ));
  }
}
