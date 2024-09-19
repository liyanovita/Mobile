void main() {
  int counter = 0;  // Inisialisasi variabel counter

  // Perulangan while, berjalan selama counter kurang dari 33
  while (counter < 33) {
    print(counter);  // Cetak nilai counter
    counter++;       // Tambah nilai counter dengan 1
  }

  // Perulangan do-while, dimulai setelah while berhenti
  do {
    print(counter);  // Cetak nilai counter
    counter++;       // Tambah nilai counter dengan 1
  } while (counter < 77);  // Perulangan berhenti saat counter mencapai 77
}
