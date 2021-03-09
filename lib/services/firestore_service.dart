import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:portfolio_website/models/data_models.dart';

class FirestoreService {
  CollectionReference _contactEntriesReference =
      FirebaseFirestore.instance.collection('Contact_Entries');

  CollectionReference _dataReference =
      FirebaseFirestore.instance.collection('data');

  uploadData(name, email, message) async {
    await _contactEntriesReference
        .doc()
        .set({'name': name, 'email': email, 'message': message});
  }

  Future fetchHomeData() async {
    try {
      DocumentSnapshot qs = await _dataReference.doc('data').get();
      return HomeData.fromJson(qs.data());
    } catch (e) {
      return e.toString();
    }
  }
}
