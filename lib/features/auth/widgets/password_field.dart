import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

@immutable
class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    this.formControl,
    this.controlName,
    this.label = 'Password',
    this.hintText = 'Enter your password',
    this.obscureText = true,
  });

  final String hintText;
  final String label;
  final bool obscureText;
  final String? controlName;
  final FormControl<String>? formControl;

  static final RegExp regex = RegExp(r'^(?=.*[A-Za-z])(?=.*d)[A-Za-zd]$');

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: controlName,
      formControl: formControl,
      decoration: InputDecoration(labelText: label, hintText: hintText),
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      autofillHints: const <String>[AutofillHints.password],
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
      validationMessages: _buildValidations,
    );
  }

  /// Builds the validations for the password field
  Map<String, ValidationMessageFunction> get _buildValidations {
    return <String, ValidationMessageFunction>{
      ValidationMessage.required: (_) => 'Please enter your password',
      ValidationMessage.minLength: (Object error) => switch (error) {
            final Map<String, Object?> map =>
              '''Password must be at least ${map['requiredLength']} characters long''',
            _ => 'Password too short',
          },
      ValidationMessage.pattern: (_) =>
          'Password must contain a letter and a number',
    };
  }
}
