import 'package:flutter/material.dart';

class FilterTabs extends StatelessWidget {
  final List<String> categories;
  final String selected;
  final ValueChanged<String> onSelected;

  const FilterTabs({
    super.key,
    required this.categories,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: categories.map((cat) {
        final isSelected = cat == selected;
        return ChoiceChip(
          label: Text(cat),
          selected: isSelected,
          onSelected: (_) => onSelected(cat),
        );
      }).toList(),
    );
  }
}
