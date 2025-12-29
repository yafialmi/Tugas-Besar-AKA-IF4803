import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajemen_gudang/colors/color.dart';

class CreateController extends GetxController {
  final cNama = TextEditingController();
  final cStok = TextEditingController();
  final cKategori = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  Future<void> postBarang(
    String namaBarang,
    int stokBarang,
    String kategoriBarang,
  ) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance
          .collection('barang')
          .add({
            'nama_barang': namaBarang,
            'stok_barang': stokBarang,
            'kategori_barang': kategoriBarang,
            'created_at': FieldValue.serverTimestamp(),
          })
          .whenComplete(
            () => Get.snackbar(
              "Berhasil!",
              "Barang telah ditambahkan!",
              backgroundColor: AppColor.success,
              colorText: AppColor.text,
              isDismissible: true,
              margin: EdgeInsets.all(12),
              snackPosition: SnackPosition.BOTTOM,
            ),
          );
    } catch (error) {
      Get.snackbar(
        "Gagal!",
        error.toString(),
        backgroundColor: AppColor.danger,
        colorText: AppColor.text,
        isDismissible: true,
        margin: EdgeInsets.all(12),
        snackPosition: SnackPosition.BOTTOM,
      );
      throw Exception(error);
    } finally {
      isLoading.value = false;
      Get.offNamed('/dashboard');
    }
  }

  Future<void> seedBarang100() async {
    try {
      isLoading.value = true;

      final firestore = FirebaseFirestore.instance;
      final batch = firestore.batch();
      final barangRef = firestore.collection('barang');

      final Map<String, List<String>> kategoriBarang = {
        'A': ['AC', 'Air Purifier'],
        'B': ['Baterai AA', 'Bluetooth Speaker'],
        'C': ['Charger Laptop', 'Camera Digital'],
        'D': ['Drone Mini', 'Desk Lamp'],
        'E': ['Earphone', 'External HDD'],
        'F': ['Flashdisk', 'Fan Portable'],
        'G': ['Gaming Mouse', 'GPU Stand'],
        'H': ['Headset', 'Hub USB'],
        'I': ['Ink Printer', 'IP Camera'],
        'J': ['Joystick', 'Jam Digital'],
        'K': ['Keyboard Mechanical', 'Kipas Angin'],
        'L': ['Laptop', 'LED Monitor'],
        'M': ['Mouse Wireless', 'Microphone'],
        'N': ['Notebook', 'Network Switch'],
        'O': ['Office Chair', 'OTG Adapter'],
        'P': ['Power Bank', 'Printer'],
        'Q': ['Quick Charger', 'QLED TV'],
        'R': ['Router WiFi', 'RAM Laptop'],
        'S': ['SSD NVMe', 'Smartwatch'],
        'T': ['Tablet', 'Tripod'],
        'U': ['USB Cable', 'UPS'],
        'V': ['VGA Cable', 'VR Headset'],
        'W': ['Webcam', 'Wireless Adapter'],
        'X': ['Xiaomi Smart Band', 'XLR Cable'],
        'Y': ['Yoga Laptop Stand', 'Yubikey'],
        'Z': ['Zipper Bag', 'Zoom Camera'],
      };

      final kategoriKeys = kategoriBarang.keys.toList();

      for (int i = 0; i < 100; i++) {
        final kategori = kategoriKeys[i % kategoriKeys.length];
        final namaList = kategoriBarang[kategori]!;

        final namaBarang = namaList[i % namaList.length];

        final doc = barangRef.doc();

        batch.set(doc, {
          'nama_barang': '$namaBarang Series ${i + 1}',
          'stok_barang': (i % 20) + 1, 
          'kategori_barang': kategori,
          'created_at': FieldValue.serverTimestamp(),
        });
      }

      await batch.commit();

      Get.snackbar(
        "Sukses",
        "100 data barang berhasil ditambahkan",
        backgroundColor: AppColor.success,
        colorText: AppColor.text,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(12),
      );
    } catch (e) {
      Get.snackbar(
        "Gagal",
        e.toString(),
        backgroundColor: AppColor.danger,
        colorText: AppColor.text,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(12),
      );
    } finally {
      isLoading.value = false;
      Get.offNamed('/dashboard');
    }
  }
Future<void> seedBarang1000() async {
  try {
    isLoading.value = true;

    final firestore = FirebaseFirestore.instance;
    final batch = firestore.batch();
    final barangRef = firestore.collection('barang');

    final Map<String, List<String>> kategoriBarang = {
      'A': ['AC', 'Air Purifier'],
      'B': ['Baterai AA', 'Bluetooth Speaker'],
      'C': ['Charger Laptop', 'Camera Digital'],
      'D': ['Drone Mini', 'Desk Lamp'],
      'E': ['Earphone', 'External HDD'],
      'F': ['Flashdisk', 'Fan Portable'],
      'G': ['Gaming Mouse', 'GPU Stand'],
      'H': ['Headset', 'Hub USB'],
      'I': ['Ink Printer', 'IP Camera'],
      'J': ['Joystick', 'Jam Digital'],
      'K': ['Keyboard Mechanical', 'Kipas Angin'],
      'L': ['Laptop', 'LED Monitor'],
      'M': ['Mouse Wireless', 'Microphone'],
      'N': ['Notebook', 'Network Switch'],
      'O': ['Office Chair', 'OTG Adapter'],
      'P': ['Power Bank', 'Printer'],
      'Q': ['Quick Charger', 'QLED TV'],
      'R': ['Router WiFi', 'RAM Laptop'],
      'S': ['SSD NVMe', 'Smartwatch'],
      'T': ['Tablet', 'Tripod'],
      'U': ['USB Cable', 'UPS'],
      'V': ['VGA Cable', 'VR Headset'],
      'W': ['Webcam', 'Wireless Adapter'],
      'X': ['Xiaomi Smart Band', 'XLR Cable'],
      'Y': ['Yoga Laptop Stand', 'Yubikey'],
      'Z': ['Zipper Bag', 'Zoom Camera'],
    };

    final kategoriKeys = kategoriBarang.keys.toList();

    for (int i = 0; i < 1000; i++) {
      final kategori = kategoriKeys[i % kategoriKeys.length];
      final namaList = kategoriBarang[kategori]!;

      final namaBarang = namaList[i % namaList.length];

      final doc = barangRef.doc();

      batch.set(doc, {
        'nama_barang': '$namaBarang Series ${i + 1}',
        'stok_barang': (i % 20) + 1, 
        'kategori_barang': kategori,
        'created_at': FieldValue.serverTimestamp(),
      });
    }

    await batch.commit();

    Get.snackbar(
      "Sukses",
      "100 data barang berhasil ditambahkan",
      backgroundColor: AppColor.success,
      colorText: AppColor.text,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(12),
    );
  } catch (e) {
    Get.snackbar(
      "Gagal",
      e.toString(),
      backgroundColor: AppColor.danger,
      colorText: AppColor.text,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(12),
    );
  } finally {
    isLoading.value = false;
    Get.offNamed('/dashboard');
  }
}

}
