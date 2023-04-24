import 'package:profanity_filter/profanity_filter.dart';

void main() {
  //Create the filter with the default constructor.
  //The default constructor uses the default list of words provided by [LDNOOBW on GitHub](
  //https://github.com/LDNOOBW/List-of-Dirty-Naughty-Obscene-and-Otherwise-Bad-Words)
  //Other constructors are available, see [README.md](https://pub.dev/packages/profanity_filter).
  final filter = ProfanityFilter();

  //These strings contains the profanities 'ass' in two languages
  tryProfanityFilter("(EN) You are an ass", filter);
  tryProfanityFilter("(SV) Du är en röv", filter);
  tryProfanityFilter("(EN & SV) Din röv is an ass", filter);
}

void tryProfanityFilter(String text, ProfanityFilter filter) {
  //Check for profanity - returns a boolean (true if profanity is present)
  bool hasProfanity = filter.hasProfanity(text);
  print('The string $text has profanity: $hasProfanity');

  //Get the profanity used - returns a List<String>
  List<String> wordsFound = filter.getAllProfanity(text);
  print('The string contains the words: $wordsFound');

  //Censor the string - returns a 'cleaned' string.
  String cleanString = filter.censor(text);
  print('Censored version of "$text" is "$cleanString"\n');
}
