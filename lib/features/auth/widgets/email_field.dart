import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

@immutable
class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    this.controlName,
    this.formControl,
    this.label = 'Email',
    this.hintText = 'Enter your email',
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
      autofillHints: const <String>[AutofillHints.email],
      decoration: InputDecoration(labelText: label, hintText: hintText),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      validationMessages: <String, ValidationMessageFunction>{
        ValidationMessage.email: (_) => 'Please enter a valid email',
        ValidationMessage.required: (_) => 'Please enter your email',
      },
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ],
    );
  }
}
