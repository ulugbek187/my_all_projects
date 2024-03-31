import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_all_projects/data/models/place_model.dart';
import '../utils/constants/app_constants.dart';

class AddressesViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get getLoader => _isLoading;

  List<PlaceModel> myAddresses = [];

  AddressesViewModel() {
    getPlaces();
  }

  Future<void> getPlaces() async {
    _notify(true);
    await FirebaseFirestore.instance
        .collection(AppConstants.places)
        .get()
        .then((snapshot) {
      myAddresses = snapshot.docs
          .map(
            (e) => PlaceModel.fromJson(
          e.data(),
        ),
      )
          .toList();
    });
    _notify(false);
  }

  Stream<List<PlaceModel>> listenPlaces() {
    return FirebaseFirestore.instance
        .collection(
      AppConstants.places,
    )
        .snapshots()
        .map(
          (event) => event.docs
          .map(
            (doc) => PlaceModel.fromJson(
          doc.data(),
        ),
      )
          .toList(),
    );
  }

  addNewAddress({
    required PlaceModel placeModel,
  }) async {
    try {
      _notify(true);
      var cf = await FirebaseFirestore.instance
          .collection(AppConstants.places)
          .add(placeModel.toJson());

      await FirebaseFirestore.instance
          .collection(AppConstants.places)
          .doc(cf.id)
          .update({"doc_id": cf.id});

      _notify(false);
    } on FirebaseException catch (error) {
      return error;
    }
  }

  updateCategory(
      PlaceModel placeModel,
      ) async {
    try {
      _notify(true);
      await FirebaseFirestore.instance
          .collection(AppConstants.places)
          .doc(placeModel.docId)
          .update(placeModel.toJsonForUpdate());

      _notify(false);
    } on FirebaseException catch (error) {
      return error;
    }
  }

  deleteCategory(
      String docId,
      ) async {
    try {
      _notify(true);
      await FirebaseFirestore.instance
          .collection(AppConstants.places)
          .doc(docId)
          .delete();

      _notify(false);
    } on FirebaseException catch (error) {
      return error;
    }
  }

  _notify(bool v) {
    _isLoading = v;
    notifyListeners();
  }
}
