import 'package:flutter/material.dart';
import 'package:shopping_app/core/style/string_app.dart';

class GenderSelection extends StatefulWidget {
  final TextEditingController genderController;

  const GenderSelection({
    super.key,
    required this.genderController,
  });

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  String? selectedGender;
  List<String> genderList = ['male', 'female'];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: StringApp.gender,
        border: OutlineInputBorder(),
      ),
      value: selectedGender,
      hint: const Text(StringApp.selectGender),
      isExpanded: true,
      items: genderList.map((String gender) {
        return DropdownMenuItem(
          value: gender,
          child: Text(gender),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          selectedGender = newValue;
          widget.genderController.text = newValue ?? '';
        });
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please select gender';
        }
        return null;
      },
    );
  }
}
