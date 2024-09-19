void main() {
  // Bagian pertama dari kode
  String test = "test2";
  if (test == "test1") {
    print("Test1");
  } else if (test == "test2") {
    print("Test2");
  } else {
    print("Something else");
  }

  if (test == "test2") {
    print("Test2 again");
  }

  // Bagian kedua dari kode, diperbaiki
  String test2 = "true";  // Mengganti nama variabel untuk menghindari konflik
  if (test2 == "true") {
    print("Kebenaran");
  }
}
