import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/itienraryModal.dart';
import 'package:wedding_planner/itenrary/Itenrary%20Details.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/itenraryUploadModal.dart';
import '../Provider/taskprovider.dart';
import '../widgets/buildErrorDialog.dart';
import '../widgets/const.dart';
import '../widgets/headerwidget.dart';

class AddViewItenrary extends StatefulWidget {
  const AddViewItenrary({super.key});

  @override
  State<AddViewItenrary> createState() => _AddViewItenraryState();
}

final GlobalKey<ScaffoldState> scaffoldKey16 = GlobalKey<ScaffoldState>();
bool isLoading = true;
File? _pickedFile;

class _AddViewItenraryState extends State<AddViewItenrary> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    IteinraryApi();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey16,
        drawer: drawer1(),
        body: isLoading
            ? Container()
            : Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  header(
                      text: "Itinerary",
                      callback1: () {
                        scaffoldKey16.currentState?.openDrawer();
                      }),
                  SizedBox(height: 1.h),
                  itienrarymodal?.status == "0" && itienrarymodal?.data == null
                      ? Container(
                          height: 83.h,
                          child: InkWell(
                            onTap: () {
                              addcheklistdialog();
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/pdf.png',
                                      height: 27.h, color: Colors.blue),
                                  SizedBox(height: 2.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 2.7.w),
                                      Text(
                                        'Upload Your File',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15.5.sp,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        )
                      : Container(
                          height: 83.h,
                          child: InkWell(
                            onTap: () {
                              Get.to(ItenraryDetails(
                                link: itienrarymodal?.data?.filePath,
                              ));
                            },
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset('assets/pdf.png',
                                      height: 27.h, color: Colors.blue),
                                  SizedBox(height: 2.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 2.7.w),
                                      Text(
                                        'View Your File',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15.5.sp,
                                            fontFamily: 'sofi',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                ],
              ),
      ),
    );
  }

  addcheklistdialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.grey.shade100,
          child: Stack(
            children: [
              Container(
                  width: 80.w,
                  // height: 70.h,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(
                              child: Text(
                                'Add Itinerary File',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17.sp,
                                    fontFamily: 'sofi',
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    height: 0.17.h,
                                    letterSpacing: 1),
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles();
                                    if (result != null) {
                                      setState(() {
                                        _pickedFile = File(result
                                            .files.single.path
                                            .toString());
                                        IteinraryUploadApi();
                                        Get.back();
                                      });
                                    } else {}
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.all(2.5.w),
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          CupertinoIcons.add,
                                          size: 17.sp,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          'Add Your File',
                                          style: TextStyle(
                                              fontSize: 13.sp,
                                              fontFamily: 'sofi',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 1.h),
                          ],
                        ),
                      ))),
              Positioned(
                  right: 0,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(CupertinoIcons.clear_circled_solid)))
            ],
          ),
        );
      },
    );
  }

  IteinraryApi() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().itienraryapi().then((response) async {
          itienrarymodal = ItienraryModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && itienrarymodal?.status == "1") {
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  IteinraryUploadApi() {
    EasyLoading.show(
        status: 'Uploading Please Wait ..',
        indicator: CircularProgressIndicator(
          color: Colors.white,
        ));
    print('here');
    final Map<String, String> data = {};
    data['itinerary_file'] = _pickedFile!.path;
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().itenraryuploadapi(data).then((response) async {
          iteneryupload =
              ItienraryuploadModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && iteneryupload?.status == "1") {
            EasyLoading.showSuccess("Uploaded");
            // Fluttertoast.showToast(
            //     msg: "Itinerary Uploaded Successfully",
            //     toastLength: Toast.LENGTH_SHORT,
            //     timeInSecForIosWeb: 1,
            //     backgroundColor: Colors.blue,
            //     textColor: Colors.white,
            //     fontSize: 11.sp);
            IteinraryApi();
          } else {}
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
