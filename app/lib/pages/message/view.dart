import 'package:chatty/common/values/colors.dart';
import 'package:chatty/pages/frame/welcome/controller.dart';
import 'package:chatty/pages/message/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  Widget _headBar() {
    return Center(
      child: Container(
        width: 320.w,
        height: 44.h,
        margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
        child: Row(
          children: [
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    controller.goProfile();
                  },
                  child: Container(
                    width: 44.w,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColors.primarySecondaryBackground,
                      borderRadius: BorderRadius.circular(22.h),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          offset: const Offset(0, 1),
                          blurRadius: 2,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: controller.state.head_detail.value.avatar == null
                        ? const Image(
                            image:
                                AssetImage("assets/images/account_header.png"))
                        : const Text("hi"),
                  ),
                ),
                Positioned(
                  bottom: 5.w,
                  right: 0.w,
                  height: 14.h,
                  child: Container(
                    width: 14.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryElementStatus,
                      borderRadius: BorderRadius.all(Radius.circular(12.w)),
                      border: Border.all(
                        color: AppColors.primaryElementText,
                        width: 2.w,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: _headBar(),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
