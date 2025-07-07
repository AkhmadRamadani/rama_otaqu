import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rama_otaqu/core/assets/gen/assets.gen.dart';
import 'package:rama_otaqu/core/config/route/route_config.gr.dart';
import 'package:rama_otaqu/core/themes/app_colors_theme.dart';
import 'package:rama_otaqu/modules/home/bloc/home_bloc.dart';
import 'package:rama_otaqu/modules/home/bloc/search/bloc/search_bloc.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<String> imagePromoPath = [
    Assets.images.statics.promos.promo1.path,
    Assets.images.statics.promos.promo2.path,
    Assets.images.statics.promos.promo3.path,
    Assets.images.statics.promos.promo4.path,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            24.verticalSpace,
            _buildRecentSearches(context),
            8.verticalSpace,
            _buildHotPromo(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(32.sp),
        bottomRight: Radius.circular(32.sp),
      ),
      child: Stack(
        children: [
          _buildHeaderBackground(),
          Container(
            width: 1.sw,
            height: 0.45.sh,
            color: Colors.black.withAlpha(80),
          ),
          _buildHeaderContent(context),
        ],
      ),
    );
  }

  Widget _buildHeaderBackground() {
    return Container(
      width: 1.sw,
      height: 0.45.sh,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.illustrations.nightIllustration.path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildHeaderContent(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 0.45.sh,
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore the world today',
            style: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1,
              shadows: _textShadows(),
            ),
          ),
          SizedBox(height: 8.sp),
          RichText(
            text: TextSpan(
              text: "Discover",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1,
                shadows: _textShadows(),
              ),
              children: [
                TextSpan(
                  text: " - take your travel to next level",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.sp),
          _buildSearchField(context),
          SizedBox(height: 32.sp),
        ],
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return Container(
      width: 1.sw,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.sp),
        boxShadow: [_boxShadow()],
      ),
      child: TextFormField(
        onTap: () => _showSearchModal(context),
        readOnly: true,
        decoration: _searchInputDecoration(),
      ),
    );
  }

  InputDecoration _searchInputDecoration() {
    return InputDecoration(
      border: InputBorder.none,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 16.sp),
      hintText: 'Search your destination',
      hintStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
      suffixIcon: Icon(Icons.search, color: Colors.black, size: 24.sp),
    );
  }

  void _showSearchModal(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      enableDrag: false,
      builder: (context) {
        return BlocProvider(
          create: (_) => SearchBloc()..add(OnInitial()),
          child: _SearchModal(),
        );
      },
    );

    // ignore: use_build_context_synchronously
    context.read<HomeBloc>().add(OnHomePageLoaded());
  }

  Widget _buildRecentSearches(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoadSuccess && state.recentSearchesData.isNotEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.sp),
                child: Row(
                  children: [
                    Text(
                      'Recent Searches',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed:
                          () => context.read<HomeBloc>().add(
                            OnClearRecentSearches(),
                          ),
                      child: Text(
                        'Clear',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColorsTheme.pink,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              8.verticalSpace,
              SizedBox(
                height: 50.sp,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.recentSearchesData.length,
                  itemBuilder: (context, index) {
                    final search = state.recentSearchesData[index];
                    return Container(
                      margin: index == 0 ? EdgeInsets.only(left: 24.sp) : null,
                      child: GestureDetector(
                        onTap: () {
                          context.router.push(SearchResultRoute(data: search));
                        },
                        child: Chip(
                          label: SizedBox(
                            width: 0.4.sw,
                            child: Text(
                              search.name ?? 'Places',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          onDeleted: () {
                            context.router.push(
                              SearchResultRoute(data: search),
                            );
                          },
                          deleteIcon: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColorsTheme.purple,
                            ),
                            child: Icon(
                              Icons.arrow_circle_right_outlined,
                              color: Colors.white,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => 8.horizontalSpace,
                ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildHotPromo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.sp),
          child: Text(
            'Hot Promo',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        8.verticalSpace,
        CarouselSlider(
          items:
              imagePromoPath
                  .map(
                    (path) => ClipRRect(
                      borderRadius: BorderRadius.circular(16.sp),
                      child: Image.asset(path, fit: BoxFit.cover),
                    ),
                  )
                  .toList(),
          options: CarouselOptions(
            aspectRatio: 4 / 1,
            viewportFraction: 0.8,
            enableInfiniteScroll: true,
            autoPlay: true,
            enlargeCenterPage: true,
          ),
        ),
      ],
    );
  }

  List<Shadow> _textShadows() {
    return [
      Shadow(
        color: Colors.black.withAlpha(100),
        offset: const Offset(0, 2),
        blurRadius: 4,
      ),
    ];
  }

  BoxShadow _boxShadow() {
    return BoxShadow(
      color: Colors.black.withAlpha(100),
      offset: const Offset(0, 2),
      blurRadius: 4,
    );
  }
}

class _SearchModal extends StatelessWidget {
  const _SearchModal();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      color: AppColorsTheme.purple,
      padding: EdgeInsets.only(top: 48.sp),
      child: Column(
        children: [
          _buildSearchBar(context),
          24.verticalSpace,
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state is SearchSuccess) {
                return Expanded(
                  child: Column(
                    children: [
                      _buildSectionTitle('Results', AppColorsTheme.pink),
                      _buildPlaceholderBox(height: 0.7.sh),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 24.sp, right: 8.sp),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.sp),
              boxShadow: [_boxShadow()],
            ),
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                TextEditingController controller = TextEditingController();
                return TextFormField(
                  controller: controller,
                  onFieldSubmitted: (value) {
                    context.read<SearchBloc>().add(OnSearch(value));
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.sp,
                      vertical: 16.sp,
                    ),
                    hintText: 'Search your destination',
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 24.sp,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        TextButton(
          onPressed: () => context.router.pop(),
          child: Text(
            'Cancel',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              shadows: [_textShadow()],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, Color color) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Container(
          width: 1.sw,
          padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.sp)),
            boxShadow: [_boxShadow()],
          ),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              16.horizontalSpace,
              if (state is SearchLoading)
                SizedBox(
                  width: 12.sp,
                  height: 12.sp,
                  child: const CircularProgressIndicator(color: Colors.white),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPlaceholderBox({double? height}) {
    return Expanded(
      child: Container(
        width: 1.sw,
        padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [_boxShadow()],
        ),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return SizedBox(
                width: 24.w,
                height: 24.w,
                child: const CircularProgressIndicator(),
              );
            } else if (state is SearchFailure) {
              return Text(state.message);
            } else if (state is SearchSuccess) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      context.router.push(
                        SearchResultRoute(data: state.destinationsData[index]),
                      );
                    },
                    child: Container(
                      width: 1.sw,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.sp,
                        vertical: 12.sp,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [_boxShadow()],
                        borderRadius: BorderRadius.circular(16.sp),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.destinationsData[index].name ?? "",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          8.verticalSpace,
                          Text(
                            state.destinationsData[index].typeName ?? "",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => 12.verticalSpace,
                itemCount: state.destinationsData.length,
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  BoxShadow _boxShadow() => BoxShadow(
    color: Colors.black.withAlpha(100),
    offset: const Offset(0, 2),
    blurRadius: 4,
  );

  Shadow _textShadow() => Shadow(
    color: Colors.black.withAlpha(100),
    offset: const Offset(0, 2),
    blurRadius: 4,
  );
}
