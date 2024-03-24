import 'dart:math' show Random;

import 'package:collection/collection.dart' show IterableExtension;
import 'package:diacritic/diacritic.dart' show removeDiacritics;

final _random = Random.secure();

/// A string extension.
extension StringExtension on String {
  /// Returns an anagram of this [String].
  String get anagram {
    const space = ' ';
    final words = split(space).map((word) => word.split(''));

    final letters = words.expand((word) => word).toList();
    final vowels = letters.where(_isVowel).toList()..shuffle(_random);
    final consonants = letters.whereNot(_isVowel).toList()..shuffle(_random);

    String mapLetter(String letter) =>
        (letter.isVowel ? vowels : consonants).removeAt(0);

    return words.map((word) => word.map(mapLetter).join()).join(space);
  }

  static final _wordsOnlyRegExp = RegExp('[a-z]+');

  String get _sortedLettersOnly => (_wordsOnlyRegExp
          .allMatches(removeDiacritics(toLowerCase()))
          .expand((match) => [match[0].toString()])
          .join()
          .split('')
        ..sort())
      .join();

  /// Whether this [String] is an [anagram] of [other].
  bool isAnagramOf(String other) =>
      _sortedLettersOnly == other._sortedLettersOnly;

  static bool _isVowel(String s) => s.isVowel;

  /// Whether this [String] is a vowel.
  bool get isVowel {
    if (removeDiacritics(this) case 'a' || 'e' || 'i' || 'o' || 'u') {
      return true;
    }

    return false;
  }
}
