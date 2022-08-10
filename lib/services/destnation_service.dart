import 'package:airplane_app/models/destinatons_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DestinationsService {
  CollectionReference _dataFirestore =
      FirebaseFirestore.instance.collection('destinations');

  Future<List<DestinationsModel>> fetchData() async {
    try {
      QuerySnapshot allData = await _dataFirestore.get();
      List<DestinationsModel> listDestination = allData.docs
          .map((e) => DestinationsModel.fromJson(
              e.id, e.data() as Map<String, dynamic>))
          .toList();

      return listDestination;
    } catch (e) {
      throw e;
    }
  }
}
