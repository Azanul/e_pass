import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epass/services/AuthService.dart';

class CrudMethods {
  Future<void> addData(formData) async {
    bool status = await checkLogin();
    if (status) {
      Firestore.instance
          .collection('submitted_forms')
          .add(formData)
          .catchError((e) {
        print(e);
      });
    } else {
      print('log in first');
    }
  }
}
