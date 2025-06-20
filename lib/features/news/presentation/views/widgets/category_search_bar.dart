import 'package:flutter/material.dart';
import '../search_news_view.dart';

class CategorySearchBar extends StatefulWidget {
  const CategorySearchBar({super.key});

  @override
  CategorySearchBarState createState() => CategorySearchBarState();
}

class CategorySearchBarState extends State<CategorySearchBar> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> options = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];

  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (TextEditingValue textEditingValue) {
        return options.where(
          (String option) {
            return option
                .toLowerCase()
                .contains(textEditingValue.text.toLowerCase());
          },
        );
      },
      onSelected: (String? selectedOption) {
        setState(() {
          _textEditingController.text = selectedOption ?? '';
        });

        if (selectedOption != null) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return SearchNewsView(category: selectedOption);
              },
            ),
          ).then((_) {
            _textEditingController.clear();
          });
        }
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextFormField(
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          controller: textEditingController,
          focusNode: focusNode,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                onPressed: () {
                  textEditingController.clear();
                },
                icon: const Icon(Icons.cancel_rounded),
              ),
              hintText: 'Search or select Category',
              border: const OutlineInputBorder(),
              isDense: true),
        );
      },
      optionsViewBuilder: (BuildContext context,
          AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            elevation: 4.0,
            child: SizedBox(
              height: 200,
              width: 255,
              child: ListView(
                padding: EdgeInsets.zero,
                children: options.map((String option) {
                  return ListTile(
                    title: Text(option),
                    onTap: () {
                      onSelected(option);
                    },
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
