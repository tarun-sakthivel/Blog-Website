// import 'dart:typed_data';
// import 'package:image_picker/image_picker.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:uuid/uuid.dart';

// Future<void> selectImageAndUpload() async {
//   try {
//     // 1. Pick the image
//     final picker = ImagePicker();
//     final XFile? pickedFile =
//         await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile == null) {
//       print('No image selected.');
//       return;
//     }

//     final Uint8List imageBytes = await pickedFile.readAsBytes();

//     // 2. Generate unique file name
//     final String fileName = 'post_${const Uuid().v4()}.jpg';
//     print("Enter the supabase storage");
//     // 3. Upload to Supabase
//     final storageResponse = await Supabase.instance.client.storage
//         .from('post-images') // your bucket name
//         .uploadBinary(fileName, imageBytes);
//     print("------------");
//     if (storageResponse.isEmpty) {
//       print('Image upload failed.');
//       return;
//     }

//     // 4. Get public URL
//     final publicUrl = Supabase.instance.client.storage
//         .from('post-images')
//         .getPublicUrl(fileName);

//     print('Public image URL: $publicUrl');

//     // 5. Save to Firebase
//     await FirebaseFirestore.instance.collection('posts').add({
//       'ImageUrl': publicUrl,
//       'Time': Timestamp.now(),
//       'Heading': 'Your post title here', // example
//       'Content': 'Your post description here',
//     });

//     print('Post added to Firestore!');
//   } catch (e) {
//     print('Error selecting or uploading image: $e');
//   }
// }
