import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/constants/ui_constants.dart';
import '../../../shared/extensions/widget_ext.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';

@immutable
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  /// Builds the form
  FormGroup _buildForm() {
    return FormGroup(<String, AbstractControl<Object?>>{
      'email': FormControl<String>(
        validators: <Validator<Object?>>[Validators.required, Validators.email],
      ),
      'password': FormControl<String>(
        validators: <Validator<Object?>>[
          Validators.required,
          Validators.minLength(8),
          Validators.pattern(PasswordField.regex),
        ],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: ReactiveFormBuilder(
        form: _buildForm,
        builder: (_, __, Widget? child) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: const <Widget>[
                    EmailField(controlName: 'email'),
                    SizedBox(height: kVerticalSpace),
                    PasswordField(controlName: 'password'),
                  ],
                ),
              ),
              _buildButton(),
              Padding(
                padding: const EdgeInsets.only(top: kVerticalSpace / 2),
                child: _buildRegisterMsg(),
              ),
            ],
          ),
        ),
      ).addPadding(
        const EdgeInsets.symmetric(
          horizontal: kHorizontalSpace,
          vertical: kVerticalSpace,
        ),
      ),
    );
  }

  /// Builds the register button
  ReactiveFormConsumer _buildButton() {
    return ReactiveFormConsumer(
      builder: (_, FormGroup form, __) => ElevatedButton(
        onPressed: form.valid ? () {} : null,
        child: const Text('Login'),
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
}
