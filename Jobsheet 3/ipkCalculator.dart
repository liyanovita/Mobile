import 'dart:io';

void main() {
  print("==============================================");
  print(" Program Menghitung IPK Mahasiswa");
  print("==============================================");

  // Meminta input jumlah semester
  int jumlahSemester = 0;
  while (jumlahSemester < 2 || jumlahSemester > 14) {
    stdout.write("Masukkan jumlah semester (min. 2, maks. 14): ");
    String? input = stdin.readLineSync();
    jumlahSemester = int.tryParse(input ?? '') ?? 0;
    if (jumlahSemester < 2 || jumlahSemester > 14) {
      print("Jumlah semester harus antara 2 hingga 14.");
    }
  }

  double totalNilai = 0;
  int totalSKS = 0;
  List<String> transkrip = [];

  for (int semester = 1; semester <= jumlahSemester; semester++) {
    print("--------------------------------------------");
    print("Masukkan jumlah mata kuliah semester $semester:");
    
    int jumlahMatkul = 0;
    while (jumlahMatkul < 2) {
      stdout.write("Masukkan jumlah mata kuliah (min. 2): ");
      String? input = stdin.readLineSync();
      jumlahMatkul = int.tryParse(input ?? '') ?? 0;
      if (jumlahMatkul < 2) {
        print("Jumlah mata kuliah harus minimal 2.");
      }
    }

    int totalSKSSemester = 0;
    double totalNilaiSemester = 0;

    transkrip.add("Hasil Semester $semester:");
    for (int i = 1; i <= jumlahMatkul; i++) {
      print("Masukkan mata kuliah ke $i");
      stdout.write("Masukkan nama matkul: ");
      String? namaMatkul = stdin.readLineSync();

      int sks = 0;
      while (sks < 1 || sks > 24) {
        stdout.write("Masukkan jumlah SKS matkul (1 - 24): ");
        String? input = stdin.readLineSync();
        sks = int.tryParse(input ?? '') ?? 0;
        if (sks < 1 || sks > 24) {
          print("Jumlah SKS harus antara 1 hingga 24.");
        }
      }

      String nilaiHuruf = '';
      while (!["A", "B", "C", "D", "E"].contains(nilaiHuruf)) {
        stdout.write("Masukkan nilai matkul (A/B/C/D/E): ");
        nilaiHuruf = (stdin.readLineSync() ?? '').toUpperCase().trim(); // Tambahkan pengolahan nilai input
        if (!["A", "B", "C", "D", "E"].contains(nilaiHuruf)) {
          print("Nilai huruf harus antara A hingga E.");
        }
      }

      double nilaiAngka;
      switch (nilaiHuruf) {
        case "A":
          nilaiAngka = 4;
          break;
        case "B":
          nilaiAngka = 3;
          break;
        case "C":
          nilaiAngka = 2;
          break;
        case "D":
          nilaiAngka = 1;
          break;
        default:
          nilaiAngka = 0;
      }

      totalNilaiSemester += nilaiAngka * sks;
      totalSKSSemester += sks;

      // Menyimpan mata kuliah ke dalam transkrip
      transkrip.add("$namaMatkul - SKS: $sks, Nilai: $nilaiHuruf");
    }

    // Menghitung NR (Nilai Rata-rata Semester)
    double nrSemester = totalNilaiSemester / totalSKSSemester;
    transkrip.add("SKS: $totalSKSSemester, NR: ${nrSemester.toStringAsFixed(2)}\n");

    totalNilai += totalNilaiSemester;
    totalSKS += totalSKSSemester;
  }

  // Menghitung IPK (Indeks Prestasi Kumulatif)
  double ipk = totalNilai / totalSKS;

  // Menampilkan transkrip
  print("==============================================");
  print(" Transkrip Nilai");
  print("==============================================");
  for (String line in transkrip) {
    print(line);
  }
  print("Total SKS: $totalSKS");
  print("IPK: ${ipk.toStringAsFixed(2)}");
  print("==============================================");
}
