
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_app/controller/firestoreController/company/companyProfileController.dart';
import 'package:job_app/core/constansColor.dart';
import 'package:job_app/view/home_screens/UserHome/bottomBar.dart';
import 'package:job_app/view/home_screens/UserHome/home_page.dart';
import 'package:job_app/widgets/drop_TextFiledmenu_Widget.dart';
import 'package:job_app/widgets/textFiled_Widget.dart';
import 'package:job_app/widgets/textfiled_date_widget.dart';
class CompanyProfileForm extends StatefulWidget {
  @override
  State<CompanyProfileForm> createState() => _CompanyProfileFormState();
}

class _CompanyProfileFormState extends State<CompanyProfileForm> {
  CompanyProfileController companyProfileController =
      Get.put(CompanyProfileController());

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
        padding: const EdgeInsets.all(16.0),
        child: Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(parent: BouncingScrollPhysics()),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: screenHeight*.07,
                ),
                Center(
                  child: Text(
                    'فرصة',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: fontSizeTitle,
                      color: primaryColor,
                    ),
                  ),
                ),
                Text(
                  'قم ببناء ملف الشركة الخاصة بك لادارة الموظفين بسهولة',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * .02),
                Text(
                  'معلومات الشركة ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * .01),
                CustomTextField(label: 'اسم الشركة', controller:companyProfileController.companyNameController,keybordType: TextInputType.name),
                CustomTextField(label: 'عنوان الشركة', controller: companyProfileController.companyAddressController,keybordType: TextInputType.streetAddress),
                CustomDatePicker(label: 'تاريخ تأسيس الشركة', controller: companyProfileController.establishmentDateController),
                CustomDropdown(label: 'نوع العمل',options: [
                      'مدارس وتربية',
                      'تعليم عالي',
                      'صحة',
                      'أكاديمي',
                      'هندسة',
                      'طب',
                      'صيدلة',
                      'فندقة',
                      'تسويق',
                      'توظيف',
                      'سياحة',
                      'ديكور',
                      'تصميم مباني',
                      'تجارة',
                      'مقتنيات وملابس',
                      'اجهزة الكترونية',
                      'برمجة',
                      'جرافيك ديزاين',
                      'تصوير',
                      'ترفيه',
                      'غذائية',
                      'تعليم سياقة',
                      'نادي صحي',
                      'صالون رجالي',
                      'صالون نسائي',
                      'نقل وشحن',
                      'توصيل داخلي',
                      'معرض سيارات',
                      'خطوط طيران',
                      'شركة خدمية',
                      'مطعم',
                      'كوفي',
                      'كوفي هاوس',
                      'قاعة رياضية',
                      'قاعة مناسبات',
                    ],selectedValue: companyProfileController.businessTypeController, onChanged: (value) => setState(() =>companyProfileController.businessTypeController= value)),
                CustomTextField(label: 'عدد الموظفين', controller: companyProfileController.employeeCountController,keybordType: TextInputType.number),
                CustomTextField(label: 'رقم الهاتف', controller: companyProfileController.companyNumController,keybordType: TextInputType.number),
                SizedBox(height: screenHeight*.01),
                TextField(
                  keyboardType: TextInputType.multiline, controller: companyProfileController.companyDescriptionController, maxLines: 5,
                  decoration: InputDecoration(
                      fillColor: Theme.of(context).primaryColor,
                      filled: true,
                      suffixIcon: Padding(
                          padding: EdgeInsetsDirectional.only(
                              top: screenHeight * .13,
                              start: screenWidth * .05),
                          child: SvgPicture.asset(
                              'assets/images/profile_icons/about.svg')),
                      border: OutlineInputBorder( // استخدام OutlineInputBorder للحواف الدائري// ة
                          borderRadius: BorderRadius.circular(10), // إضافة الحواف الدائرية
                          borderSide: BorderSide.none,
                          gapPadding: 12// إزالة الحد الخارجي
                      ),
                      hintText: 'اكتب النبذة المختصرة . . .'),
                ),
                SizedBox(height: screenHeight*.02),
                DottedBorder(
                  color: primaryColor,
                  dashPattern: [8, 8, 8, 8],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(15),
                  child: Container(
                    width: screenWidth,
                    padding: EdgeInsets.all(fontSizeSubtitle),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'قم بارفاق شعار الشركة الخاصة بك . . . ',
                          style: TextStyle(
                              fontSize: fontSizeSubtitle,
                              color: subsTitleColor),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: padding),
                        Container(
                          padding: EdgeInsetsDirectional.all(15),
                          width: screenWidth / 1.5,
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                            textAlign: TextAlign.center,
                            'صيغ الملفات PNG, JPEG',
                            style: TextStyle(
                              fontSize: fontSizeSubtitle,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(height: padding),
                        ElevatedButton(
                          onPressed: (){
                            companyProfileController.selectAndUploadFile();},
                          child: Text(
                            'اختر من الملفات',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight*.02),
                ElevatedButton(
                  onPressed: () async {
                    await companyProfileController.saveProfileCompany();
                    Get.back();
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
        ),
      ),
    );
  }


}
