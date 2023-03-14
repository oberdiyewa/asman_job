import 'package:asman_flutter_uikit/box_ui2.dart';
import 'package:asman_work/app/view/helpers.dart';
import 'package:asman_work/app/view/screens/notification/section_add.dart';
import 'package:asman_work/components/ui/base_appbar.dart';
import 'package:asman_work/data/model/chat_message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 241, 241, 1),
      appBar: JobBaseAppbar(
        title: 'Tehniki kömek',
        onBack: () => Navigator.pop(context),
      ),
      body: ListView(
        children: [
          searchField(),
          verticalSpaceSmall,
          AddSection(
            topPadding: 1,
            leftPadding: 14,
            bottomPadding: 12,
            customHeight: 66,
            widget: ListTile(
              leading: Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  Assets.logo,
                ),
              ),
              title: Text(
                'Asman iş',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding searchField() {
    return Padding(
      padding: REdgeInsets.only(
        top: 10,
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: SizedBox(
        height: 50.h,
        width: 370.w,
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            prefixIcon: Container(
              width: 15.w,
              height: 15.h,
              margin: EdgeInsets.only(
                right: 14.w,
                left: 12.w,
              ),
              child: SvgPicture.asset(
                Assets.searchNormalIcon,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).w,
            ),
            hintText: 'Gozleg...',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10).w,
              borderSide: const BorderSide(
                color: kcPrimaryColor,
              ),
            ),
            hintStyle: TextStyle(
              color: const Color.fromRGBO(149, 149, 149, 1),
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
