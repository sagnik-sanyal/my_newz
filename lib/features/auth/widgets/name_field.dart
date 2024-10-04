import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

@immutable
class NameField extends StatelessWidget {
  const NameField({
    this.hintText = 'Enter your name',
    this.label = 'Name',
    this.controlName,
    this.formControl,
    super.key,
  });

  final String hintText;
  final String label;
  final String? controlName;
  final FormControl<String>? formControl;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: controlName,
      formControl: formControl,
      decoration: InputDecoration(labelText: label, hintText: hintText),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      validationMessages: _buildMessages,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
    );
  }

  /// Builds the validations for the name field
  Map<String, ValidationMessageFunction> get _buildMessages {
    return <String, ValidationMessageFunction>{
      ValidationMessage.required: (_) => 'Please enter your name',
      ValidationMessage.pattern: (_) => 'Please enter a valid name',
      ValidationMessage.minLength: (Object error) => switch (error) {
            final Map<String, Object?> map =>
              '''Name must be at least ${map['requiredLength']} characters long''',
            _ => 'Name too short',
          },
    };
  }
}
