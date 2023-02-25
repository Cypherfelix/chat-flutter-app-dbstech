import 'package:chatty/common/values/colors.dart';
import 'package:chatty/pages/profile/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        'Profile',
        style: TextStyle(
            color: AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            color: AppColors.primarySecondaryBackground,
            borderRadius: BorderRadius.all(
              Radius.circular(60.w),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                offset: const Offset(0, 1),
                spreadRadius: 1,
                blurRadius: 2,
              ),
            ],
          ),
          child: const Image(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/account_header.png"),
          ),
        ),
        Positioned(
          right: 0.w,
          bottom: 0.w,
          height: 35.w,
          child: GestureDetector(
            child: Container(
              height: 35.w,
              width: 35.w,
              padding: EdgeInsets.all(7.w),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.all(
                  Radius.circular(40.w),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: const Offset(0, 1),
                    spreadRadius: 1,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Image.asset("assets/icons/edit.png"),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCompleteBtn() {
    return GestureDetector(
      child: Container(
        height: 44.h,
        width: 295.w,
        margin: EdgeInsets.only(top: 60.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: AppColors.primaryElement,
          borderRadius: BorderRadius.all(
            Radius.circular(5.w),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: const Offset(0, 1),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Complete",
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutBtn() {
    return GestureDetector(
      child: Container(
        height: 44.h,
        width: 295.w,
        margin: EdgeInsets.only(top: 0.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: AppColors.primarySecondaryElementText,
          borderRadius: BorderRadius.all(
            Radius.circular(5.w),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: const Offset(0, 1),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Logout",
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 16.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Get.defaultDialog(
            title: "Are you sure you want to logout?",
            textConfirm: "Yes",
            textCancel: "No",
            content: Container(),
            confirmTextColor: Colors.white,
            onConfirm: () {
              controller.logout();
            },
            onCancel: () {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _buildProfilePhoto(),
                  _buildCompleteBtn(),
                  _buildLogoutBtn(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
