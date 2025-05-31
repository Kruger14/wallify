import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallify/common/utils/appcolors.dart';
import 'package:wallify/screens/otherscreens/categorized_wallpaper_screen.dart';

class DetailWallpaperScreen extends StatefulWidget {
  final String imageUrl;
  final String category;
  const DetailWallpaperScreen({super.key, required this.imageUrl, required this.category}); 

  @override
  State<DetailWallpaperScreen> createState() => _DetailWallpaperScreenState();
}

class _DetailWallpaperScreenState extends State<DetailWallpaperScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ? AppColorsLight.background : AppColorsDark.background,
      body: Column(
        children: [
          // Custom AppBar
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
                        "Wallpaper Preview",
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
                              builder: (context) => CategorizedWallpaperScreen(category: widget.category),
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

          // Wallpaper and Download Button
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Column(
                children: [
                  SizedBox(height: 2.h),
                  Center(
                    child: SizedBox(
                      width: 70.w,
                      height: 70.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.w),
                        child: Image.network(
                          'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // TODO: add download logic
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.5.h),
                        ),
                        child: Icon(Icons.download, color: Colors.white, size: 4.h),
                      ),
                    ],
                  ),
                  SizedBox(height: 3.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
