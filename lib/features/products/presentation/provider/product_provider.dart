// ignore: avoid_web_libraries_in_flutter
//import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:unique_admin_application/core/config/get_it_setup.dart';
import 'package:unique_admin_application/data/model/product_model.dart';
import 'package:unique_admin_application/data/repository/product_repository.dart';
import 'package:unique_admin_application/helper/exception_handler.dart';
import 'package:unique_admin_application/utils/dialog_services.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepository productRepository;
  ProductProvider({required this.productRepository});

  List<ProductModel> products = [];
  List<ProductModel> get getProducts => products;

  List<String>? categories = [];
  List<String>? get getCategories => categories;

  TextEditingController categoryName = TextEditingController();

  bool uploadingProduct = false;
  bool fetchingProduct = false;

  // void addProduct(ProductModel productModel, List<html.File> files,
  //     Function callback) async {
  //   uploadingProduct = true;
  //   notifyListeners();
  //   try {
  //     await productRepository.createProducts(productModel.toJson());
  //     getIt<DialogServices>()
  //         .showMessage("Product has been added successfully");
  //     callback();
  //   } catch (e) {
  //     final errorMessage = handleExceptionWithMessage(e);
  //     getIt<DialogServices>().showMessageError(errorMessage);
  //   } finally {
  //     uploadingProduct = false;
  //   }
  //   notifyListeners();
  // }

  void fetchProducts() async {
    fetchingProduct = true;
    try {
      await productRepository.fetchProducts();
    } catch (e) {
      final errorMessage = handleExceptionWithMessage(e);
      getIt<DialogServices>().showMessageError(errorMessage);
    } finally {
      fetchingProduct = false;
    }
    notifyListeners();
  }

  void fetchCategories() async {
    fetchingProduct = true;
    try {
      categories = await productRepository.fetchCatgories();
    } catch (e) {
      final errorMessage = handleExceptionWithMessage(e);
      getIt<DialogServices>().showMessageError(errorMessage);
    } finally {
      fetchingProduct = false;
    }
    notifyListeners();
  }

  void addCategory(String category, Function callback) async {
    uploadingProduct = true;
    notifyListeners();
    try {
      await productRepository.createCategory(category);
      getIt<DialogServices>()
          .showMessage("Category has been added successfully");
      callback();
    } catch (e) {
      final errorMessage = handleExceptionWithMessage(e);
      getIt<DialogServices>().showMessageError(errorMessage);
    } finally {
      uploadingProduct = false;
    }
    notifyListeners();
  }
}
