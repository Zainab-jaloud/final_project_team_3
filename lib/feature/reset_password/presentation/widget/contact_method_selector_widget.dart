import 'package:flutter/material.dart';
import 'contact_method_option_widget.dart';

class ContactMethodSelectorWidget extends StatefulWidget {
  final String phoneValue;
  final String emailValue;
  final ValueChanged<String> onSelected;

  const ContactMethodSelectorWidget({
    super.key,
    required this.phoneValue,
    required this.emailValue,
    required this.onSelected,
  });

  @override
  State<ContactMethodSelectorWidget> createState() =>
      _ContactMethodSelectorWidgetState();
}

class _ContactMethodSelectorWidgetState
    extends State<ContactMethodSelectorWidget> {
  String? selectedValue;

  void _select(String value) {
    setState(() => selectedValue = value);
    widget.onSelected(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContactMethodOptionWidget(
          iconPath: 'assets/icons/phone.svg',
          label: 'Via phone',
          value: widget.phoneValue,
          isSelected: selectedValue == widget.phoneValue,
          onTap: () => _select(widget.phoneValue),
        ),
        const SizedBox(height: 12),
        ContactMethodOptionWidget(
          iconPath: 'assets/icons/mail.svg',
          label: 'Via email',
          value: widget.emailValue,
          isSelected: selectedValue == widget.emailValue,
          onTap: () => _select(widget.emailValue),
        ),
      ],
    );
  }
}
