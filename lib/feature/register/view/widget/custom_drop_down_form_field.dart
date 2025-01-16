import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
          labelText: 'Gender',
          border: OutlineInputBorder(),
        ),
        value: selectedGender,
        hint: const Text('Select Gender'),
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
      ),
    );
  }
}
