import 'package:findx/Functions/launch_url.dart';
import 'package:flutter/material.dart';
import 'package:findx/Functions/notifySnackBar.dart';

googleQueryGen(BuildContext context, String selectedList, String userInput) {
  if (userInput.isEmpty || selectedList.isEmpty) {
    if (userInput.isEmpty) {
      notifySnackBar(context, "Please Enter a Search Item");
    } else if (selectedList.isEmpty) {
      notifySnackBar(context, "At least one file format should be selected");
    }
  } else {
    String search = '("$userInput" OR intitle:"$userInput") $selectedList -inurl:(jsp|pl|php|html|aspx|htm|cf|shtml)';
    String encodedQuery = Uri.encodeComponent(search);
    String googleSearchUrl = 'https://www.google.com/search?q=$encodedQuery';
    urlLaunch(googleSearchUrl);
  }
}
