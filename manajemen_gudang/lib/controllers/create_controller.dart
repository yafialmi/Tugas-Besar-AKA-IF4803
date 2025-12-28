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
}
