import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallify/common/utils/appcolors.dart';
import 'package:wallify/presentation/screens/mainscreens/navbar.dart';
import 'package:wallify/presentation/screens/otherscreens/wallpaper_detail_screen.dart';

class CategorizedWallpaperScreen extends StatefulWidget {
  final String category;
  const CategorizedWallpaperScreen({super.key, required this.category});

  @override
  State<CategorizedWallpaperScreen> createState() =>
      _CategorizedWallpaperScreenState();
}

class _CategorizedWallpaperScreenState extends State<CategorizedWallpaperScreen> {
  final List<String> wallpaperUrls = List.generate(
      10,
      (index) =>
          "https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ? AppColorsLight.background : AppColorsDark.background,
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
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FloatingNavbar(),));
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
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two columns
                  crossAxisSpacing: 2.w,
                  mainAxisSpacing: 2.w,
                  childAspectRatio: 0.7, // Adjust height-to-width ratio
                ),
                itemCount: wallpaperUrls.length,
                itemBuilder: (context, index) {
                  return WallpaperCard(
                    imageUrl: wallpaperUrls[index],
                    onTap: () {
                      Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => DetailWallpaperScreen(imageUrl: wallpaperUrls[index], category: widget.category,),));
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Wallpaper Card Component
class WallpaperCard extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  const WallpaperCard({
    super.key,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2.w, // Adjust shadow size based on screen size
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.w),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
