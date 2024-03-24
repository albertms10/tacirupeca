import 'package:tacirupeca/string_extension.dart';
import 'package:test/test.dart';

void main() {
  group('StringExtension', () {
    group('.anagram', () {
      test('returns an anagram of this String', () {
        const input = 'caperucita roja';
        expect(input.anagram.isAnagramOf(input), isTrue);
      });
    });

    group('.isAnagramOf()', () {
      test('returns whether this String is an anagram of other', () {
        expect('tacirupeca jaro'.isAnagramOf('Caperucita roja'), isTrue);
        expect('tacirupēca járo'.isAnagramOf('Caperucita roja'), isTrue);

        expect('a'.isAnagramOf('Caperucita roja'), isFalse);
        expect('tacirupeca jaro'.isAnagramOf('a'), isFalse);
        expect('tacirupeca jare'.isAnagramOf('Caperucita roja'), isFalse);
      });
    });

    group('.isVowel', () {
      test('returns whether this String is a vowel', () {
        expect('a'.isVowel, isTrue);
        expect('à'.isVowel, isTrue);
        expect('e'.isVowel, isTrue);
        expect('é'.isVowel, isTrue);
        expect('i'.isVowel, isTrue);
        expect('ï'.isVowel, isTrue);
        expect('o'.isVowel, isTrue);
        expect('ô'.isVowel, isTrue);
        expect('ū'.isVowel, isTrue);

        expect('b'.isVowel, isFalse);
        expect('y'.isVowel, isFalse);
        expect('aa'.isVowel, isFalse);
      });
    });
  });
}
