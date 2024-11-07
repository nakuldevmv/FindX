import 'package:findx/Functions/launch_url.dart';

googleQueryGen(String x) {
  String query = x;

  // Encode the full query for use in a URL
  String encodedQuery = Uri.encodeComponent(query);

  // Construct the final Google search URL
  String googleSearchUrl = 'https://www.google.com/search?q=$encodedQuery';
  urlLaunch(googleSearchUrl);
}
