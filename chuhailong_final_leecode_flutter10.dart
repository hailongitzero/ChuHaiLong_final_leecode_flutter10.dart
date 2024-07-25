void main() {
  List<List<int>> matrix = [
    [1, 2, 3, 4],
    [4, 2, 6, 5],
    [7, 8, 9, 6],
    [2, 3, 4, 7]
  ];
  print(crossMatrix(matrix));
  int minStep = beautyArray([7, 8, 9, 6, 1]);
  print('số thao tác ít nhất để có mãng số đẹp là: $minStep');
  print('Flag: ${numberOfTreeFlag([1, 1, 1, 2, 1])}');
  print('Start time: ${startTime(12, 11)}');
  print(shipCount([7, 8, 9, 6, 1, 2, 5], 7));
}

//Bai 1
String crossMatrix(List<List<int>> matrix) {
  int min = matrix.length > matrix[0].length ? matrix[0].length : matrix.length;
  bool hasIntersec = min % 2 != 0 ? true : false;
  print('$min -- $hasIntersec');
  if (hasIntersec) {
    if (isPrime(matrix[(min ~/ 2)][(min ~/ 2)])) {
      return 'Ma trận có giao điểm, giao điểm là số nguyên: ${matrix[(min ~/ 2)][(min ~/ 2)]}';
    } else {
      return 'Ma trận có giao điểm, giao điểm không phải là số nguyên: ${matrix[(min ~/ 2)][(min ~/ 2)]}';
    }
  } else {
    int total = 0;
    for (int i = 0; i < min; i++) {
      if (matrix[i][i] % 2 == 0) {
        total += matrix[i][i];
      }
    }
    return 'Ma trận không có giao điểm, tổng số chẵn trên đường chéo chính là: $total';
  }
}

isPrime(int n) {
  for (var i = 2; i <= n / i; ++i) {
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}

//Bai 2
beautyArray(List<int> arr) {
  int evenCnt = 0;
  int oddCnt = 0;
  for (int i = 0; i < arr.length; i++) {
    if (i % 2 == 0) {
      evenCnt++;
    } else {
      oddCnt++;
    }
  }
  return evenCnt < oddCnt ? evenCnt : oddCnt;
}

// Bai 3
numberOfTreeFlag(List<int> trees) {
  int minCnt = 1;
  int minTree = trees[0];
  int maxCnt = 0;
  int maxTree = trees[0];
  for (int i = 1; i < trees.length; i++) {
    if (trees[i] < minTree) {
      minTree = trees[i];
      minCnt = 1;
    } else if (trees[i] == minTree) {
      minCnt++;
    } else if (trees[i] > maxTree) {
      maxTree = trees[i];
      maxCnt = 1;
    } else if (trees[i] == maxTree) {
      maxCnt++;
    }
  }
  return minCnt + maxCnt;
}

//Bai 4
startTime(int a, int b) {
  return a + b > 24 ? (a + b) % 24 : a + b;
}

//Bai 5
shipCount(List<int> people, int limit) {
  people.sort();
  int shipCnt = 0;
  for (int i = 0; i < people.length - 1; i++) {
    for (int j = people.length - 1; j >= i; j--) {
      if (i == j) {
        people = people.sublist(shipCnt);
        break;
      }
      if (people[i] + people[j] <= limit) {
        shipCnt++;
        people.remove(people[j]);
        break;
      }
    }
  }
  return people.length + shipCnt;
}
