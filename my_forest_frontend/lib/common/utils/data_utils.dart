import 'dart:math';

import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class DataUtils {
  static String convertDateTimeToDateString({
    required DateTime datetime,
  }) {
    return '${datetime.year}.${datetime.month.toString().padLeft(2, '0')}.${datetime.day.toString().padLeft(2, '0')}';
  }

  static String convertDateTimeToTimeString({
    required DateTime datetime,
  }) {
    return '${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}';
  }

  static String convertDateTimeToDateTimeString({
    required DateTime datetime,
  }) {
    return '${datetime.year}.${datetime.month.toString().padLeft(2, '0')}.${datetime.day.toString().padLeft(2, '0')} ${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}';
  }

  static String convertPriceToMoneyString({
    required int price,
  }) {
    final NumberFormat numberFormat = NumberFormat('###,###,###,###');

    return numberFormat.format(price);
  }

  static String convertToTotalMoney({
    required int price,
    required int sale,
  }) {
    return '${DataUtils.convertPriceToMoneyString(price: price * (100 - sale) ~/ 100)} 원';
  }

  static DateTime getRandomDateTime({
    required DateTime dividerAt,
  }) {
    return DateTime(
      dividerAt.year,
      getRandomInt(dividerNumber: dividerAt.month) + 1,
      getRandomInt(dividerNumber: dividerAt.day) + 1,
      getRandomInt(dividerNumber: 24) + 1,
      getRandomInt(dividerNumber: 60) + 1,
      getRandomInt(dividerNumber: 60) + 1,
    );
  }

  static int getRandomInt({
    required int dividerNumber,
  }) {
    final randomObj = Random();
    return randomObj.nextInt(dividerNumber);
  }

  static List<int> getRandomTwoInt({
    required int dividerNumber,
  }) {
    final randomObj = Random();
    final firstNumber = randomObj.nextInt(dividerNumber);
    int secondNumber = randomObj.nextInt(dividerNumber);

    while (firstNumber == secondNumber) {
      secondNumber = randomObj.nextInt(dividerNumber);
    }
    return [firstNumber, secondNumber];
  }

  static double getRandomDouble({
    required double min,
    required double range,
  }) {
    final randomObj = Random();
    return randomObj.nextDouble() * range + min;
  }

  static bool getRandomBool() {
    final randomObj = Random();
    return randomObj.nextBool();
  }

  static List<String> getRandomId({
    required int dividerNumber,
    required int count,
  }) {
    final randomObj = Random();

    final List<String> ids = [];

    for (int i = 0; i < count; i++) {
      ids.add(randomObj.nextInt(dividerNumber).toString());
    }

    return ids;
  }

  static List<T> getRandomShuffledList<T>(List<T> items) {
    List<T> newList = List.from(items); // 원본 리스트의 복사본 생성
    newList.shuffle(Random()); // 복사본 리스트를 랜덤으로 섞기
    return newList; // 섞인 리스트 반환
  }

  static String getUuid() {
    final uuid = Uuid();
    return uuid.v4();
  }

  static String extractNumbers(String input) {
    // 숫자만을 찾기 위한 정규 표현식
    RegExp numRegExp = RegExp(r'\d');

    // 입력된 문자열에서 모든 숫자를 찾아 하나의 문자열로 결합
    String extractedNumbers = input.splitMapJoin(numRegExp,
        onMatch: (m) => m.group(0)!, onNonMatch: (_) => '');
    return extractedNumbers;
  }
}
