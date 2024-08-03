import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:job_app/controller/firebaseControllers/company/companyProfileController.dart';
import 'package:job_app/models/companyDataModels/companyProfileModel.dart';
import 'package:job_app/view/home_screens/UserHome/bottomBar.dart';

class CompanyProfileForm extends StatefulWidget {
  @override
  State<CompanyProfileForm> createState() => _CompanyProfileFormState();
}

class _CompanyProfileFormState extends State<CompanyProfileForm> {
  final TextEditingController companyNameController = TextEditingController();

  final TextEditingController companyAddressController =
  TextEditingController();

  final TextEditingController establishmentDateController =
  TextEditingController();

  String? businessTypeController;

  final TextEditingController employeeCountController = TextEditingController();

  final TextEditingController companyDescriptionController =
  TextEditingController();

  File? imageFile;
  Image? selectedImage;
  String? downloadUrl;

  CompanyProfileController companyProfileController =
  Get.put(CompanyProfileController());
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }

  // Future<void> selectAndUploadFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['svg', 'png', 'jpeg', 'jpg'],
  //   );
  //
  //   if (result != null) {
  //     File file = File(result.files.single.path!);
  //
  //     setState(() {
  //       imageFile = file;
  //       selectedImage = Image.file(file);
  //     });
  //     if (result != null) {
  //       imageFile = File(result.files.single.path!);
  //
  //       try {
  //         String fileName = imageFile!.path.split('/').last;
  //         Reference storageRef =
  //         FirebaseStorage.instance.ref().child('cv_files/$fileName');
  //         UploadTask uploadTask = storageRef.putFile(imageFile!);
  //
  //         TaskSnapshot taskSnapshot = await uploadTask;
  //         downloadUrl = await taskSnapshot.ref.getDownloadURL();
  //       } catch (e) {
  //         print('File upload error: $e');
  //       }
  //     }
  //   }
  // }

  Future<void> saveCompanyProfile(String imageUrl) async {
    ProfileCompany profileCompany = ProfileCompany(
        companyName: companyNameController.text,
        companyAddress: companyAddressController.text,
        establishmentDate: establishmentDateController.text,
        businessType: businessTypeController.toString(),
        employeeCount: employeeCountController.text,
        companyDescription: companyDescriptionController.text,
        cvFileUrl: imageUrl);

    await companyProfileController.saveProfileCompany(profileCompany);
    Get.to(MyHomePage());
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double padding = screenWidth * 0.04;
    final double fontSizeTitle = screenWidth * 0.08;
    final double fontSizeSubtitle = screenWidth * 0.05;
    final double containerHeight = screenHeight * 0.15;
    final double buttonHeight = screenHeight * 0.07;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'فرصة',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: fontSizeTitle,
                          color: Color(0xFF356899),
                        ),
                      ),
                    ),
                    Text(
                      'قم ببناء ملف الشركة الخاصة بك لادارة الموظفين بسهولة',
                      style: TextStyle(
                        fontSize: fontSizeSubtitle,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: padding * 2),
                    Container(
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsetsDirectional.only(bottom: 15),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: TextField(
                          controller: companyNameController,
                          decoration: InputDecoration(
                            hintText: 'اسم الشركة ',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsetsDirectional.only(bottom: 15),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: TextField(
                          controller: companyAddressController,
                          decoration: InputDecoration(
                            hintText: 'عنوان الشركة ',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: TextField(
                          controller: establishmentDateController,
                          decoration: InputDecoration(
                            hintText: 'تاريخ تأسيس الشركة . . .',
                            border: InputBorder.none,
                          ),
                          readOnly: true,
                          onTap: () =>
                              _selectDate(context, establishmentDateController),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: padding,
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(bottom: 15),
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'نوع العمل . . . ',
                            border: InputBorder.none,
                          ),
                          items: [
                            'فريلانسر',
                            'عقد عمل',
                            'دوام جزئي',
                            'دوام كامل'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            businessTypeController = newValue;
                          },
                        ),
                      ),
                    ),
                    Container(
                      height: buttonHeight,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsetsDirectional.only(bottom: 15),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: TextField(
                          controller: employeeCountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'عدد الموظفين  . . .',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: padding),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        child: TextField(
                          controller: companyDescriptionController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'اكتب فقرة تعريف بالشركة  . . .',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: padding),
                    Container(
                      padding: EdgeInsets.all(padding),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            selectedImage != null
                                ? Container(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: <Widget>[
                                  selectedImage!,
                                ],
                              ),
                            )
                                : Column(
                              children: [
                                Text(
                                  'قم بارفاق شعار الشركة الخاصة بك . . . ',
                                  style: TextStyle(
                                      fontSize: fontSizeSubtitle * 0.8),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: padding),
                                Text(
                                  'صيغ الصورة SVG, PNG, JPEG',
                                  style: TextStyle(
                                      fontSize: fontSizeSubtitle * 0.7,
                                      color: Colors.grey),
                                ),
                                SizedBox(height: padding),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: (){},// => selectAndUploadFile(),
                              child: Text(
                                'اختر من صورة',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize:
                                Size(double.infinity, buttonHeight),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (imageFile != null) {
                  await saveCompanyProfile(downloadUrl.toString());
                } else {
                  await CircularProgressIndicator();
                }
              },
              child: Text(
                'حفظ بروفايل الشركة',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, buttonHeight),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
