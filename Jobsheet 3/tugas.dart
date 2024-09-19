void main() {
  String name = "Liya Novitasari";
  String nim = "2241760006";

  // Fungsi untuk memeriksa apakah sebuah angka adalah bilangan prima
  bool isPrime(int number) {
    if (number <= 1) return false;  // Angka 0 dan 1 bukan bilangan prima
    if (number == 2) return true;   // 2 adalah bilangan prima
    if (number % 2 == 0) return false; // Angka genap lebih besar dari 2 bukan bilangan prima

    // Periksa faktor-faktor dari 3 hingga akar kuadrat dari number
    for (int i = 3; i * i <= number; i += 2) {
      if (number % i == 0) return false;
    }
    return true;
  }

  // Loop untuk memeriksa angka dari 0 sampai 201
  for (int i = 0; i <= 201; i++) {
    if (isPrime(i)) {
      print("$i: $name, $nim");
    }
  }
}
