import 'package:flutter/material.dart';

import '../../../app/constants/app_colors.dart';
import '../../../shared/widgets/app_text.dart';

@immutable
class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        title: AppText.bold('MyNews', color: Colors.white, fontSize: 20),
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.near_me_rounded, color: Colors.white),
            label: const Text('IN', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: const Center(
        child: Text('News Feed Screen'),
      ),
    );
  }
}
