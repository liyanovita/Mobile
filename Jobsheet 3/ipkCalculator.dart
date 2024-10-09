import 'dart:io';

class MataKuliah {
  String nama;
  int sks;
  String nilaiHuruf;
  double nilaiAngka;

  MataKuliah(this.nama, this.sks, this.nilaiHuruf)
      : nilaiAngka = konversiNilai(nilaiHuruf);

  static double konversiNilai(String huruf) {
    switch (huruf.toUpperCase()) {
      case 'A':
        return 4.0;
      case 'B':
        return 3.0;
      case 'C':
        return 2.0;
      case 'D':
        return 1.0;
      case 'E':
        return 0.0;
      default:
        return -1.0; // Penanda untuk input salah
    }
  }
}


class Semester {
  int nomor;
  List<MataKuliah> mataKuliahs = [];

  Semester(this.nomor);

  void tambahMataKuliah(MataKuliah mk) {
    mataKuliahs.add(mk);
  }

  int totalSKS() {
    return mataKuliahs.fold(0, (total, mk) => total + mk.sks);
  }

  double hitungNR() {
    double totalNilai = 0;
    int totalSKS = 0;
    for (var mk in mataKuliahs) {
      totalNilai += mk.nilaiAngka * mk.sks;
      totalSKS += mk.sks;
    }
    return totalSKS > 0 ? totalNilai / totalSKS : 0;
  }

  void tampilkanMataKuliah() {
    for (var mk in mataKuliahs) {
      print("${mk.nama.padRight(20)} ${mk.sks} ${mk.nilaiHuruf}");
    }
  }
}

void main() {
  print("==============================================");
  print(" Program Menghitung IPK Mahasiswa");
  print("==============================================");

  int jumlahSemester = mintaInputJumlahSemester();
  List<Semester> semesters = [];

  for (int i = 1; i <= jumlahSemester; i++) {
    Semester semester = Semester(i);
    print("--------------------------------------------");
    print("Masukkan jumlah mata kuliah semester $i:");
    int jumlahMataKuliah = mintaInputJumlahMataKuliah();

    for (int j = 1; j <= jumlahMataKuliah; j++) {
      print("Masukkan mata kuliah ke $j:");
      print("Masukkan nama matkul:");
      String nama = stdin.readLineSync()!;
      print("Masukkan jumlah sks matkul:");
      int sks = mintaInputSKS();
      String nilaiHuruf = mintaInputNilaiHuruf();

      MataKuliah mk = MataKuliah(nama, sks, nilaiHuruf);
      semester.tambahMataKuliah(mk);
    }

    semesters.add(semester);
  }

  tampilkanTranskrip(semesters);
}

int mintaInputJumlahSemester() {
  while (true) {
    stdout.write("Masukkan jumlah semester: ");
    int? jumlahSemester = int.tryParse(stdin.readLineSync()!);
    if (jumlahSemester != null && jumlahSemester >= 2 && jumlahSemester <= 14) {
      return jumlahSemester;
    }
    print("Jumlah semester tidak valid, masukkan angka antara 2 hingga 14.");
  }
}

int mintaInputJumlahMataKuliah() {
  while (true) {
    stdout.write("Masukkan jumlah mata kuliah: ");
    int? jumlahMataKuliah = int.tryParse(stdin.readLineSync()!);
    if (jumlahMataKuliah != null && jumlahMataKuliah >= 2) {
      return jumlahMataKuliah;
    }
    print("Jumlah mata kuliah minimal 2.");
  }
}

int mintaInputSKS() {
  while (true) {
    stdout.write("Masukkan jumlah SKS: ");
    int? sks = int.tryParse(stdin.readLineSync()!);
    if (sks != null && sks > 0 && sks <= 24) {
      return sks;
    }
    print("Jumlah SKS tidak valid, masukkan angka antara 1 hingga 24.");
  }
}

String mintaInputNilaiHuruf() {
  while (true) {
    stdout.write("Masukkan nilai matkul (A/B/C/D/E): ");
    String nilaiHuruf = stdin.readLineSync()!.toUpperCase();
    if (['A', 'B', 'C', 'D', 'E'].contains(nilaiHuruf)) {
      return nilaiHuruf;
    }
    print("Nilai huruf tidak valid. Masukkan antara A hingga E.");
  }
}

void tampilkanTranskrip(List<Semester> semesters) {
  print("==============================================");
  print(" Transkrip Nilai");
  print("==============================================");

  int totalSKS = 0;
  double totalNilai = 0;

  for (var semester in semesters) {
    print("Hasil Semester ${semester.nomor}:");
    print("Mata Kuliah           SKS  Nilai");
    semester.tampilkanMataKuliah();
    int semesterSKS = semester.totalSKS();
    double NR = semester.hitungNR();
    print("SKS : $semesterSKS");
    print("NR  : ${NR.toStringAsFixed(2)}");
    print("--------------------------------------------");
    totalSKS += semesterSKS;
    totalNilai += NR * semesterSKS;
  }

  double IPK = totalSKS > 0 ? totalNilai / totalSKS : 0;
  print("Total SKS : $totalSKS");
  print("IPK : ${IPK.toStringAsFixed(2)}");
  print("==============================================");
}
