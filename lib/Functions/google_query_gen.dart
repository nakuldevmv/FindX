import 'package:findx/functions/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:findx/functions/notify_snack_bar.dart';

void googleQueryGen(
    BuildContext context, String selectedList, String userInput) {
  if (userInput.isEmpty || selectedList.isEmpty) {
    if (userInput.isEmpty) {
      notifySnackBar(context, "> Please Enter a Search Item <");
    } else if (selectedList.isEmpty) {
      notifySnackBar(
          context, "> At least one file format should be selected <");
    }
  } else {
    List<String> excludedExtensions = [
      "jsp",
      "pl",
      "php",
      "html",
      "aspx",
      "htm",
      "cf",
      "shtml"
    ];

    bool containsExcludedExtension =
        excludedExtensions.any((ext) => selectedList.contains(ext));

    String search;
    if (containsExcludedExtension) {
      search = '("$userInput" OR intitle:"$userInput") $selectedList';
    } else {
      search =
          '("$userInput" OR intitle:"$userInput") $selectedList -inurl:(${excludedExtensions.join('|')})';
    }

    String encodedQuery = Uri.encodeComponent(search);
    String googleSearchUrl = 'https://www.google.com/search?q=$encodedQuery';
    urlLaunch(googleSearchUrl);
  }
}
