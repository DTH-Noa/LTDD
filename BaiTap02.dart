//BaiTap02.dart
//Giải pt bậc 2: ax^2+bx+c=0;

import 'dart:io';
import 'dart:math';

void main() {
  double? a, b, c;

  //Nhập số a
  do {
    stdout.write('Nhập hệ số a (a khác 0): ');
    a = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
    if (a == 0) {
      print('Giá trị nhập không hợp lệ. Vui lòng nhập lại');
    }
  } while (a == 0);

  //Nhập số b
  do {
    stdout.write('Nhập hệ số b: ');
    String? input = stdin.readLineSync();
    b = double.tryParse(input ?? '');
    if (b == null) {
      print('Giá trị nhập không hợp lệ. Vui lòng nhập lại');
    }
  } while (b == null);

  //Nhập số c
  do {
    stdout.write('Nhập hệ số c: ');
    String? input = stdin.readLineSync();
    c = double.tryParse(input ?? '');
    if (c == null) {
      print('Giá trị nhập không hợp lệ. Vui lòng nhập lại');
    }
  } while (c == null);

  // Tính delta
  double delta = b * b - 4 * a * c;

  //Tìm nghiệm phương trình
  if (delta < 0) {
    print('Phương trình vô nghiệm');
  } else if (delta == 0) {
    var x = -b / 2 * a;
    print('Phương trình có nghiệm kém x = $x');
  } else {
    var x1 = (-b + sqrt(delta)) / 2 * a;
    var x2 = (-b - sqrt(delta)) / 2 * a;
    print('Phương trình có 2 nghiệm x1 = $x1 và x2 = $x2');
  }
}
