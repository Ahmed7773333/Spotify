import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/api/api_manager.dart';
import 'package:spotify_app/core/utils/app_colors.dart';
import 'package:spotify_app/core/utils/app_images.dart';
import 'package:spotify_app/core/utils/app_strings.dart';
import 'package:spotify_app/features/Home%20layout/data/datasources/home_remote_ds_impl.dart';
import 'package:spotify_app/features/Home%20layout/data/repositories/home_repo_impl.dart';
import 'package:spotify_app/features/Home%20layout/domain/usecases/categories.dart';
import 'package:spotify_app/features/Home%20layout/domain/usecases/new_release.dart';
import 'package:spotify_app/features/Home%20layout/domain/usecases/playlists.dart';
import 'package:spotify_app/features/Home%20layout/domain/usecases/podcasts.dart';
import 'package:spotify_app/features/Home%20layout/domain/usecases/search.dart';
import 'package:spotify_app/features/Home%20layout/presentation/bloc/home_layout_bloc.dart';
import 'package:spotify_app/features/Home%20layout/presentation/pages/home_tab.dart';
import 'package:spotify_app/features/Home%20layout/presentation/pages/library_tab.dart';
import 'package:spotify_app/features/Home%20layout/presentation/pages/search_tab.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;
  late PageController _pageController;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeLayoutBloc(
              UserPlaylistsUseCase(
                HomeRepoImpl(
                  HomeRemoteDSImpl(
                    ApiManager(),
                  ),
                ),
              ),
              NewReleaseUseCase(
                HomeRepoImpl(
                  HomeRemoteDSImpl(
                    ApiManager(),
                  ),
                ),
              ),
              PodcastsUseCase(
                HomeRepoImpl(
                  HomeRemoteDSImpl(
                    ApiManager(),
                  ),
                ),
              ),
              SearchUseCase(HomeRepoImpl(
                HomeRemoteDSImpl(
                  ApiManager(),
                ),
              )),
              CategoriesUseCase(HomeRepoImpl(
                HomeRemoteDSImpl(
                  ApiManager(),
                ),
              )),
            )
              ..add(GetUserPlaylists())
              ..add(GeNewSongs())
              ..add(GetPodcasts())
              ..add(GetCategories()),
        child: BlocConsumer<HomeLayoutBloc, HomeLayoutState>(
            listener: (context, state) {
          if (searchController.text.trim().isEmpty) {
            state.albums = [];
          }

          // Add more conditions for other statuses if needed
        }, builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: PageView(
              controller: _pageController,
              children: [
                homeTab(state.userPlayList ?? [], state.newSong ?? [],
                    state.podcasts ?? []),
                searchTab(
                  searchController,
                  () {
                    HomeLayoutBloc.get(context)
                        .add(SearchForAlbum(query: searchController.text));
                  },
                  state.albums ?? [],
                  state.categories ?? [],
                ),
                libraryTab(state.userPlayList ?? [])
              ],
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _pageController.jumpToPage(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.home,
                    color: AppColors.iconColor,
                  ),
                  activeIcon: Image.asset(
                    AppImages.home,
                    color: Colors.white,
                  ),
                  label: AppStrings.home,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.search,
                    color: AppColors.iconColor,
                  ),
                  activeIcon: Image.asset(
                    AppImages.search,
                    color: Colors.white,
                  ),
                  label: AppStrings.search,
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImages.library,
                    color: AppColors.iconColor,
                  ),
                  activeIcon: Image.asset(
                    AppImages.library,
                    color: Colors.white,
                  ),
                  label: AppStrings.yourLibs,
                ),
              ],
            ),
          );
        }));
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
