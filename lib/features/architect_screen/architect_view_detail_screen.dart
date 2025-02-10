import 'package:flutter/material.dart';

class ArchitectViewDetailScreen extends StatelessWidget {
  const ArchitectViewDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 15)
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://png.pngtree.com/background/20230614/original/pngtree-man-in-a-suit-with-his-face-looking-towards-the-camera-picture-image_3535759.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Sarah Anderson',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Senior Architect, LEED AP',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                const Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Award-winning architect with 12+ years of experience in sustainable design and urban development. Specialized in contemporary residential and commercial projects with a focus on environmental innovation.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Education',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Master of Architecture',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text('Harvard Graduate School of Design',
                    style: TextStyle(fontSize: 16)),
                const Text('2008-2010',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 16),
                const Text(
                  'Bachelor of Environmental Design',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text('UC Berkeley', style: TextStyle(fontSize: 16)),
                const Text('2004-2008',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 32),
                const Text(
                  'Experience',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Senior Architect',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text('Foster + Partners', style: TextStyle(fontSize: 16)),
                const Text('2015-Present',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 8),
                const Text(
                  'Lead architect for sustainable commercial projects, managing teams of 15+ professionals and overseeing projects valued at \$50M+.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 32),
                const Wrap()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
