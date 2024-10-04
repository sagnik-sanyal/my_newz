import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/constants/ui_constants.dart';
import '../../../shared/extensions/widget_ext.dart';
import '../../../shared/widgets/loading_button.dart';
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
          Validators.minLength(6),
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
              Expanded(child: _buildFields()),
              _buildButton(),
              const Padding(
                padding: EdgeInsets.only(top: kVerticalSpace / 2),
                child: Text.rich(
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
                ),
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

  /// Builds the fields required for the form
  SingleChildScrollView _buildFields() {
    return const SingleChildScrollView(
      child: Center(
        child: Column(
          children: <Widget>[
            EmailField(controlName: 'email'),
            SizedBox(height: 30),
            PasswordField(controlName: 'password'),
          ],
        ),
      ),
    );
  }

  /// Builds the register button
  ReactiveFormConsumer _buildButton() {
    return ReactiveFormConsumer(
      builder: (_, FormGroup form, __) => LoadingButton(
        onPressed: form.valid ? () {} : null,
        isLoading: true,
        child: const Text('Login'),
      ),
    );
  }
}
