import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manajemen_gudang/colors/color.dart';
import 'package:manajemen_gudang/controllers/create_controller.dart';
import 'package:manajemen_gudang/widgets/button.dart';
import 'package:manajemen_gudang/widgets/form.dart';

class CreateView extends StatelessWidget {
  const CreateView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CreateController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back, color: AppColor.text),
        ),
        title: Text(
          'Tambah Barang Gudang',
          style: TextStyle(color: AppColor.text, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primary,
        elevation: 8,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  FormFieldWidgets(
                    errorMessage: 'Nama barang perlu diisi!',
                    labelText: 'Nama Barang',
                    hintText: 'Isi nama barang',
                    controller: controller.cNama,
                  ),
                  FormFieldWidgets(
                    errorMessage: 'Stok barang perlu diisi!',
                    labelText: 'Stok Barang',
                    hintText: 'Isi stok barang',
                    controller: controller.cStok,
                  ),
                  FormFieldWidgets(
                    errorMessage: 'Kategori barang perlu diisi!',
                    labelText: 'Kategori Barang',
                    hintText: 'Isi kategori barang',
                    controller: controller.cKategori,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Obx(
                  () => CustomCreateTextButton(
                    normalText: '',
                    boldText: 'Submit',
                    buttonFunction: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.postBarang(
                          controller.cNama.text,
                          int.parse(controller.cStok.text),
                          controller.cKategori.text,
                        );
                      }
                    },
                    condition: controller.isLoading.value,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
