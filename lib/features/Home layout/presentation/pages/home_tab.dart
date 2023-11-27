import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:spotify_app/core/utils/app_colors.dart';
import 'package:spotify_app/core/utils/app_images.dart';
import 'package:spotify_app/core/utils/app_strings.dart';
import 'package:spotify_app/core/utils/app_styles.dart';
import 'package:spotify_app/features/Home%20layout/data/models/playlists_model.dart';

import '../../data/models/new_song_model.dart';
import '../../data/models/podcast_model.dart';

// class HomeTab extends StatelessWidget {
//   const HomeTab(this.playLists, this.newSongs, this.podcasts, {super.key});
//   final List<OnePlayList> playLists;
//   final List<Song> newSongs;
//   final List<Shows> podcasts;

//   @override
//   Widget build(BuildContext context) {
//     int playListsLength = playLists.length <= 6 ? playLists.length : 6;
//     debugPrint(playListsLength.toString());
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(AppStrings.welcome),
//         actions: [
//           SizedBox(
//             width: 43.w,
//             height: 43.h,
//             child: Center(
//               child: Image.asset(
//                 AppImages.notification,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 43.w,
//             height: 43.h,
//             child: Center(
//               child: Image.asset(
//                 AppImages.activity,
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 43.w,
//             height: 43.h,
//             child: Center(
//               child: Image.asset(
//                 AppImages.settings,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 196.h,
//               child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: (167.5.w / 56.h),
//                       mainAxisSpacing: 8.h,
//                       crossAxisSpacing: 8.w),
//                   itemCount: playListsLength,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       width: 167.50.w,
//                       height: 56.h,
//                       decoration: ShapeDecoration(
//                         color: AppColors.onPrimary,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4.r)),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 56.w,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                     playLists[index].images?.first.url ?? ''),
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 12.w,
//                           ),
//                           Text(playLists[index].name ?? '',
//                               style: AppStyles.titleOfItems),
//                         ],
//                       ),
//                     );
//                   }),
//             ),
//             SizedBox(
//               width: 343.w,
//               height: 88.h,
//               child: Text(
//                 AppStrings.newRelease,
//                 style: AppStyles.title,
//               ),
//             ),
//             SizedBox(
//               width: 343.w,
//               height: 142.h,
//               child: CarouselSlider(
//                 options: CarouselOptions(
//                     autoPlay: false,
//                     aspectRatio: 1.5,
//                     enlargeCenterPage: true,
//                     enlargeStrategy: CenterPageEnlargeStrategy.scale,
//                     enlargeFactor: 1,
//                     viewportFraction: 1),
//                 items: newSongs.map((i) {
//                   return Container(
//                     width: 343.w,
//                     height: 142.h,
//                     decoration: ShapeDecoration(
//                       color: AppColors.onPrimary,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.r)),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           width: 142.w,
//                           height: 142.h,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: NetworkImage(i.images?.first.url ?? ''),
//                               fit: BoxFit.fill,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 201.w,
//                           height: 142.h,
//                           child: Stack(
//                             children: [
//                               Positioned(
//                                 left: 16.w,
//                                 top: 16.h,
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       i.name ?? 'notFound',
//                                       style: AppStyles.titleOfItems,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                     SizedBox(height: 4.h),
//                                     SizedBox(
//                                       width: 170.w,
//                                       child: Text(
//                                         i.artists?.first.name ?? 'notFound',
//                                         style: AppStyles.titleOfItems.copyWith(
//                                             color: AppColors.iconColor),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Positioned(
//                                 left: 11.w,
//                                 bottom: 18.h,
//                                 child: Image.asset(AppImages.heart),
//                               ),
//                               Positioned(
//                                 left: 153.w,
//                                 top: 94.h,
//                                 child: Container(
//                                   width: 32.w,
//                                   height: 32.h,
//                                   decoration: const ShapeDecoration(
//                                     color: Colors.white,
//                                     shape: OvalBorder(),
//                                   ),
//                                   child: const Center(
//                                     child: Icon(Icons.play_arrow,
//                                         color: Colors.black),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//             SizedBox(
//               width: 343.w,
//               height: 88.h,
//               child: Text(
//                 AppStrings.podcasts,
//                 style: AppStyles.title,
//               ),
//             ),
//             SizedBox(
//               width: 412.w,
//               height: 200.h,
//               child: ListView.separated(
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     return SizedBox(
//                       width: 138.w,
//                       height: 200.h,
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 138.w,
//                             height: 138.h,
//                             decoration: ShapeDecoration(
//                               image: DecorationImage(
//                                 image: NetworkImage(
//                                     podcasts[index].images?.first.url ?? ''),
//                                 fit: BoxFit.fill,
//                               ),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8.r)),
//                             ),
//                           ),
//                           SizedBox(
//                             width: double.infinity,
//                             height: 60.h,
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   width: double.infinity,
//                                   height: 20.h,
//                                   child: Text(
//                                     podcasts[index].name ?? 'notfound',
//                                     style: AppStyles.titleOfItems,
//                                   ),
//                                 ),
//                                 SizedBox(height: 3.h),
//                                 Text(
//                                   podcasts[index].description ?? 'notfound',
//                                   style: AppStyles.titleOfItems
//                                       .copyWith(color: AppColors.iconColor),
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                   separatorBuilder: (context, index) {
//                     return SizedBox(
//                       width: 16.w,
//                     );
//                   },
//                   itemCount: podcasts.length),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

Widget homeTab(
    List<OnePlayList> playLists, List<Song> newSongs, List<Shows> podcasts) {
  int playListsLength = playLists.length <= 6 ? playLists.length : 6;
  return Scaffold(
    appBar: AppBar(
      title: const Text(AppStrings.welcome),
      actions: [
        SizedBox(
          width: 43.w,
          height: 43.h,
          child: Center(
            child: Image.asset(
              AppImages.notification,
            ),
          ),
        ),
        SizedBox(
          width: 43.w,
          height: 43.h,
          child: Center(
            child: Image.asset(
              AppImages.activity,
            ),
          ),
        ),
        SizedBox(
          width: 43.w,
          height: 43.h,
          child: Center(
            child: Image.asset(
              AppImages.settings,
            ),
          ),
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 196.h,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (167.5.w / 56.h),
                    mainAxisSpacing: 8.h,
                    crossAxisSpacing: 8.w),
                itemCount: playListsLength,
                itemBuilder: (context, index) {
                  return Container(
                    width: 167.50.w,
                    height: 56.h,
                    decoration: ShapeDecoration(
                      color: AppColors.onPrimary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.r)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 56.w,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  playLists[index].images?.first.url ?? ''),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        Text(playLists[index].name ?? '',
                            style: AppStyles.titleOfItems),
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(
            width: 343.w,
            height: 88.h,
            child: Text(
              AppStrings.newRelease,
              style: AppStyles.title,
            ),
          ),
          SizedBox(
            width: 343.w,
            height: 142.h,
            child: CarouselSlider(
              options: CarouselOptions(
                  autoPlay: false,
                  aspectRatio: 1.5,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  enlargeFactor: 1,
                  viewportFraction: 1),
              items: newSongs.map((i) {
                return Container(
                  width: 343.w,
                  height: 142.h,
                  decoration: ShapeDecoration(
                    color: AppColors.onPrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 142.w,
                        height: 142.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(i.images?.first.url ?? ''),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 201.w,
                        height: 142.h,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 16.w,
                              top: 16.h,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    i.name ?? 'notFound',
                                    style: AppStyles.titleOfItems,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4.h),
                                  SizedBox(
                                    width: 170.w,
                                    child: Text(
                                      i.artists?.first.name ?? 'notFound',
                                      style: AppStyles.titleOfItems
                                          .copyWith(color: AppColors.iconColor),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 11.w,
                              bottom: 18.h,
                              child: Image.asset(AppImages.heart),
                            ),
                            Positioned(
                              left: 153.w,
                              top: 94.h,
                              child: Container(
                                width: 32.w,
                                height: 32.h,
                                decoration: const ShapeDecoration(
                                  color: Colors.white,
                                  shape: OvalBorder(),
                                ),
                                child: const Center(
                                  child: Icon(Icons.play_arrow,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            width: 343.w,
            height: 88.h,
            child: Text(
              AppStrings.podcasts,
              style: AppStyles.title,
            ),
          ),
          SizedBox(
            width: 412.w,
            height: 200.h,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 138.w,
                    height: 200.h,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 138.w,
                          height: 138.h,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  podcasts[index].images?.first.url ?? ''),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r)),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 60.h,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                height: 20.h,
                                child: Text(
                                  podcasts[index].name ?? 'notfound',
                                  style: AppStyles.titleOfItems,
                                ),
                              ),
                              SizedBox(height: 3.h),
                              Text(
                                podcasts[index].description ?? 'notfound',
                                style: AppStyles.titleOfItems
                                    .copyWith(color: AppColors.iconColor),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 16.w,
                  );
                },
                itemCount: podcasts.length),
          )
        ],
      ),
    ),
  );
}
