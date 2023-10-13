import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/FullchatModal.dart';
import 'package:wedding_planner/Modal/SendmessageModal.dart';
import 'package:wedding_planner/Provider/authprovider.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/load.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;
import 'package:wedding_planner/widgets/video.dart';
import 'package:wedding_planner/widgets/webview.dart';

class Msg2 extends StatefulWidget {
  String? img;
  String? name;
  String? id;

  Msg2({super.key, this.name, this.img, this.id});

  @override
  State<Msg2> createState() => _Msg2State();
}

class _Msg2State extends State<Msg2> {
  final ScrollController _scrollController = ScrollController();
  var outputDate2 = "";
  var outputDate1;
  String? date2 = "";
  String? data1;
  int? diff;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    fullchatap();
  }
  Future<void> Counter() async {
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      diff;
      outputDate1;
    });
  }
  TextEditingController _msg = TextEditingController();
  bool isLoading = true;
  ImagePicker _picker = ImagePicker();
  File? _pickedFile = null;
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.w),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 100.h,
                        child: Column(children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                          Icons.arrow_back_ios_new_rounded)),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 1.w),
                                    height: 5.h,
                                    width: 11.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(90),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: widget.img.toString(),
                                        progressIndicatorBuilder:
                                            (context, url, progress) =>
                                                CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'assets/icons/user.png',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              SizedBox(
                                width: 53.w,
                                child: Text(
                                  widget.name ?? '',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      fontFamily: 'sofi',
                                      color: Colors.black),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.more_vert_rounded))
                            ],
                          ),
                          SizedBox(height: 1.h),
                          Container(
                            height: 79.h,
                            child: ListView.builder(
                              controller: _scrollController,
                                reverse: true,
                                shrinkWrap: true,
                                itemCount:
                                    fullchatmodal?.data?.livechat?.length,
                                itemBuilder: (context, index) {
                                  bool showSeparator = false;
                                  var outputFormat2 =
                                  DateFormat('yyyy-MM-dd');
                                  var outputFormat1 = DateFormat("dd");
                                  DateTime parseDate = DateFormat(
                                      "yyyy-MM-dd hh:mm:ss")
                                      .parse(fullchatmodal
                                      ?.data?.livechat?[index].createdAt ??
                                      "");
                                  if (index <
                                      (fullchatmodal!.data?.livechat?.length ?? 0 -
                                          1)) {
                                    var outputFormat2 =
                                    DateFormat('yyyy-MM-dd');
                                    DateTime parseDate1 = DateFormat(
                                        "yyyy-MM-dd hh:mm:ss")
                                        .parse(fullchatmodal
                                        ?.data?.livechat?[index + 1]
                                        .createdAt ??
                                        "");
                                    var inputDate1 = DateTime.parse(
                                        parseDate1.toString());
                                    outputDate2 = outputFormat2
                                        .format(inputDate1);
                                  }
                                  var inputDate = DateTime.parse(
                                      parseDate.toString());
                                  var outputFormat =
                                  DateFormat(' hh:mm a');
                                  var outputDate = outputFormat
                                      .format(inputDate);
                                  outputDate1 = outputFormat2
                                      .format(inputDate);
                                  date2 = outputFormat1
                                      .format(inputDate);

                                  diff = (DateTime.now().day) -
                                      int.parse(date2.toString());
                                  Counter();

                                  // outputDate2 = outputFormat2.format(inputDate);
                                  if (outputDate1 != outputDate2) {
                                    showSeparator = true;
                                  } else {
                                    // showSeparator = true;
                                  }
                                  DateTime dateTime = DateTime.parse(
                                      fullchatmodal?.data?.livechat?[index]
                                              .createdAt ??
                                          "");
                                  DateFormat timeFormat = DateFormat(
                                      'HH:mm'); // Customize the format as needed
                                  String formattedTime =
                                      timeFormat.format(dateTime);
                                  return Column(
                                    children: [
                                      (showSeparator)
                                          ? Column(
                                        children: [
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Container(
                                              margin:
                                              EdgeInsets
                                                  .all(1
                                                  .w),
                                              padding:
                                              EdgeInsets
                                                  .all(1
                                                  .w),
                                              height: 4.h,
                                              width: 25.w,
                                              alignment:
                                              Alignment
                                                  .center,
                                              decoration:
                                              BoxDecoration(
                                                borderRadius:
                                                BorderRadius
                                                    .circular(
                                                    15.0),
                                                color: Colors
                                                    .transparent
                                                    .withOpacity(
                                                    0.3),
                                              ),
                                              child: Text(
                                                (diff == 0)
                                                    ? "Today"
                                                    : (diff ==
                                                    1)
                                                    ? "Yesterday"
                                                    : outputDate1
                                                    .toString(),
                                                style: TextStyle(
                                                    color: Colors
                                                        .white,
                                                    fontSize:
                                                    12.sp,
                                                    fontFamily:
                                                    "Poppins"),
                                              )),
                                        ],
                                      ):fullchatmodal
                                      ?.data?.livechat?[index].fromId ==
                                      userData?.user?.id
                                      ? Align(
                                    alignment: Alignment.centerRight,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.end,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.end,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              formattedTime,
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight:
                                                  FontWeight.w600,
                                                  fontFamily: 'sofi'),
                                            ),
                                            SizedBox(width: 1.w),
                                            Container(
                                              margin:
                                              EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              height: 3.5.h,
                                              width: 7.5.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    90),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl:
                                                  fullchatmodal?.data?.chatUser?.profile ??"",
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                      progress) =>
                                                      CircularProgressIndicator(),
                                                  errorWidget: (context,
                                                      url, error) =>
                                                      Image.asset(
                                                        'assets/icons/user.png',
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 1.h),
                                        Container(
                                          width: 60.w,
                                          alignment:
                                          Alignment.centerRight,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w,
                                              vertical: 1.3.h),
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                            BorderRadius.only(
                                              bottomLeft:
                                              Radius.circular(20),
                                              topLeft:
                                              Radius.circular(20),
                                              bottomRight:
                                              Radius.circular(20),
                                            ),
                                          ),
                                          child: fullchatmodal
                                              ?.data
                                              ?.livechat?[index]
                                              .messageType ==
                                              "1"
                                              ? Text(
                                            fullchatmodal
                                                ?.data
                                                ?.livechat?[
                                            index]
                                                .message ??
                                                "",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                letterSpacing: 1.5,
                                                fontFamily: 'sofi'),
                                          )
                                              : fullchatmodal
                                              ?.data
                                              ?.livechat?[
                                          index]
                                              .messageType ==
                                              "2"
                                              ? Container(
                                            margin: EdgeInsets
                                                .symmetric(
                                                horizontal:
                                                1.w),
                                            height: 20.h,
                                            width: 60.w,
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                  20),
                                              child:
                                              CachedNetworkImage(
                                                fit: BoxFit
                                                    .cover,
                                                imageUrl: fullchatmodal
                                                    ?.data
                                                    ?.livechat?[
                                                index]
                                                    .message ??
                                                    '',
                                                progressIndicatorBuilder:
                                                    (context,
                                                    url,
                                                    progress) =>
                                                    CircularProgressIndicator(),
                                                errorWidget: (context,
                                                    url,
                                                    error) =>
                                                    Image.asset(
                                                      'assets/icons/user.png',
                                                      color: Colors
                                                          .white,
                                                    ),
                                              ),
                                            ),
                                          )
                                              : fullchatmodal
                                              ?.data
                                              ?.livechat?[
                                          index]
                                              .messageType ==
                                              "3"
                                              ? Container(
                                            height: 20.h,
                                            width: 60.w,
                                            child: addVideo(
                                                videoid: fullchatmodal
                                                    ?.data
                                                    ?.livechat?[index]
                                                    .message ??
                                                    ""),
                                          )
                                              : GestureDetector(
                                            onTap:
                                                () async {
                                              final String?
                                              url =
                                              (fullchatmodal
                                                  ?.data
                                                  ?.livechat?[
                                              index]
                                                  .message);
                                              String
                                              fileExtension =
                                              path.extension(
                                                  url!);

                                              if (fileExtension ==
                                                  ".txt") {
                                                Get.to(
                                                    webview(
                                                      data: fullchatmodal
                                                          ?.data
                                                          ?.livechat?[
                                                      index]
                                                          .message,
                                                    ));
                                                // Navigator.of(context).push(MaterialPageRoute(
                                                //     builder: (context) => webview(
                                                //       data: messagemodel?.data?[index].message,
                                                //     )));
                                              } else {
                                                var response = await http.get(Uri.parse((fullchatmodal
                                                    ?.data
                                                    ?.livechat?[index]
                                                    .message)
                                                    .toString()));

                                                String fileName = url
                                                    .toString()
                                                    .split(
                                                    '/')
                                                    .last;
                                                Directory?
                                                storageDirectory =
                                                Platform.isAndroid
                                                    ? await getExternalStorageDirectory()
                                                    : await getDownloadsDirectory();
                                                String
                                                directoryPath =
                                                    storageDirectory!
                                                        .path;
                                                File file =
                                                File(
                                                    '$directoryPath/$fileName');
                                                // Directory directory = await getApplicationDocumentsDirectory();
                                                await file.writeAsBytes(
                                                    response
                                                        .bodyBytes);
                                                String
                                                filePath =
                                                    '${storageDirectory.path}/$fileName';

                                                try {
                                                  final result =
                                                  await OpenFile.open(
                                                      filePath);
                                                } catch (e) {
                                                  print(e
                                                      .toString());
                                                }
                                              }
                                            },
                                            child: Text(
                                              fullchatmodal
                                                  ?.data
                                                  ?.livechat?[
                                              index]
                                                  .message ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize:
                                                  12.sp,
                                                  color: Colors
                                                      .white,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  letterSpacing:
                                                  1.5,
                                                  fontFamily:
                                                  'sofi'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 1.h),
                                      ],
                                    ),
                                  )
                                      : Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            Container(
                                              margin:
                                              EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              height: 3.5.h,
                                              width: 7.5.w,
                                              child: ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(
                                                    20),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.cover,
                                                  imageUrl: fullchatmodal
                                                      ?.data
                                                      ?.livechat?[
                                                  index]
                                                      .message ??
                                                      "",
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                      progress) =>
                                                      CircularProgressIndicator(),
                                                  errorWidget: (context,
                                                      url, error) =>
                                                      Image.asset(
                                                        'assets/icons/user.png',
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 1.w),
                                            Text(
                                              formattedTime,
                                              style: TextStyle(
                                                  fontSize: 11.sp,
                                                  fontWeight:
                                                  FontWeight.w600,
                                                  fontFamily: 'sofi'),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 1.h),
                                        Container(
                                          width: 60.w,
                                          alignment: Alignment.centerLeft,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.w,
                                              vertical: 1.3.h),
                                          decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                            BorderRadius.only(
                                              bottomLeft:
                                              Radius.circular(20),
                                              topLeft:
                                              Radius.circular(20),
                                              bottomRight:
                                              Radius.circular(20),
                                            ),
                                          ),
                                          child: fullchatmodal
                                              ?.data
                                              ?.livechat?[index]
                                              .messageType ==
                                              "1"
                                              ? Text(
                                            fullchatmodal
                                                ?.data
                                                ?.livechat?[
                                            index]
                                                .message ??
                                                "",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.white,
                                                fontWeight:
                                                FontWeight.bold,
                                                letterSpacing: 1.5,
                                                fontFamily: 'sofi'),
                                          )
                                              : fullchatmodal
                                              ?.data
                                              ?.livechat?[
                                          index]
                                              .messageType ==
                                              "2"
                                              ? Container(
                                            margin: EdgeInsets
                                                .symmetric(
                                                horizontal:
                                                1.w),
                                            height: 20.h,
                                            width: 60.w,
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                  20),
                                              child:
                                              CachedNetworkImage(
                                                fit: BoxFit
                                                    .cover,
                                                imageUrl: fullchatmodal
                                                    ?.data
                                                    ?.livechat?[
                                                index]
                                                    .message ??
                                                    '',
                                                progressIndicatorBuilder:
                                                    (context,
                                                    url,
                                                    progress) =>
                                                    CircularProgressIndicator(),
                                                errorWidget: (context,
                                                    url,
                                                    error) =>
                                                    Image.asset(
                                                      'assets/icons/user.png',
                                                      color: Colors
                                                          .white,
                                                    ),
                                              ),
                                            ),
                                          )
                                              : fullchatmodal
                                              ?.data
                                              ?.livechat?[
                                          index]
                                              .messageType ==
                                              "3"
                                              ? Container(
                                            height: 20.h,
                                            width: 60.w,
                                            child: addVideo(
                                                videoid: fullchatmodal
                                                    ?.data
                                                    ?.livechat?[index]
                                                    .message ??
                                                    ""),
                                          )
                                              : GestureDetector(
                                            onTap:
                                                () async {
                                              final String?
                                              url =
                                              (fullchatmodal
                                                  ?.data
                                                  ?.livechat?[
                                              index]
                                                  .message);
                                              String
                                              fileExtension =
                                              path.extension(
                                                  url!);

                                              if (fileExtension ==
                                                  ".txt") {
                                                Get.to(
                                                    webview(
                                                      data: fullchatmodal
                                                          ?.data
                                                          ?.livechat?[
                                                      index]
                                                          .message,
                                                    ));
                                                // Navigator.of(context).push(MaterialPageRoute(
                                                //     builder: (context) => webview(
                                                //       data: messagemodel?.data?[index].message,
                                                //     )));
                                              } else {
                                                var response = await http.get(Uri.parse((fullchatmodal
                                                    ?.data
                                                    ?.livechat?[index]
                                                    .message)
                                                    .toString()));

                                                String fileName = url
                                                    .toString()
                                                    .split(
                                                    '/')
                                                    .last;
                                                Directory?
                                                storageDirectory =
                                                Platform.isAndroid
                                                    ? await getExternalStorageDirectory()
                                                    : await getDownloadsDirectory();
                                                String
                                                directoryPath =
                                                    storageDirectory!
                                                        .path;
                                                File file =
                                                File(
                                                    '$directoryPath/$fileName');
                                                // Directory directory = await getApplicationDocumentsDirectory();
                                                await file.writeAsBytes(
                                                    response
                                                        .bodyBytes);
                                                String
                                                filePath =
                                                    '${storageDirectory.path}/$fileName';

                                                try {
                                                  final result =
                                                  await OpenFile.open(
                                                      filePath);
                                                } catch (e) {
                                                  print(e
                                                      .toString());
                                                }
                                              }
                                            },
                                            child: Text(
                                              fullchatmodal
                                                  ?.data
                                                  ?.livechat?[
                                              index]
                                                  .message ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize:
                                                  12.sp,
                                                  color: Colors
                                                      .white,
                                                  fontWeight:
                                                  FontWeight
                                                      .bold,
                                                  letterSpacing:
                                                  1.5,
                                                  fontFamily:
                                                  'sofi'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 1.h),
                                      ],
                                    ),
                                  )
                                    ],
                                  );
                                }),
                          ),
                        ]),
                      ),
                      Positioned(
                        top: 91.5.h,
                        child: Row(children: [
                          IconButton(
                              onPressed: () {
                                selectoption();
                              },
                              icon: Icon(
                                Icons.attach_file,
                                size: 20.sp,
                              )),
                          Container(
                            color: Colors.white,
                            width: 68.w,
                            child: TextField(
                              controller: _msg,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12.3.sp,
                                  fontFamily: 'get'),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(90),
                                ),
                                border: InputBorder.none,
                                hintText: 'Send a message',
                                hintStyle: TextStyle(
                                    color: Colors.black, fontFamily: 'get'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          InkWell(
                              onTap: () {
                                sendmessageap();
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.5.w),
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(90)),
                                  child: Center(
                                      child: Icon(
                                    Icons.send,
                                    size: 18.sp,
                                    color: Colors.white,
                                  ))))
                        ]),
                      ),
                    ],
                  ),
                ),
              )),
      ),
    );
  }

  sendmessageap() {
    final Map<String, String> data = {};
    data['textMsg'] = _msg.text.trim().toString();
    data['file'] = _msg.text == "" ? _pickedFile!.path : "";

    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().sendmessageapi(data, widget.id).then((response) async {
          sendmessageModal =
              SendmessageModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && sendmessageModal?.status == "1") {
            print(sendmessageModal?.status);
            _msg.text = "";
            fullchatap();
          } else {
            buildErrorDialog(
                context, " Error", (sendmessageModal?.message).toString());
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  selectoption() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 3.h),
                    Center(
                      child: Text(
                        'Select from below',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'sofi',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            height: 0.17.h,
                            letterSpacing: 1),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final XFile? photo = await _picker.pickVideo(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    _pickedFile = File(photo!.path);
                                    print("video daat");
                                    print(_pickedFile);
                                  });
                                  sendmessageap();
                                  // getvideo();
                                  Navigator.of(context).pop();
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.amber),
                                      child: Icon(
                                        Icons.video_camera_back,
                                        color: Colors.white,
                                        size: 25.0,
                                      ),
                                    ),
                                    Text(
                                      "video",
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontFamily: 'sofi',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            height: 0.17.h,
                                            letterSpacing: 1),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  final XFile? photo = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {
                                    _pickedFile = File(photo!.path);

                                    print(_pickedFile);
                                  });
                                  sendmessageap();
                                  Navigator.of(context).pop();

                                  // XFile? photo = await _picker.pickVideo(source: ImageSource.gallery);
                                  // setState(() {
                                  //   _pickedFile = File(photo!.path);
                                  // });
                                  // addchat();
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.amber),
                                      child: Icon(
                                        Icons.photo,
                                        color: Colors.white,
                                        size: 25.0,
                                      ),
                                    ),
                                    Text(
                                      "Image",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: 'sofi',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          height: 0.17.h,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles();

                                  if (result != null) {
                                    setState(() {
                                      _pickedFile = File(
                                          result.files.single.path.toString());
                                      sendmessageap();
                                    });
                                  } else {
                                    // User canceled the picker
                                  }
                                  Navigator.of(context).pop();
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.amber),
                                      child: Icon(
                                        Icons.contact_page,
                                        color: Colors.white,
                                        size: 25.0,
                                      ),
                                    ),
                                    Text("Document", style: TextStyle(
                                        fontSize: 16.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        height: 0.17.h,
                                        letterSpacing: 1),),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 0,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(CupertinoIcons.clear_circled_solid)))
          ],
        );
      },
    );
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     title: new Text('Select from below'),
    //     content: Container(
    //       // height: 180.0,
    //       width: MediaQuery.of(context).size.width,
    //       padding: EdgeInsets.all(10.0),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //       ),
    //       child:Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Row(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //
    //             children: [
    //               GestureDetector(
    //                 onTap: () async {
    //                   final XFile? photo = await _picker.pickVideo(source: ImageSource.gallery);
    //                   setState(() {
    //                     _pickedFile = File(photo!.path);
    //                     print("video daat");
    //                     print(_pickedFile);
    //                   });
    //                     sendmessageap();
    //                   // getvideo();
    //                   Navigator.of(context).pop();
    //
    //                 },
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       height: 50.0,
    //                       width: 50.0,
    //                       decoration: BoxDecoration(
    //                           shape: BoxShape.circle, color: Colors.lightBlue),
    //                       child: Icon(
    //                         Icons.video_camera_back,
    //                         color: Colors.white,
    //                         size: 25.0,
    //                       ),
    //                     ),
    //                     Text(
    //                       "video",
    //                       style:
    //                       TextStyle(fontSize: 12.sp, fontFamily: "Poppins"),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               GestureDetector(
    //                 onTap: () async {
    //                   final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    //                   setState(() {
    //                     _pickedFile = File(photo!.path);
    //
    //                     print(_pickedFile);
    //                   });
    //                   sendmessageap();
    //                   Navigator.of(context).pop();
    //
    //                   // XFile? photo = await _picker.pickVideo(source: ImageSource.gallery);
    //                   // setState(() {
    //                   //   _pickedFile = File(photo!.path);
    //                   // });
    //                   // addchat();
    //                 },
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       height: 50.0,
    //                       width: 50.0,
    //                       decoration: BoxDecoration(
    //                           shape: BoxShape.circle, color: Colors.lightBlue),
    //                       child: Icon(
    //                         Icons.photo,
    //                         color: Colors.white,
    //                         size: 25.0,
    //                       ),
    //                     ),
    //                     Text(
    //                       "Image",
    //                       style:
    //                       TextStyle(fontSize: 12.sp, fontFamily: "Poppins"),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               GestureDetector(
    //                 onTap: () async {
    //                   FilePickerResult? result = await FilePicker.platform.pickFiles();
    //
    //                   if (result != null) {
    //                     setState(() {
    //
    //                       _pickedFile = File(result.files.single.path.toString());
    //                       sendmessageap();
    //                     });
    //
    //                   } else {
    //                     // User canceled the picker
    //                   }
    //                   Navigator.of(context).pop();
    //                 },
    //                 child: Column(
    //                   children: [
    //                     Container(
    //                       height: 50.0,
    //                       width: 50.0,
    //                       decoration: BoxDecoration(
    //                           shape: BoxShape.circle, color: Colors.lightBlue),
    //                       child: Icon(
    //                         Icons.contact_page,
    //                         color: Colors.white,
    //                         size: 25.0,
    //                       ),
    //                     ),
    //                     Text("Document"),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       )
    //     ),
    //   ),
    // );
  }

  fullchatap() {
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().fullchatapi(widget.id).then((response) async {
          fullchatmodal = FullchatModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && fullchatmodal?.status == "1") {

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
}
