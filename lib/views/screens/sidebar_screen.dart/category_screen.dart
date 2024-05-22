import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multivendoradmin/views/screens/sidebar_screen.dart/widgets/category_widget.dart';

class CategoryScreen extends StatefulWidget {
  static const routeName = "/categories";
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final TextEditingController nameController = TextEditingController();
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  dynamic _image;
  String? fileName;

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image,
    );
    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  Future<String> uploadCategoryToStorage(dynamic image) async {
    Reference ref = _firebaseStorage.ref().child('categories').child(fileName!);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }

  Future<void> uploadCategoryToFirestore() async {
    EasyLoading.show();
    if (_image != null) {
      String imageUrl = await uploadCategoryToStorage(_image);
      await _firestore.collection("categories").doc().set(
        {
          "image": imageUrl,
          "name": nameController.text.trim(),
        },
      ).whenComplete(
        () {
          EasyLoading.dismiss();
          setState(() {
            _image = null;
            nameController.clear();
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Upload Categories",
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
              textAlign: TextAlign.start,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(20),
                      height: 140,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey.shade800,
                        ),
                        image: _image != null
                            ? DecorationImage(
                                image: MemoryImage(_image),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: _image == null
                          ? const Center(
                              child: Text(
                                "No image selected",
                                textScaler: TextScaler.noScaling,
                              ),
                            )
                          : null,
                    ),
                    if (_image != null) ...[
                      Text(
                        fileName!,
                        textScaler: TextScaler.noScaling,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow.shade900,
                      ),
                      onPressed: () async {
                        await pickImage();
                      },
                      child: const Text(
                        "Upload Image",
                        textScaler: TextScaler.noScaling,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 150,
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter category name";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: "Category name",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade900,
                  ),
                  onPressed: () async {
                    if (_image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            "Please select an image",
                            textScaler: TextScaler.noScaling,
                          ),
                          action: SnackBarAction(
                            backgroundColor: Colors.white,
                            label: "OK",
                            onPressed: () {
                              ScaffoldMessenger.of(context).clearSnackBars();
                            },
                          ),
                        ),
                      );
                      return;
                    }
                    if (!_formkey.currentState!.validate()) {
                      return;
                    }
                    await uploadCategoryToFirestore();
                  },
                  child: const Text(
                    "Save",
                    textScaler: TextScaler.noScaling,
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              thickness: 2,
            ),
            const Text(
              "Categories",
              textScaler: TextScaler.noScaling,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 36,
              ),
              textAlign: TextAlign.start,
            ),
            const CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
