import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallify/screens/otherscreens/categorized_wallpaper_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToCategory(BuildContext context, String category) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CategorizedWallpaperScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SafeArea(
          child: Column(
            children: [
              // Logo Section with Bigger Logo and Smaller AppBar Height
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 1.h), // Reduced padding for smaller AppBar height
                child: Center(
                  child: SizedBox(
                    width: 15.w, // Increased logo size
                    height: 15.w, // Increased logo size
                    child: Image.asset(
                      'assets/logo/wallifylogo.png', // Replace with your asset image path
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Categories Section
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 2.h,
                  childAspectRatio: 1,
                  children: [
                    CategoryCard(
                      title: "Anime",
                      imageUrl: "https://picsum.photos/id/1011/400/300",
                      onTap: () => navigateToCategory(context, "Anime"),
                    ),
                    CategoryCard(
                      title: "Abstract",
                      imageUrl: "https://picsum.photos/id/1011/400/300",
                      onTap: () => navigateToCategory(context, "Abstract"),
                    ),
                    CategoryCard(
                      title: "Nature",
                      imageUrl: "https://picsum.photos/id/1020/400/300",
                      onTap: () => navigateToCategory(context, "Nature"),
                    ),
                    CategoryCard(
                      title: "Landscape",
                      imageUrl: "https://picsum.photos/id/1035/400/300",
                      onTap: () => navigateToCategory(context, "Landscape"),
                    ),
                    CategoryCard(
                      title: "Animals",
                      imageUrl: "https://picsum.photos/id/1003/400/300",
                      onTap: () => navigateToCategory(context, "Animals"),
                    ),
                    CategoryCard(
                      title: "Art",
                      imageUrl: "https://picsum.photos/id/1062/400/300",
                      onTap: () => navigateToCategory(context, "Art"),
                    ),
                    CategoryCard(
                      title: "Aesthetic",
                      imageUrl: "https://picsum.photos/id/1062/400/300",
                      onTap: () => navigateToCategory(context, "Aesthetic"),
                    ),
                    CategoryCard(
                      title: "Others",
                      imageUrl: "https://picsum.photos/id/1070/400/300",
                      onTap: () => navigateToCategory(context, "Others"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable CategoryCard Widget
class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w, // Responsive width
        height: 18.h, // Responsive height
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3.w), // Responsive radius
          color: Colors.grey[900],
          border: Border.all(
              color: Colors.white, width: 0.5.w), // Responsive border
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.w), // Responsive radius
                color: Colors.black
                    .withOpacity(0.3), // Dark overlay for readability
              ),
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 4.w, // Responsive font size
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
