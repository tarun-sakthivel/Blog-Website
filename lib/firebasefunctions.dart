import 'package:cloud_firestore/cloud_firestore.dart';

import '../Models/BlogModel.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addBlog(BlogModel blog) async {
    final docRef = _firestore.collection('Blog').doc();

    await docRef.set({
      'id': docRef.id,
      'Heading': blog.title,
      'Content': blog.content,
      'ImageUrl': blog.imageUrl,
      'Time': blog.createdAt,
    });
  }

  Future<void> addSubscriber(String name, String email) async {
    final docRef = _firestore.collection('Subscriber').doc();

    await docRef.set({
      'id': docRef.id,
      'Name': name,
      'Email': email,
    });
  }

  Future<List<BlogModel>> fetchBlogs() async {
    final snapshot = await _firestore
        .collection('Blog')
        .orderBy('Time', descending: true)
        .get();
    return snapshot.docs
        .map((doc) => BlogModel.fromMap(doc.id, doc.data()))
        .toList();
  }
}

// Future<void> uploadPostWithImage({
//   required String title,
//   required String content,
// }) async {
//   final picker = ImagePicker();
//   final pickedImage = await picker.pickImage(source: ImageSource.gallery);

//   if (pickedImage == null) return;

//   File imageFile = File(pickedImage.path);

//   // ✅ Step 1: Upload image to Firebase Storage
//   final storageRef = FirebaseStorage.instance
//       .ref()
//       .child('blogImages/${DateTime.now().millisecondsSinceEpoch}.jpg');

//   final uploadTask = await storageRef.putFile(imageFile);
//   final imageUrl = await uploadTask.ref.getDownloadURL();

//   // ✅ Step 2: Save post with imageUrl in Firestore
//   await FirebaseFirestore.instance.collection('blogs').add({
//     'title': title,
//     'content': content,
//     'imageUrl': imageUrl,
//     'createdAt': Timestamp.now(),
//   });
// }

void setState(Null Function() param0) {}
