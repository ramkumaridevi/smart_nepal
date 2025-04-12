import 'package:flutter/material.dart';
import 'package:smart_nepal/core/common_widgets/app_bar.dart';
import 'package:smart_nepal/core/common_widgets/card_ui.dart';
class RoomScreen extends StatelessWidget {
  const RoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "ROOM"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Icon(Icons.meeting_room, size: 64, color: Colors.blue),
                  const SizedBox(height: 16),
                  Text(
                    'Room Management',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Manage your rooms and meeting spaces',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Features Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                 FeatureCard(
                    icon: Icons.library_books,
                    title: 'Library',
                    color: Colors.blue,
                  ),
                  FeatureCard(
                    icon: Icons.search,
                    title: 'Search',
                    color: Colors.orange,
                  ),
                  FeatureCard(
                    icon: Icons.bookmark,
                    title: 'Bookmarks',
                    color: Colors.purple,
                  ),
                  FeatureCard(
                    icon: Icons.history,
                    title: 'History',
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  }