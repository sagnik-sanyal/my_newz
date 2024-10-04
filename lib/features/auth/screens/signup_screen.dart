import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../app/constants/app_colors.dart';
import '../../../app/constants/ui_constants.dart';
import '../../../shared/extensions/widget_ext.dart';
import '../../../shared/widgets/app_text.dart';
import '../widgets/email_field.dart';
import '../widgets/name_field.dart';
import '../widgets/password_field.dart';

@immutable
class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  /// Builds the form
  FormGroup _buildForm() {
    return FormGroup(<String, AbstractControl<Object?>>{
      'name': FormControl<String>(
        validators: <Validator<Object?>>[
          const RequiredValidator(),
          const MinLengthValidator(3),
          Validators.pattern(RegExp(r'^[a-zA-Z\s]*$')),
        ],
      ),
      'email': FormControl<String>(
        validators: const <Validator<Object?>>[
          RequiredValidator(),
          EmailValidator(),
        ],
      ),
      'password': FormControl<String>(
        validators: <Validator<Object?>>[
          const RequiredValidator(),
          const MinLengthValidator(6),
          Validators.pattern(PasswordField.regex),
        ],
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppText.bold('MyNews', color: AppColors.primary, fontSize: 20),
      ),
      body: ReactiveFormBuilder(
        form: _buildForm,
        builder: (_, __, Widget? child) => GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Column(
            children: <Widget>[
              Expanded(child: _buildFields()),
              _buildButton(),
              const Text.rich(
                TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(fontWeight: FontWeight.w400),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ).padding(const EdgeInsets.only(top: vPadding / 1.5)),
            ],
          ).padding(),
        ),
      ),
    );
  }

  /// Builds the submit button
  ReactiveFormConsumer _buildButton() {
    return ReactiveFormConsumer(
      child: const Text('Signup'),
      builder: (_, FormGroup form, Widget? child) => ElevatedButton(
        onPressed: form.valid ? () {} : null,
        child: child,
      ),
    );
  }

  /// Builds the fields required for the form
  SingleChildScrollView _buildFields() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const NameField(controlName: 'name'),
          const EmailField(controlName: 'email'),
          const PasswordField(controlName: 'password'),
        ].addSpacing(25),
      ),
    );
  }
}
