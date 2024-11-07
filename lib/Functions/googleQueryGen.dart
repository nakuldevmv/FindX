import 'package:findx/Functions/launch_url.dart';

googleQueryGen(String selectedList, String userInput) {
  String query = selectedList;
  String input = userInput;
  String search = '("$input" OR intitle:"$input") $query -inurl:(jsp|pl|php|html|aspx|htm|cf|shtml)';
  String encodedQuery = Uri.encodeComponent(search);
  String googleSearchUrl = 'https://www.google.com/search?q=$encodedQuery';
  urlLaunch(googleSearchUrl);
}
