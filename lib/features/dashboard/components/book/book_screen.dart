import 'package:flutter/material.dart';
import 'package:smart_nepal/core/common_widgets/app_bar.dart';
import 'package:smart_nepal/core/common_widgets/card_ui.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: "BOOK"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Icon(Icons.menu_book, size: 64, color: Colors.green),
                  const SizedBox(height: 16),
                  Text(
                    'Book Management',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Manage your books and reading materials',
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
