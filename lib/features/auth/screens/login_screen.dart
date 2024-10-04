import 'package:flutter/material.dart';

@immutable
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Column(
        children: <Widget>[
          _form(),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Register'),
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
