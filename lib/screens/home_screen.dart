import 'package:flutter/material.dart';
import 'rectangle_screen.dart';
import 'circle_screen.dart';
import 'cube_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bangun Ruang Kalkulator'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Select a shape to calculate:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              _buildShapeButton(
                context,
                'Rectangle Area',
                Icons.rectangle_outlined,
                Colors.blue,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RectangleScreen()),
                ),
              ),
              const SizedBox(height: 20),
              _buildShapeButton(
                context,
                'Circle Area',
                Icons.circle_outlined,
                Colors.green,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CircleScreen()),
                ),
              ),
              const SizedBox(height: 20),
              _buildShapeButton(
                context,
                'Cube Volume',
                Icons.crop_square_rounded,
                Colors.orange,
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CubeScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShapeButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 30, color: color),
        label: Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 3,
        ),
      ),
    );
  }
}

