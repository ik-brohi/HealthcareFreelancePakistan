/*

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/models/transactionModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class transactionProvider with ChangeNotifier{
  List<TransactionModel> transactionList = [];
  List<TransactionModel> newList = [];
  int count = 0;
  CollectionReference<Map<String, dynamic>> transactioQuery = FirebaseFirestore.instance.collection("transaction");

  void addTransactionData(String title, String sender, int receiver,
      int amount,) async {
    await FirebaseFirestore.instance
        .collection("transaction")
        .doc(FirebaseAuth.instance.currentUser?.uid!)
        .set({
      "cartname": cartName,
      "cartImage": cartImage,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
      "isAdded": true
    });
    notifyListeners();
  }

  void updateCartData(String cartName, String cartImage, int cartPrice,
      int cartQuantity) async {
    await FirebaseFirestore.instance
        .collection("cart")
        .doc(FirebaseAuth.instance.currentUser?.uid!)
        .collection("yourCart")
        .doc(cartName)
        .update({
      "cartname": cartName,
      "cartImage": cartImage,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
      "isAdded": true
    });
    notifyListeners();
  }

  void getCartData() async {
    List<TransactionModel> newList = [];

    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("transaction")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("yourCart")
        .get();

    reviewCartValue.docs.forEach((element) {
      TransactionModel reviewCartModel = TransactionModel(
        title: element.get("title"),
        sender: element.get("sender"),
        receiver: element.get("receiver"),
        amount: element.get("amount"),
        date: DateTime.now(),
        status: element.get("status"),
      );
      newList.add(reviewCartModel);
      //  print("in get cart data${newList.length}");
    });
    cartDataList = newList;
    notifyListeners();
  }

  getTotalPrice() {
    double total = 0.0;
    cartDataList.forEach((element) {
      total += element.cartPrice * element.cartQuantity;
    });
    return total;
  }

  List<TransactionModel> get cartData {
    return cartDataList;
  }

  deleteTransactioData(cartName) {
    print("deleting");
    FirebaseFirestore.instance
        .collection("cart")
        .doc(FirebaseAuth.instance.currentUser?.uid!)
        .collection("yourCart")
        .doc(cartName)
        .delete();
    notifyListeners();
  }

  */
/* getCartDataFromFood() async {
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("cart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("yourCart")
        .get();
    reviewCartValue.docs.forEach((element) {
      var doc = foodQuery.doc(element.get('cartname'));
      doc.get().then((value) {CartModel reviewCartModel = CartModel(
        cartImage: element.get("cartImage"),
        cartName: element.get("cartname"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
      );
      newList.add(reviewCartModel);
      }

      );


      //  print("in get cart data${newList.length}");
    });
    cartDataList = newList;
    notifyListeners();
  } *//*


}
*/
