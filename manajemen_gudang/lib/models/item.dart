import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  final String id;
  final String nama;
  final String kategori;
  final int stok;
  final Timestamp createdAt;

  ItemModel({
    required this.id,
    required this.nama,
    required this.kategori,
    required this.stok,
    required this.createdAt
  });

  factory ItemModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ItemModel(
      id: doc.id,
      nama: data['nama_barang'] ?? '',
      stok: data['stok_barang'] ?? '',
      kategori: data['kategori_barang'] ?? '',
      createdAt: data['created_at'] ?? Timestamp.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nama_barang': nama,
      'stok_barang': stok,
      'kategori_barang' : kategori,
      'created_at': createdAt,
    };
  }
}
