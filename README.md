# Manajemen Gudang (IF4803)

**Prasyarat**

**Menjalankan aplikasi (singkat)**
1. Jalankan `flutter pub get`
2. Jalankan di perangkat/emulator: `flutter run`

**Catatan teknis**


- Lihat `pubspec.yaml` untuk dependensi dan versi paket.
---
# Manajemen Gudang (IF4803)

Dokumentasi proyek aplikasi manajemen gudang yang dibangun dengan Flutter. Dokumentasi ini menjelaskan tujuan, arsitektur, struktur kode pada folder aplikasi, langkah setup dan pengembangan.

**Tujuan Proyek**
- Aplikasi sederhana untuk manajemen inventaris gudang: menambah item, melihat dashboard stok, dan integrasi dasar dengan Firebase untuk penyimpanan data.

**Fitur Utama**
- Menambah / mengedit item gudang
- Tampilan dashboard untuk ringkasan stok
- Splashscreen dan routing antar halaman
- Integrasi Firebase untuk penyimpanan dan autentikasi (opsional)

**Arsitektur & Pola**
- Aplikasi terstruktur pada pemisahan tanggung jawab: `models` (data), `controllers` (logika bisnis/state), `pages` (UI layar), `widgets` (komponen ulang pakai).

**Struktur berkas penting**
- Aplikasi utama berada di [manajemen_gudang/lib](manajemen_gudang/lib).
	- [manajemen_gudang/lib/main.dart](manajemen_gudang/lib/main.dart): titik masuk aplikasi; inisialisasi Firebase, tema, dan konfigurasi routing.
	- [manajemen_gudang/lib/firebase_options.dart](manajemen_gudang/lib/firebase_options.dart): konfigurasi Firebase yang dihasilkan untuk platform proyek.
	- [manajemen_gudang/lib/colors/color.dart](manajemen_gudang/lib/colors/color.dart): definisi warna/tema aplikasi.
	- [manajemen_gudang/lib/controllers](manajemen_gudang/lib/controllers): logika aplikasi dan pengelola state. Contoh: `create_controller.dart`, `dashboard_controller.dart`.
	- [manajemen_gudang/lib/models/item.dart](manajemen_gudang/lib/models/item.dart): model data utama untuk item gudang.
	- [manajemen_gudang/lib/pages](manajemen_gudang/lib/pages): layar aplikasi, tersusun dalam subfolder (`create/`, `dashboard/`, `splashscreen/`).
	- [manajemen_gudang/lib/routes](manajemen_gudang/lib/routes): penentuan rute dan navigator aplikasi.
	- [manajemen_gudang/lib/widgets](manajemen_gudang/lib/widgets): komponen UI yang dapat digunakan ulang di beberapa halaman.

**Persiapan & Setup Lokal**
1. Instal Flutter SDK sesuai versi proyek. Periksa [manajemen_gudang/pubspec.yaml](manajemen_gudang/pubspec.yaml) untuk versi minimal Dart/Flutter dan dependensi.
2. Buka terminal pada folder `manajemen_gudang`:

```bash
cd manajemen_gudang
flutter pub get
```

3. Jalankan pada emulator atau perangkat:

```bash
flutter run
```

**Konfigurasi Firebase**
- File konfigurasi yang dihasilkan ada di [manajemen_gudang/lib/firebase_options.dart](manajemen_gudang/lib/firebase_options.dart) dan `manajemen_gudang/android/app/google-services.json` untuk Android.
- Jika perlu menghubungkan ulang Firebase untuk lingkungan lain, jalankan Firebase CLI atau ulang buat konfigurasi menggunakan Firebase console dan update file konfigurasi.

**Pengembangan & Debugging**
- Gunakan `flutter run --debug` untuk debug interaktif.
- Untuk perubahan pada state atau controller, periksa file di [manajemen_gudang/lib/controllers](manajemen_gudang/lib/controllers).
- Unit test ada di folder `manajemen_gudang/test` (jika ada). Jalankan:

```bash
flutter test
```

**Panduan Kontribusi**
- Buat branch fitur: `git checkout -b feat/nama-fitur`.
- Sertakan deskripsi perubahan di commit dan PR.
- Tambahkan test untuk logika baru bila memungkinkan.

**Troubleshooting Umum**
- Error dependensi: jalankan `flutter pub cache repair` atau hapus `pubspec.lock` lalu `flutter pub get`.
- Masalah Firebase: pastikan `google-services.json` (Android) atau `GoogleService-Info.plist` (iOS) berada di lokasi yang benar.

---
Dokumentasi ini dihasilkan otomatis berdasarkan struktur `manajemen_gudang/lib`. Untuk dokumentasi lebih rinci (API, flow UI, atau diagram arsitektur), beri tahu bagian yang ingin Anda perluas.