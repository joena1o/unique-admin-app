// ignore: avoid_web_libraries_in_flutter
//import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
//import 'dart:html' as html;
//import 'dart:typed_data';
//import 'package:flutter/foundation.dart';
//import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_storage/firebase_storage.dart';
import 'package:unique_admin_application/data/model/product_model.dart';

class ProductRepository {
  // Future<List<String>?> uploadFilesToFirebase(List<html.File> files) async {
  //   try {
  //     List<String> downloadUrls = [];
  //     for (html.File file in files) {
  //       // Create a reference for each file in Firebase Storage
  //       final storageRef = FirebaseStorage.instance
  //           .ref()
  //           .child('uploads/${DateTime.now().toIso8601String()}_${file.name}');
  //       // Upload the file
  //       final uploadTask = storageRef.putBlob(file);
  //       // Wait for the upload to complete and get the download URL
  //       await uploadTask.whenComplete(() => null);
  //       final downloadUrl = await storageRef.getDownloadURL();
  //       downloadUrls.add(downloadUrl); // Add the URL to the list
  //     }
  //     return downloadUrls; // Return the list of URLs
  //   } catch (e) {
  //     print(e);
  //     return null;
  //   }
  // }

  // Future<List<String>> uploadHtmlFilesToCloudinary(
  //     List<html.File> files) async {
  //   const cloudName = 'davdtfcxd'; // Replace with your Cloudinary cloud name
  //   const uploadPreset =
  //       'hw1orvnz'; // Replace with your Cloudinary upload preset

  //   List<String> uploadedUrls = [];

  //   for (html.File file in files) {
  //     try {
  //       final reader = html.FileReader();
  //       reader.readAsDataUrl(file);
  //       await reader.onLoad.first;

  //       final Uint8List fileBytes = reader.result as Uint8List;

  //       // Prepare the upload
  //       final url = Uri.parse(
  //           'https://api.cloudinary.com/v1_1/$cloudName/image/upload');

  //       final request = http.MultipartRequest('POST', url);
  //       request.fields['upload_preset'] = uploadPreset;

  //       // Attach file
  //       request.files.add(http.MultipartFile.fromBytes(
  //         'file',
  //         fileBytes,
  //         filename: file.name,
  //       ));

  //       final response = await request.send();
  //       if (response.statusCode == 200) {
  //         final responseData = await http.Response.fromStream(response);
  //         final decodedData = json.decode(responseData.body);
  //         uploadedUrls.add(decodedData['secure_url']);
  //       } else {
  //         print('Failed to upload file: ${response.statusCode}');
  //       }
  //     } catch (e) {
  //       print('Error uploading file: $e');
  //     }
  //   }

  //   return uploadedUrls;
  // }

  Future<dynamic> createProducts(Map<String, dynamic> body) async {
    try {
      DocumentReference<Map<String, dynamic>> result =
          await FirebaseFirestore.instance.collection('products').add(body);
      return result;
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> createCategory(String category) async {
    try {
      DocumentReference<Map<String, dynamic>> docRef =
          FirebaseFirestore.instance.collection('categories').doc();
      Map<String, dynamic> body = {
        "id": docRef.id,
        "Category": category,
        "Date": FieldValue
            .serverTimestamp(), // Firestore server-generated timestamp
      };
      final result = await docRef.set(body);
      return result;
    } catch (e) {
      return e;
    }
  }

  Future<List<ProductModel>?> fetchProducts() async {
    try {
      QuerySnapshot result =
          await FirebaseFirestore.instance.collection('products').get();
      final products = result.docs
          .map((e) => ProductModel.fromJson(e.data() as Map<String, dynamic>))
          .toList();
      return products;
    } catch (e) {
      return null;
    }
  }

  Future<List<String>?> fetchCatgories() async {
    try {
      QuerySnapshot result =
          await FirebaseFirestore.instance.collection('categories').get();
      final List<String> categories = result.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return data['category']
            .toString(); // Safely convert to String or use a default value
      }).toList();
      return categories;
    } catch (e) {
      return null;
    }
  }
}
