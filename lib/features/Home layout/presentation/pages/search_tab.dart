import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_app/core/utils/app_colors.dart';
import 'package:spotify_app/core/utils/app_images.dart';
import 'package:spotify_app/core/utils/app_styles.dart';
import 'package:spotify_app/features/Home%20layout/data/models/categories_mode.dart';

import '../../../../core/utils/app_strings.dart';
import '../../data/models/album_model.dart';

// class SearchTab extends StatelessWidget {
//   const SearchTab(this.searchController, this.onTab, this.searchList,
//       {super.key});
//   final TextEditingController searchController;
//   final Function onTab;
//   final List<AlbumSearched> searchList;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text(AppStrings.search),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 19.w),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: 337.w,
//               height: 56.h,
//               clipBehavior: Clip.antiAlias,
//               decoration: ShapeDecoration(
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(4.r)),
//               ),
//               child: Center(
//                 child: TextField(
//                   style: AppStyles.titleOfItems.copyWith(color: Colors.black),
//                   controller: searchController,
//                   decoration: InputDecoration(
//                       prefixIcon: Image.asset(
//                         AppImages.search,
//                         color: AppColors.iconColor,
//                       ),
//                       prefixIconColor: AppColors.iconColor,
//                       enabled: true,
//                       hintText: 'Album...'),
//                   onChanged: (q) {
//                     onTab;
//                   },
//                   onSubmitted: (q) {
//                     onTab();
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 19.h,
//             ),
//             Text(
//               AppStrings.browse,
//               style: AppStyles.title,
//             ),
//             SizedBox(
//               height: 501.h,
//               child: ListView.builder(
//                   itemCount: searchList.length,
//                   itemBuilder: (context, index) {
//                     AlbumSearched i = searchList[index];
//                     return Container(
//                       width: 343.w,
//                       height: 142.h,
//                       decoration: ShapeDecoration(
//                         color: AppColors.onPrimary,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8.r)),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             width: 142.w,
//                             height: 142.h,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                 image: NetworkImage(i.images?.first.url ?? ''),
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             width: 201.w,
//                             height: 142.h,
//                             child: Stack(
//                               children: [
//                                 Positioned(
//                                   left: 16.w,
//                                   top: 16.h,
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         i.name ?? 'notFound',
//                                         style: AppStyles.titleOfItems,
//                                         overflow: TextOverflow.ellipsis,
//                                       ),
//                                       SizedBox(height: 4.h),
//                                       SizedBox(
//                                         width: 170.w,
//                                         child: Text(
//                                           i.artists?.first.name ?? 'notFound',
//                                           style: AppStyles.titleOfItems
//                                               .copyWith(
//                                                   color: AppColors.iconColor),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Positioned(
//                                   left: 11.w,
//                                   bottom: 18.h,
//                                   child: Image.asset(AppImages.heart),
//                                 ),
//                                 Positioned(
//                                   left: 153.w,
//                                   top: 94.h,
//                                   child: Container(
//                                     width: 32.w,
//                                     height: 32.h,
//                                     decoration: const ShapeDecoration(
//                                       color: Colors.white,
//                                       shape: OvalBorder(),
//                                     ),
//                                     child: const Center(
//                                       child: Icon(Icons.play_arrow,
//                                           color: Colors.black),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

Widget searchTab(TextEditingController searchController, VoidCallback onTab,
    List<AlbumSearched> searchList, List<Categoriess> categoriesList) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    appBar: AppBar(
      title: const Text(AppStrings.search),
    ),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 19.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 337.w,
            height: 56.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r)),
            ),
            child: Center(
              child: TextField(
                style: AppStyles.titleOfItems.copyWith(color: Colors.black),
                controller: searchController,
                decoration: InputDecoration(
                    prefixIcon: Image.asset(
                      AppImages.search,
                      color: AppColors.iconColor,
                    ),
                    prefixIconColor: AppColors.iconColor,
                    enabled: true,
                    hintText: 'Album...'),
                onChanged: (q) {
                  onTab();
                },
                onSubmitted: (q) {
                  onTab();
                },
              ),
            ),
          ),
          SizedBox(
            height: 19.h,
          ),
          searchList.isEmpty
              ? emptySearchTab(categoriesList)
              : listOfRuslts(searchList),
        ],
      ),
    ),
  );
}

Widget listOfRuslts(List<AlbumSearched> searchList) {
  return SizedBox(
    height: 501.h,
    child: ListView.separated(
      itemCount: searchList.length,
      itemBuilder: (context, index) {
        AlbumSearched i = searchList[index];
        return Container(
          width: 335.w,
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
                width: 194.w,
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
                          child: Icon(Icons.play_arrow, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 8.h,
        );
      },
    ),
  );
}

Widget emptySearchTab(List<Categoriess> categoriesList) {
  final List<Color> colorsList = [
    const Color(0xffE7B770),
    const Color(0xff02B4A5),
    const Color(0xff3E6498),
    const Color(0xff3EC4EB),
    const Color(0xffE54554),
    const Color(0xffBA9475)
  ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        AppStrings.browse,
        style: AppStyles.title,
      ),
      SizedBox(
        height: 501.h,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (163.w / 109.h),
                mainAxisSpacing: 11.h,
                crossAxisSpacing: 9.w),
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              Color color = colorsList[index % colorsList.length];
              return Container(
                width: 163.w,
                height: 109.h,
                decoration: ShapeDecoration(
                  color: color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r)),
                ),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Positioned(
                      right: 0.w,
                      bottom: 20.h,
                      child: Transform(
                        transform: Matrix4.identity()
                          ..translate(0.0, 0.0)
                          ..rotateZ(0.30),
                        child: Container(
                          width: 70.w,
                          height: 70.h,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  categoriesList[index].icons?.first.url ?? ''),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 11.w,
                      top: 6.h,
                      child: Text(
                        categoriesList[index].name ?? 'not found',
                        style: AppStyles.titleOfItems.copyWith(fontSize: 13.sp),
                      ),
                    ),
                  ],
                ),
              );
            }),
      )
    ],
  );
}
