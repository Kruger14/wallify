import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallify/common/utils/appcolors.dart';
import 'package:wallify/screens/mainscreens/navbar.dart';
import 'package:wallify/screens/otherscreens/wallpaper_detail_screen.dart';
import 'package:wallify/data/models/wallposters.dart';

class CategorizedWallpaperScreen extends ConsumerStatefulWidget {
  final String category;
  const CategorizedWallpaperScreen({super.key, required this.category});

  @override
  ConsumerState<CategorizedWallpaperScreen> createState() =>
      _CategorizedWallpaperScreenState();
}

class _CategorizedWallpaperScreenState
    extends ConsumerState<CategorizedWallpaperScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref.read(imgProvider.notifier).fetchNext();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imagesAsync = ref.watch(imgProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColorsLight.background
          : AppColorsDark.background,
      body: Column(
        children: [
          // Header Section
          Container(
            color: Colors.green,
            child: SafeArea(
              child: SizedBox(
                height: 8.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Categorized Wallpapers",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 22.sp,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FloatingNavbar(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Grid Section
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: imagesAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, _) => Center(child: Text("Error: $err")),
                data: (wallpapers) => GridView.builder(
                  controller: _scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 2.w,
                    mainAxisSpacing: 2.w,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: wallpapers.length,
                  itemBuilder: (context, index) {
                    final Wallposters poster = wallpapers[index];
                    return WallpaperCard(
                      imageUrl: poster.imageUrl,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailWallpaperScreen(
                              imageUrl: poster.imageUrl,
                              category: widget.category,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}