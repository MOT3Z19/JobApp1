import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_app/controller/firestoreController/serviceProvider/serviceProviderProfileController.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/models/service_profile/serviceProvider.dart';
import 'package:job_app/view/home_screens/userHome/bottomBar.dart';
import 'package:job_app/widgets/drop_TextFiledmenu_Widget.dart';
import 'package:job_app/widgets/textFiled_Widget.dart';

class ServiceFormScreen extends StatefulWidget {
  @override
  _ServiceFormScreenState createState() => _ServiceFormScreenState();
}

class _ServiceFormScreenState extends State<ServiceFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  //String? serviceTypeController;
  //String? serviceDescriptionController;
  final TextEditingController _serviceFeeController = TextEditingController();
  final TextEditingController _serviceTypeController = TextEditingController();
  final TextEditingController _workLocationController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  XFile? _image;
  final ServiceProviderProfileController _controller =
      ServiceProviderProfileController();

  @override
  void dispose() {
    _nameController.dispose();
    _serviceFeeController.dispose();
    _workLocationController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final image = await _controller.pickImage();
    setState(() {
      _image = image;
    });
  }

  Future<void> _submitForm() async {
      String imageUrl =
          _image != null ? await _controller.uploadImage(_image!) : '';
      final profile = ServiceProfile(
        name: _nameController.text,
        serviceType: _serviceTypeController.text,
        //serviceDescription: serviceDescriptionController ?? '',
        serviceFee: _serviceFeeController.text,
        workLocation: _workLocationController.text,
        phoneNumber: _phoneNumberController.text,
        imageUrl: imageUrl,
      );
      await _controller.submitForm(profile);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Profile Created')));
      Get.to(MyHomePage());

  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'رجوع',
                style: TextStyle(color: subsTitleColor),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.02, horizontal: screenWidth * .03),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(parent: BouncingScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight*.07),
              Center(
                child: Text(
                  'فرصة',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: primaryColor,
                  ),
                ),

              ),
              SizedBox(height: screenHeight*.01),

              Text(
                'قم ببناء ملف تقديم الخدمة  لتحصل على فرصة أكبر :)',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(height: screenHeight * .02),
              Text(
                'المعلومات الشخصية',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: screenHeight * .01),
              Center(
                child: InkWell(
                    onTap: () {
                      _pickImage();

                      // _controller.submitForm(ServiceProfile(name:_nameController.text , serviceType: serviceTypeController??'', serviceDescription: serviceDescriptionController??'', serviceFee: _serviceFeeController.text, workLocation: _workLocationController.text, phoneNumber: _phoneNumberController.text, imageUrl: _image))
                    },
                    child: DottedBorder(
                        color: primaryColor,
                        dashPattern: [8, 8, 8, 8],
                        borderType: BorderType.RRect,
                        radius: Radius.circular(screenWidth * 0.60),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(screenWidth * 0.60),
                            color: Theme.of(context).primaryColor,
                          ),
                          height: screenHeight * 0.17,
                          width: screenWidth * 0.35,
                          child: Center(
                            child: Text(
                              'قم بارفاق صورة شخصية  . . . ',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ))),
              ),
            // if (_image != null) ...[
            //       SizedBox(height: 16),
            //       Image.file(File(_image!.path), height: 150),
            //     ],
              SizedBox(height: screenHeight*.01),

              CustomTextField(
                label: 'الاسم والشُهرة',
                controller: _nameController,
                keybordType: TextInputType.name,
              ),
              CustomTextField(
                label: 'نوع المهنة',
                controller: _serviceTypeController,
                keybordType: TextInputType.name,
              ),
              
              
              // CustomDropdown(
              //     label: 'نوع الخدمة ',
              //     options: [
              //       'أونلاين',
              //       'حضوري',
              //       'حضوري و أونلاين',
              //     ],
              //     selectedValue: serviceTypeController,
              //     onChanged: (value) =>
              //         setState(() => serviceTypeController = value)),
              // CustomDropdown(
              //     label: 'وصف الخدمة ',
              //     options: [
              //       'أونلاين',
              //       'حضوري',
              //       'حضوري و أونلاين',
              //     ],
              //     selectedValue: serviceDescriptionController,
              //     onChanged: (value) =>
              //         setState(() => serviceDescriptionController = value)),
              CustomTextField(
                label: 'أجر الخدمة',
                controller: _serviceFeeController,
                keybordType: TextInputType.number,
              ),
              CustomTextField(
                label: 'مكان العمل',
                controller: _workLocationController,
                keybordType: TextInputType.streetAddress,
              ),
              CustomTextField(
                label: 'رقم الهاتف',
                controller: _phoneNumberController,
                keybordType: TextInputType.number,
              ),
              SizedBox(height: screenHeight*.02),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('إنشاء ملف الخدمة'),
              ),
              SizedBox(height: screenHeight*.02,)
            ],
          ),
        ),
      ),
    );
  }

}
