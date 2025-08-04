import 'package:bolg_website/Screens/Maintree.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:bolg_website/Models/BlogModel.dart';
import 'package:bolg_website/constants/colors.dart';
import 'package:bolg_website/constants/text.dart';
import 'package:bolg_website/firebasefunctions.dart';

class CreateBlog extends StatelessWidget {
  CreateBlog({super.key});

  final TextEditingController heading = TextEditingController();
  final TextEditingController blogWords = TextEditingController();

  final ValueNotifier<String> uploadStatus = ValueNotifier('');
  final ValueNotifier<PlatformFile?> pickedFile = ValueNotifier(null);
  final ValueNotifier<String?> imageUrl = ValueNotifier(null);

  Future<void> pickFile() async {
    final result = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50, // Adjust quality as needed
    );
    if (result == null) return;
    final Imagebytes = await result.readAsBytes();
    final imageName = result.name;

    // Update the picked file
    pickedFile.value = PlatformFile(
        name: imageName, bytes: Imagebytes, size: Imagebytes.lengthInBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Write your blog below",
                style: knormaltextStyle.copyWith(fontSize: 30)),
            const SizedBox(height: 16),
            Text("Heading", style: knormaltextStyle.copyWith(fontSize: 28)),
            TextField(
              controller: heading,
              maxLength: 50,
              decoration: InputDecoration(
                hintText: "Enter heading...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text("Blog Content",
                style: knormaltextStyle.copyWith(fontSize: 28)),
            SizedBox(
              height: 200,
              child: TextField(
                textAlign: TextAlign.start,
                controller: blogWords,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  hintText: "Enter your blog content...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () async => await pickFile(),
              child: Container(
                height: 84,
                width: 314,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFF636363)),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.file_upload),
                      const SizedBox(width: 10),
                      ValueListenableBuilder<PlatformFile?>(
                        valueListenable: pickedFile,
                        builder: (_, file, __) {
                          return Text(
                            file != null
                                ? 'Selected: ${file.name}'
                                : 'Click here to select an image',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ValueListenableBuilder<String>(
              valueListenable: uploadStatus,
              builder: (_, status, __) => Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(status,
                    style: TextStyle(fontSize: 14, color: Colors.black87)),
              ),
            ),
            const Spacer(),

            /// --- Submit Button ---
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kOrangeColor,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () async {
                  try {
                    final file = pickedFile.value;
                    if (file == null || file.bytes == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select a file")),
                      );
                      return;
                    }

                    final fileName = file.name;
                    final fileBytes = file.bytes!;
                    final supabase = Supabase.instance.client;
                    print("Uploading file: $fileName");
                    // Upload
                    final path = 'uploads/$fileName';
                    final uploaded =
                        await supabase.storage.from('post-images').uploadBinary(
                              path,
                              fileBytes,
                              fileOptions: const FileOptions(upsert: true),
                            );
                    print("File uploaded: $path");
                    if (uploaded.isEmpty) {
                      throw Exception('Upload failed');
                    }

                    // Get public URL
                    final imageUrlStr =
                        supabase.storage.from('post-images').getPublicUrl(path);
                    print("Image URL: $imageUrlStr");
                    final newBlog = BlogModel(
                      id: '',
                      title: heading.text.trim(),
                      content: blogWords.text.trim(),
                      imageUrl: imageUrlStr,
                      createdAt: DateTime.now(),
                    );

                    await FirebaseService().addBlog(newBlog);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("✅ Blog posted successfully!")),
                    );
                    heading.clear();
                    blogWords.clear();
                    pickedFile.value = null;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Maintree()));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("❌ Error: $e")),
                    );
                  }
                },
                child: Text(
                  "Post",
                  style: knormaltextStyle.copyWith(
                      color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
