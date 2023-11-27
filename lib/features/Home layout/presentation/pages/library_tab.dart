import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/utils/app_colors.dart';
import 'package:spotify_app/core/utils/app_images.dart';
import 'package:spotify_app/core/utils/app_strings.dart';
import 'package:spotify_app/core/utils/app_styles.dart';

import '../../data/models/playlists_model.dart';

Widget libraryTab(List<OnePlayList> playLists) {
  double height = (playLists.length * 68).h;
  if (height == 0) {
    height = 1.w;
  }
  return Scaffold(
    appBar: AppBar(
      title: const Text(AppStrings.collection),
      actions: [
        SizedBox(
          width: 43.w,
          height: 43.h,
          child: Center(
            child: Image.asset(
              AppImages.search,
            ),
          ),
        ),
        SizedBox(
          width: 43.w,
          height: 43.h,
          child:
              const Center(child: Icon(Icons.add, color: AppColors.iconColor)),
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              FilledButton(
                onPressed: () {},
                child: Center(
                  child: Text(
                    'Playlist',
                    style: AppStyles.titleOfItems.copyWith(fontSize: 13.sp),
                  ),
                ),
              ),
              SizedBox(
                width: 11.w,
              ),
              FilledButton(
                onPressed: () {},
                child: Center(
                  child: Text(
                    'Artist',
                    style: AppStyles.titleOfItems.copyWith(fontSize: 13.sp),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18.h,
          ),
          Divider(
            color: Colors.black,
            thickness: 2.h,
          ),
          SizedBox(
            height: height,
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 60.h,
                    child: ListTile(
                      leading: Container(
                        width: 87.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                playLists[index].images?.first.url ?? ''),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      title: Text(playLists[index].name ?? ''),
                      subtitle: Text(playLists[index].type ?? ''),
                      titleTextStyle:
                          AppStyles.titleOfItems.copyWith(fontSize: 13.sp),
                      subtitleTextStyle: AppStyles.titleOfItems.copyWith(
                          fontSize: 13.sp, color: AppColors.iconColor),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 8.h,
                  );
                },
                itemCount: playLists.length),
          ),
          SizedBox(
            height: 4.h,
          ),
          SizedBox(
            height: 67.h,
            child: ListTile(
              leading: Container(
                width: 60.w,
                height: 80.h,
                decoration: const ShapeDecoration(
                    shape: OvalBorder(), color: AppColors.onPrimary),
                child: Center(
                  child: Icon(Icons.add, color: Colors.white, size: 24.r),
                ),
              ),
              title: const Text('Add artist'),
              titleTextStyle: AppStyles.titleOfItems.copyWith(fontSize: 13.sp),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 67.h,
            child: ListTile(
              leading: Container(
                width: 67.w,
                height: 67.h,
                color: AppColors.onPrimary,
                child: Center(
                  child: Icon(Icons.add, color: Colors.white, size: 24.r),
                ),
              ),
              title: const Text('Add PlayList'),
              titleTextStyle: AppStyles.titleOfItems.copyWith(fontSize: 13.sp),
            ),
          ),
        ],
      ),
    ),
  );
}
