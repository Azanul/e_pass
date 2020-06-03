import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epass/services/AuthService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

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

  Future<List<String>> upImg(ref, img1, img2, img3) async {
    StorageReference storageReference = FirebaseStorage.instance.ref().child('submitted/${(await FirebaseAuth.instance.currentUser()).uid}');
    List<StorageReference> imgs = [storageReference.child('${basename(img1.path)}'), storageReference.child('${basename(img2.path)}'), storageReference.child('${basename(img3.path)}')];
    List<StorageUploadTask> uploadTasks = [imgs[0].putFile(img1), imgs[1].putFile(img2), imgs[2].putFile(img3)];
    await uploadTasks[0].onComplete;
    await uploadTasks[1].onComplete;
    await uploadTasks[2].onComplete;
    ref.aadhar = imgs[0].getDownloadURL();
    ref.self = imgs[1].getDownloadURL();
    ref.proof = imgs[2].getDownloadURL();
  }
}
