import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wallify/common/utils/appcolors.dart';
import 'package:wallify/screens/otherscreens/categorized_wallpaper_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigateToCategory(BuildContext context, String category) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CategorizedWallpaperScreen(category: category),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light ? AppColorsLight.background : AppColorsDark.background,
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
                  mainAxisSpacing: 3.h,
                  childAspectRatio: 2,
                  children: [
                    CategoryCard(
                      title: 'Anime',
                      backgroundColor: Colors.deepPurple,
                      assetImagePath: 'assets/logo/wallifylogo.png',
                      onTap: () => navigateToCategory(context, 'Anime'),
                    ),
                    CategoryCard(
                      title: 'Abstract',
                      backgroundColor: Colors.blueGrey,
                      assetImagePath: 'assets/logo/wallifylogo.png',
                      onTap: () => navigateToCategory(context, 'Abstract'),
                    ),
                    CategoryCard(
                      title: 'Nature',
                      backgroundColor: Colors.green,
                      assetImagePath: 'assets/logo/wallifylogo.png',
                      onTap: () => navigateToCategory(context, 'Nature'),
                    ),
                    CategoryCard(
                      title: 'Landscape',
                      backgroundColor: Colors.brown,
                      assetImagePath: 'assets/logo/wallifylogo.png',
                      onTap: () => navigateToCategory(context, 'Landscape'),
                    ),
                    CategoryCard(
                      title: 'Animals',
                      backgroundColor: Colors.orangeAccent,
                      assetImagePath: 'assets/logo/wallifylogo.png',
                      onTap: () => navigateToCategory(context, 'Animals'),
                    ),
                    CategoryCard(
                      title: 'Art',
                      backgroundColor: Colors.indigo,
                      assetImagePath: 'assets/logo/wallifylogo.png',
                      onTap: () => navigateToCategory(context, 'Art'),
                    ),
                    CategoryCard(
                      title: 'Aesthetic',
                      backgroundColor: Colors.pinkAccent,
                      assetImagePath: 'assets/logo/wallifylogo.png',
                      onTap: () => navigateToCategory(context, 'Aesthetic'),
                    ),
                    CategoryCard(
                      title: 'Others',
                      backgroundColor: Colors.teal,
                      assetImagePath: 'assets/logo/wallifylogo.png',
                      onTap: () => navigateToCategory(context, 'Others'),
                    ),
                    CategoryCard(
                      title: 'Gaming',
                      backgroundColor: Colors.pinkAccent,
                      assetImagePath: 'assets/logo/wallifylogo.png',
                      onTap: () => navigateToCategory(context, 'Gaming'),
                    ),
                    CategoryCard(
                      title: 'Gaming',
                      backgroundColor: Colors.pinkAccent,
                      assetImagePath: 'assets/logo/wallifylogo.png',
                      onTap: () {
                        print('Gaming card tapped!');
                      },
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

//category card
class CategoryCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final String assetImagePath;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.assetImagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            // Positioned image bottom right
            Positioned(
              bottom: 8,
              right: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  assetImagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Title text top left
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
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
