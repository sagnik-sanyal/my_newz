import 'package:flutter/material.dart';

import '../../../app/constants/spacings.dart';
import '../../../shared/extensions/widget_ext.dart';

@immutable
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: const Text('Signup'),
          ),
        ],
      ).addPadding(
        const EdgeInsets.symmetric(
          horizontal: kHorizontalSpace,
          vertical: kVerticalSpace,
        ),
      ),
    );
  }
}
