import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/CheckListModal.dart';
import 'package:wedding_planner/Modal/removetodoModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/new%20pages/NotificationScreen.dart';
import 'package:wedding_planner/widgets/addcheck.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../Modal/markcompletedmodal.dart';

class Check_list extends StatefulWidget {
  const Check_list({super.key});

  @override
  State<Check_list> createState() => _Check_listState();
}

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

bool ischeck = false;

class checklist {
  String? title;
  bool? chek;

  checklist(
    this.title,
    this.chek,
  );
}

// List<checklist> lists = [
//   checklist('Make All Bookings Page', true),
//   checklist('Change Signup Page', false),
//   checklist('Make All Certificates Page', true),
//   checklist('Make All itinerary Page', false),
//   checklist('Make All Budget Page', true),
//   checklist('Make All Parcels received', false),
//   checklist('Make All Notifications Page', false),
//   checklist('Make All Bookings Page', true),
//   checklist('Change Signup Page', false),
//   checklist('Make All Certificates Page', true),
//   checklist('Make All itinerary Page', false),
//   checklist('Make All Budget Page', true),
//   checklist('Make All Parcels received', false),
//   checklist('Make All Notifications Page', false),
//   checklist('Make All Bookings Page', true),
//   checklist('Change Signup Page', false),
//   checklist('Make All Certificates Page', true),
//   checklist('Make All itinerary Page', false),
//   checklist('Make All Budget Page', true),
//   checklist('Make All Parcels received', false),
//   checklist('Make All Notifications Page', false),
// ];

class _Check_listState extends State<Check_list> {
  TextEditingController _search = TextEditingController();
  bool isLoading = true;
  int? sel1 = 0;
  int? val;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklistap();
  }

  List<String> type = ["All", "Today Alert", "Completed", "Pending"];

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key: scaffoldKey,
        drawer: drawer1(),
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 100.h,
                        child: Column(children: [
                          SizedBox(
                            height: 5.5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 23.sp,
                                    color: Colors.blue,
                                  )),
                              Text(
                                "Check List",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: 'sofi',
                                  letterSpacing: 1,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.to(NotificationScreen());
                                      },
                                      icon: Icon(
                                        Icons.notifications_none_rounded,
                                        color: Colors.blue,
                                        size: 21.sp,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        scaffoldKey.currentState?.openDrawer();
                                      },
                                      icon: Icon(
                                        Icons.menu_rounded,
                                        color: Colors.blue,
                                        size: 23.sp,
                                      )),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 1.h),
                          searchBox1(),
                          SizedBox(height: 2.h),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 4.5.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        sel1 = index;
                                      });
                                      checklistap();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h, horizontal: 5.w),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: sel1 == index
                                              ? Colors.blue
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      child: Text(type[index],
                                          style: TextStyle(
                                              fontSize: 14.5.sp,
                                              fontFamily: 'sofi',
                                              color: sel1 == index
                                                  ? Colors.white
                                                  : Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1)),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(height: 2.h),
                          sel1 == 0
                              ? checklistmodal?.all?.length == 0 ||
                                      checklistmodal?.all?.length == null
                                  ? Container(
                                      height: 60.h,
                                      child: Text(
                                        "No CheckList",
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: 'sofi',
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ))
                                  : Container(
                                      height: 63.h,
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount:
                                            (checklistmodal?.all?.length),
                                        itemBuilder: (context, index) {
                                          return Container(
                                            child: Card(
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: checklistmodal
                                                                ?.all?[index]
                                                                .isCompleted ==
                                                            "1"
                                                        ? 2.h
                                                        : 1.h,
                                                    horizontal: 1.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            val = checklistmodal
                                                                        ?.all?[
                                                                            index]
                                                                        .isCompleted ==
                                                                    "1"
                                                                ? 0
                                                                : 1;
                                                          });
                                                          checklistmodal
                                                                      ?.all?[
                                                                          index]
                                                                      .isCompleted ==
                                                                  "1"
                                                              ? null
                                                              : markreadap(
                                                                  val,
                                                                  checklistmodal
                                                                      ?.all?[
                                                                          index]
                                                                      .id);
                                                        },
                                                        child: (checklistmodal
                                                                    ?.all?[
                                                                        index]
                                                                    .isCompleted ==
                                                                "1")
                                                            ? Icon(
                                                                Icons
                                                                    .check_box_rounded,
                                                                color:
                                                                    Colors.blue,
                                                                size: 22.sp,
                                                              )
                                                            : Icon(
                                                                Icons
                                                                    .check_box_outline_blank_rounded,
                                                                color: Colors
                                                                    .black54,
                                                                size: 22.sp,
                                                              )),
                                                    SizedBox(width: 3.w),
                                                    Container(
                                                      width: 65.w,
                                                      child: Text(
                                                        (checklistmodal
                                                                ?.all?[index]
                                                                .taskTitle)
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: (checklistmodal
                                                                        ?.all?[
                                                                            index]
                                                                        .isCompleted ==
                                                                    "1"
                                                                ? Colors.blue
                                                                : Colors
                                                                    .black87),
                                                            decoration: (checklistmodal
                                                                        ?.all?[
                                                                            index]
                                                                        .isCompleted ==
                                                                    "1"
                                                                ? TextDecoration
                                                                    .lineThrough
                                                                : TextDecoration
                                                                    .none),
                                                            decorationColor:
                                                                Colors.blue,
                                                            decorationThickness:
                                                                2,
                                                            fontSize: 13.sp,
                                                            fontFamily: 'sofi',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                    checklistmodal?.all?[index]
                                                                .isCompleted ==
                                                            "1"
                                                        ? Container()
                                                        : IconButton(
                                                            onPressed: () {
                                                              delet(
                                                                  checklistmodal
                                                                      ?.all?[
                                                                          index]
                                                                      .id);
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .delete_forever,
                                                              color: Colors.red,
                                                            ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                              : sel1 == 1
                                  ? checklistmodal?.todayAlerts?.length == 0 ||
                                          checklistmodal?.todayAlerts?.length ==
                                              null
                                      ? Container(
                                          height: 60.h,
                                          child: Text(
                                            "No CheckList",
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              fontFamily: 'sofi',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ))
                                      : Container(
                                          height: 63.h,
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            itemCount: (checklistmodal
                                                ?.todayAlerts?.length),
                                            itemBuilder: (context, index) {
                                              return Container(
                                                child: Card(
                                                  elevation: 2,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 1.h,
                                                            horizontal: 1.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                val = checklistmodal
                                                                            ?.todayAlerts?[index]
                                                                            .isCompleted ==
                                                                        "1"
                                                                    ? 0
                                                                    : 1;
                                                              });
                                                              markreadap(
                                                                  val,
                                                                  checklistmodal
                                                                      ?.todayAlerts?[
                                                                          index]
                                                                      .id);
                                                            },
                                                            child: (checklistmodal
                                                                        ?.todayAlerts?[
                                                                            index]
                                                                        .isCompleted ==
                                                                    "1")
                                                                ? Icon(
                                                                    Icons
                                                                        .check_box_rounded,
                                                                    color: Colors
                                                                        .blue,
                                                                    size: 22.sp,
                                                                  )
                                                                : Icon(
                                                                    Icons
                                                                        .check_box_outline_blank_rounded,
                                                                    color: Colors
                                                                        .black54,
                                                                    size: 22.sp,
                                                                  )),
                                                        SizedBox(width: 3.w),
                                                        Container(
                                                          width: 65.w,
                                                          child: Text(
                                                            (checklistmodal
                                                                    ?.todayAlerts?[
                                                                        index]
                                                                    .taskTitle)
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: (checklistmodal
                                                                            ?.todayAlerts?[
                                                                                index]
                                                                            .isCompleted ==
                                                                        "1"
                                                                    ? Colors
                                                                        .blue
                                                                    : Colors
                                                                        .black87),
                                                                decoration: (checklistmodal
                                                                            ?.todayAlerts?[
                                                                                index]
                                                                            .isCompleted ==
                                                                        "1"
                                                                    ? TextDecoration
                                                                        .lineThrough
                                                                    : TextDecoration
                                                                        .none),
                                                                decorationColor:
                                                                    Colors.blue,
                                                                decorationThickness:
                                                                    2,
                                                                fontSize: 13.sp,
                                                                fontFamily:
                                                                    'sofi',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                        IconButton(
                                                            onPressed: () {
                                                              delet(checklistmodal
                                                                  ?.todayAlerts?[
                                                                      index]
                                                                  .id);
                                                            },
                                                            icon: Icon(
                                                              Icons
                                                                  .delete_forever,
                                                              color: Colors.red,
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                  : sel1 == 2
                                      ? checklistmodal?.completed?.length ==
                                                  0 ||
                                              checklistmodal
                                                      ?.completed?.length ==
                                                  null
                                          ? Container(
                                              alignment: Alignment.center,
                                              height: 60.h,
                                              child: Text(
                                                "No CheckList",
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))
                                          : Container(
                                              alignment: Alignment.center,
                                              height: 63.h,
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: checklistmodal
                                                    ?.completed?.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    child: Card(
                                                      elevation: 2,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 2.h,
                                                                horizontal:
                                                                    1.w),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                                onTap: () {
                                                                  setState(() {
                                                                    val = checklistmodal?.completed?[index].isCompleted ==
                                                                            "1"
                                                                        ? 0
                                                                        : 1;
                                                                  });
                                                                },
                                                                child: (checklistmodal
                                                                            ?.completed?[index]
                                                                            .isCompleted ==
                                                                        "1")
                                                                    ? Icon(
                                                                        Icons
                                                                            .check_box_rounded,
                                                                        color: Colors
                                                                            .blue,
                                                                        size: 22
                                                                            .sp,
                                                                      )
                                                                    : Icon(
                                                                        Icons
                                                                            .check_box_outline_blank_rounded,
                                                                        color: Colors
                                                                            .black54,
                                                                        size: 22
                                                                            .sp,
                                                                      )),
                                                            SizedBox(
                                                                width: 3.w),
                                                            Container(
                                                              width: 78.w,
                                                              child: Text(
                                                                (checklistmodal
                                                                        ?.completed?[
                                                                            index]
                                                                        .taskTitle)
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: (checklistmodal?.completed?[index].isCompleted == "1"
                                                                        ? Colors
                                                                            .blue
                                                                        : Colors
                                                                            .black87),
                                                                    decoration: (checklistmodal?.completed?[index].isCompleted == "1"
                                                                        ? TextDecoration
                                                                            .lineThrough
                                                                        : TextDecoration
                                                                            .none),
                                                                    decorationColor:
                                                                        Colors
                                                                            .blue,
                                                                    decorationThickness:
                                                                        2,
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontFamily:
                                                                        'sofi',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            )
                                      : checklistmodal?.pending?.length == 0 ||
                                              checklistmodal?.pending?.length ==
                                                  null
                                          ? Container(
                                              alignment: Alignment.center,
                                              height: 60.h,
                                              child: Text(
                                                "No CheckList",
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))
                                          : Container(
                                              height: 63.h,
                                              child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount: checklistmodal
                                                    ?.pending?.length,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    child: Card(
                                                      elevation: 2,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8)),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 1.h,
                                                                horizontal:
                                                                    1.w),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceAround,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                setState(() {
                                                                  val = checklistmodal
                                                                              ?.pending?[index]
                                                                              .isCompleted ==
                                                                          "1"
                                                                      ? 0
                                                                      : 1;
                                                                });
                                                                markreadap(
                                                                    val,
                                                                    checklistmodal
                                                                        ?.pending?[
                                                                            index]
                                                                        .id);
                                                              },
                                                              child: checklistmodal
                                                                          ?.pending?[
                                                                              index]
                                                                          .isCompleted ==
                                                                      "1"
                                                                  ? Icon(
                                                                      Icons
                                                                          .check_box_rounded,
                                                                      color: Colors
                                                                          .blue,
                                                                      size:
                                                                          22.sp,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .check_box_outline_blank_rounded,
                                                                      color: Colors
                                                                          .black54,
                                                                      size:
                                                                          22.sp,
                                                                    ),
                                                            ),
                                                            SizedBox(
                                                                width: 3.w),
                                                            Container(
                                                              width: 65.w,
                                                              child: Text(
                                                                (checklistmodal
                                                                        ?.pending?[
                                                                            index]
                                                                        .taskTitle)
                                                                    .toString(),
                                                                style: TextStyle(
                                                                    color: (checklistmodal?.pending?[index].isCompleted == "1"
                                                                        ? Colors
                                                                            .blue
                                                                        : Colors
                                                                            .black87),
                                                                    decoration: (checklistmodal?.pending?[index].isCompleted == "1"
                                                                        ? TextDecoration
                                                                            .lineThrough
                                                                        : TextDecoration
                                                                            .none),
                                                                    decorationColor:
                                                                        Colors
                                                                            .blue,
                                                                    decorationThickness:
                                                                        2,
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontFamily:
                                                                        'sofi',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                            IconButton(
                                                                onPressed: () {
                                                                  delet(checklistmodal
                                                                      ?.pending?[
                                                                          index]
                                                                      .id);
                                                                },
                                                                icon: Icon(
                                                                  Icons
                                                                      .delete_forever,
                                                                  color: Colors
                                                                      .red,
                                                                ))
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                        ]),
                      ),
                      Positioned(
                        top: 91.5.h,
                        left: 25.w,
                        child: InkWell(
                            onTap: () {
                              Get.off(addchecklist());
                            },
                            child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(2.5.w),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Row(
                                  children: [
                                    Center(
                                        child: Icon(
                                      CupertinoIcons.add,
                                      size: 18.sp,
                                      color: Colors.white,
                                    )),
                                    Text(
                                      "Add Check List",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontFamily: 'sofi',
                                        letterSpacing: 1,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ))),
                      ),
                    ],
                  ),
                ),
              )),
      ),
    );
  }

  Widget checkdetails() {
    return Container(
      width: 80.w,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        // controller: _search,
        onChanged: (value) {},
        style: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Add Something',
          hintStyle: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        ),
      ),
    );
  }

  Widget searchBox1() {
    return Container(
      alignment: Alignment.center,
      width: 94.w,
      height: 6.5.h,
      padding: EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(65),
      ),
      child: TextField(
        controller: _search,
        onChanged: (value) {},
        style:
            TextStyle(color: Colors.black, fontSize: 13.sp, fontFamily: 'get'),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black.withOpacity(0.65),
            size: 25,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 35,
            minWidth: 40,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
              color: Colors.black.withOpacity(0.65), fontFamily: 'get'),
        ),
      ),
    );
  }

  checklistap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().checklistapi().then((response) async {
          checklistmodal = CheckListModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && checklistmodal?.status == "1") {
            print(checklistmodal?.todayAlerts?[0].taskTitle);
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

  markreadap(value, id) {
    print("api");
    print(value);
    final Map<String, String> data = {};
    data['isCompleted'] = value.toString();
    print(data);

    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().markcompletedapi(data, id).then((response) async {
          markcompletemodal =
              MarkcompletedModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && markcompletemodal?.status == "1") {
            checklistap();
          } else {
            buildErrorDialog(
                context, "Login Error", (userData?.message).toString());
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  delet(id) {
    showModalBottomSheet(
      backgroundColor: Colors.grey.shade100,
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
                    Text(
                      'Are You Sure You Want to Delete This Task ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: 'sofi',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          height: 0.17.h,
                          letterSpacing: 1),
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                  deleteap(id);
                                },
                                child: Container(
                                  width: 30.w,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.5.w),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Container(
                                  width: 30.w,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.5.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'sofi',
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
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
  }

  deleteap(id) {
    print("api");
    print(id);

    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().removetodoapi(id).then((response) async {
          removetodo = removeTodoModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && removetodo?.status == "1") {
            checklistap();
          } else {
            buildErrorDialog(
                context, "Login Error", (userData?.message).toString());
          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
