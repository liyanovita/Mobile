void main() {
  for (int index = 10; index < 27; index++) {
    if (index == 21) {
      break;  // Keluar dari loop jika index sama dengan 21
    } else if (index > 1 && index < 7) {
      continue;  // Lewati iterasi jika index lebih besar dari 1 dan kurang dari 7
    }
    print(index);  // Cetak nilai index jika kondisi di atas tidak terpenuhi
  }
}
