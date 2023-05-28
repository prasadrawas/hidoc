import 'package:flutter/material.dart';
import 'package:hidoc/res/app_strings.dart';

List<String> _category = [
  'Critical Care',
  'Technology',
  'Health',
  'Medical',
  'Science & Research',
];

void openCategoryListDialog(
    BuildContext context, Function(String country) onSelect) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(selectCategory),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _category.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_category[index]),
                onTap: () {
                  Navigator.pop(context);
                  onSelect(_category[index]);
                },
              );
            },
          ),
        ),
      );
    },
  );
}
