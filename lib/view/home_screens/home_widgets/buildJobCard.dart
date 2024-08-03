import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:job_app/core/constansColor.dart';

class buildJobCard extends StatelessWidget {
  final String title;
  final String company;
  final String imageUrl;
  final String salary;
  final String type;
  final String location;
  final String experience;

  const buildJobCard(
      {super.key,
      required this.title,
      required this.company,
      required this.imageUrl,
      required this.salary,
      required this.type,
      required this.location,
      required this.experience});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding:  EdgeInsets.all(width*.009),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              // boxShadow:Box,
              borderRadius: BorderRadius.circular(17),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * .02, vertical: width * .05),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage(imageUrl),
                            radius: width * .08,
                          ),
                          SizedBox(width: width * .02),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                company,
                                style: TextStyle(
                                  color: subsTitleColor,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.share,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      SizedBox(height: 10),
                      Wrap(
                        spacing: width * .01,
                        children: [
                          Chip(
                            backgroundColor: submenueColor.withOpacity(1.0),
                            label: Text(
                              experience,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Chip(
                            backgroundColor: submenueColor.withOpacity(1.0),
                            label: Text(
                              type,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Chip(
                            backgroundColor: submenueColor.withOpacity(1.0),
                            label: Text(
                              type,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: width * .03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            location,
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            'الراتب: $salary',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/images/home_icons/page_icons/mask_icons.svg',
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
