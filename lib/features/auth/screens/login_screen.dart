import 'package:flutter/material.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/constants/spacings.dart';

@immutable
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalSpace,
          vertical: kVerticalSpace,
        ),
        child: Column(
          children: <Widget>[
            _form(),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Register'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: kVerticalSpace / 2),
              child: _buildRegisterMsg(),
            ),
          ],
        ),
      ),
    );
  }

  /// Creates the register message
  Text _buildRegisterMsg() {
    return const Text.rich(
      TextSpan(
        text: "Don't have an account? ",
        children: <TextSpan>[
          TextSpan(
            text: 'Register',
            style: TextStyle(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  Expanded _form() {
    return const Expanded(
      child: Column(
        children: <Widget>[
          Center(
            child: Text('Login Screen'),
          ),
        ],
      ),
    );
  }
}
