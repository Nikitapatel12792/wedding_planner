import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/AddguestModal.dart';
import 'package:wedding_planner/Modal/RemoveguestModal.dart';
import 'package:wedding_planner/Modal/ViewguestModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/main.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/load.dart';

class GuestList extends StatefulWidget {
  const GuestList({super.key});

  @override
  State<GuestList> createState() => _GuestListState();
}

int sel1 = 1;

class _GuestListState extends State<GuestList> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _relation = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isKeyboardOpen = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sel1 = 1;
    });
    viewguestap();
  }
int? select =0;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      scaffold: Scaffold(
          backgroundColor: Colors.grey.shade100,
        key: scaffoldKey,
        drawer: drawer1(),
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    children: [
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                Get.back();
                              },
                              icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.blue,size: 23.sp,)),
                          Text(
                            'Guest List',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: 'sofi',
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                letterSpacing: 1),
                          ),
                          IconButton(
                              onPressed: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              icon: Icon(Icons.menu_rounded,size: 23.sp,color: Colors.blue,)),
                        ],
                      ),
                      SizedBox(height: 1.5.h),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                sel1 = 1;
                              });
                              viewguestap();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.3.h, horizontal: 10.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: sel1 == 1 ? Colors.blue : Colors.white,
                                  borderRadius: BorderRadius.circular(9)),
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Text('Bride',
                                  style: TextStyle(
                                      fontSize: 14.5.sp,
                                      fontFamily: 'sofi',
                                      color: sel1 == 1
                                          ? Colors.white
                                          : Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1)),
                            ),
                          ),
                          SizedBox(width: 0.w),
                          InkWell(
                            onTap: () {
                              setState(() {
                                sel1 = 2;
                              });
                              viewguestap();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 1.3.h, horizontal: 10.w),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: sel1 == 2 ? Colors.blue : Colors.white,
                                  borderRadius: BorderRadius.circular(9)),
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Text('Groom',
                                  style: TextStyle(
                                      fontSize: 14.5.sp,
                                      fontFamily: 'sofi',
                                      color: sel1 == 2
                                          ? Colors.white
                                          : Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      sel1 == 2
                          ? Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Groom\'s Guests (' +
                                          (viewguestmodal?.guestlist
                                                  ?.groomGuestList?.length)
                                              .toString() +
                                          ')',
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          fontFamily: 'sofi',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      'Remove',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: 'sofi',
                                          color:
                                              Colors.black87.withOpacity(0.7),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 70.h,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 0.5.h),
                                      Container(
                                        height: 69.h,
                                        child: ListView.builder(
                                          itemCount: viewguestmodal?.guestlist
                                              ?.groomGuestList?.length,
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3.w,
                                                  vertical: 1.h),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 1.h),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white,
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Icon(Icons.person),
                                                            SizedBox(
                                                              width: 3.w,
                                                            ),
                                                            Text(
                                                              viewguestmodal
                                                                      ?.guestlist
                                                                      ?.groomGuestList?[
                                                                          index]
                                                                      .guestName ??
                                                                  "",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.sp,
                                                                  fontFamily:
                                                                      'sofi',
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 0.7.h),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons.phone,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.67),
                                                              ),
                                                              SizedBox(
                                                                width: 3.w,
                                                              ),
                                                              Text(
                                                                viewguestmodal
                                                                        ?.guestlist
                                                                        ?.groomGuestList?[
                                                                            index]
                                                                        .guestContact ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontFamily:
                                                                        'sofi',
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.67),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    letterSpacing:
                                                                        1),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 0.7.h),
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .email_outlined,
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.67),
                                                              ),
                                                              SizedBox(
                                                                width: 3.w,
                                                              ),
                                                              Text(
                                                                viewguestmodal
                                                                        ?.guestlist
                                                                        ?.groomGuestList?[
                                                                            index]
                                                                        .guestEmail ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    fontFamily:
                                                                        'sofi',
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.67),
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    letterSpacing:
                                                                        1),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        setState((){
                                                          select = index;
                                                        });
                                                        delet();
                                                      },
                                                      icon: Icon(
                                                        CupertinoIcons
                                                            .delete_solid,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ])
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 72.5.h,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          addguest();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 60.w,
                                          padding: EdgeInsets.all(2.5.w),
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
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
                                                'Add Guests',
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
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Bride\'s Guests (' +
                                          (viewguestmodal?.guestlist
                                                  ?.brideGuestList?.length)
                                              .toString() +
                                          ')',
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          fontFamily: 'sofi',
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                    Text(
                                      'Remove',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: 'sofi',
                                          color:
                                              Colors.black87.withOpacity(0.7),
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 70.h,
                                  child: Column(children: [
                                    SizedBox(height: 0.5.h),
                                    Container(
                                      height: 69.h,
                                      child: ListView.builder(
                                        itemCount: viewguestmodal
                                            ?.guestlist?.brideGuestList?.length,
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, index) {
                                          return  Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 3.w,
                                                vertical: 1.h),
                                            margin: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(Icons.person),
                                                              SizedBox(
                                                                width: 3.w,
                                                              ),
                                                              Text(
                                                                viewguestmodal
                                                                    ?.guestlist
                                                                    ?.brideGuestList?[
                                                                index]
                                                                    .guestName ??
                                                                    "",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                    15.sp,
                                                                    fontFamily:
                                                                    'sofi',
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                    letterSpacing:
                                                                    1),
                                                              ),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                            EdgeInsets.only(
                                                                top: 0.7.h),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                              children: [
                                                                Icon(
                                                                  Icons.phone,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                      0.67),
                                                                ),
                                                                SizedBox(
                                                                  width: 3.w,
                                                                ),
                                                                Text(
                                                                  viewguestmodal
                                                                      ?.guestlist
                                                                      ?.brideGuestList?[
                                                                  index]
                                                                      .guestContact ??
                                                                      "",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      13.sp,
                                                                      fontFamily:
                                                                      'sofi',
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                          0.67),
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                      letterSpacing:
                                                                      1),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            EdgeInsets.only(
                                                                top: 0.7.h),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .email_outlined,
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                      0.67),
                                                                ),
                                                                SizedBox(
                                                                  width: 3.w,
                                                                ),
                                                                Text(
                                                                  viewguestmodal
                                                                      ?.guestlist
                                                                      ?.brideGuestList?[
                                                                  index]
                                                                      .guestEmail ??
                                                                      "",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      13.sp,
                                                                      fontFamily:
                                                                      'sofi',
                                                                      color: Colors
                                                                          .black
                                                                          .withOpacity(
                                                                          0.67),
                                                                      fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                      letterSpacing:
                                                                      1),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          setState((){
                                                            select = index;
                                                          });
                                                          delet();
                                                        },
                                                        icon: Icon(
                                                          CupertinoIcons
                                                              .delete_solid,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                    ])
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ]),
                                ),
                                Positioned(
                                  top: 72.5.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          addguest();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 60.w,
                                          padding: EdgeInsets.all(2.5.w),
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
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
                                                'Add Guests',
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
                                ),
                              ],
                            ),
                    ],
                  ),
                ),
              ),
      ),
      isLoading: isLoading,
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
          hintText: 'Guest Name',
          hintStyle: TextStyle(color: Colors.black, fontFamily: 'Meta1'),
        ),
      ),
    );
  }

  addguest() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            sel1 == 1
                                ? 'Add Bride\'s Guest'
                                : 'Add Groom\'s Guest',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'sofi',
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1),
                          ),
                          SizedBox(height: 2.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Name :',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'sofi',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                SizedBox(height: 1.h),
                                Container(
                                  child: TextFormField(
                                    controller: _name,
                                    // controller: _search,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter the guest name";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.67),
                                        fontFamily: 'Meta1'),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.12),
                                      hintText: 'Guest Name',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.67),
                                          fontFamily: 'Meta1'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  'Phone :',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'sofi',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                SizedBox(height: 1.h),
                                Container(
                                  child: TextFormField(
                                    controller: _phone,
                                    // controller: _search,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter the guest phone number";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.67),
                                        fontFamily: 'Meta1'),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.12),
                                      hintText: 'Guest Phone',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.67),
                                          fontFamily: 'Meta1'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  'Email :',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'sofi',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                SizedBox(height: 1.h),
                                Container(
                                  child: TextFormField(
                                    controller: _email,
                                    // controller: _search,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter the guest email";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.67),
                                        fontFamily: 'Meta1'),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.12),
                                      hintText: 'Guest Email',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.67),
                                          fontFamily: 'Meta1'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  'Relation with bride/groom :',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: 'sofi',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                                SizedBox(height: 1.h),
                                Container(
                                  child: TextFormField(
                                    controller: _relation,
                                    // controller: _search,
                                    onChanged: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter the relation with bride/groom";
                                      }
                                      return null;
                                    },
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.67),
                                        fontFamily: 'Meta1'),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.12),
                                      hintText: 'Relation',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.67),
                                          fontFamily: 'Meta1'),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        addguestap();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.all(2.5.w),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(10)),
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
                                              'Add Guest',
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
                                SizedBox(height: 2.h),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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
          ),
        );
      },
    );
  }

  addguestap() {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['guest_name'] = _name.text.toString();
      data['guest_email'] = _email.text.toString();
      data['guest_phone'] = _phone.text.toString();
      data['bride_or_groom'] = sel1 == 1 ? "bride " : "groom";
      data['guest_relation'] = _relation.text.toString();
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          taskprovider().addguestapi(data).then((response) async {
            addguestmodal = AddguestModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && addguestmodal?.status == "1") {
              print(addguestmodal?.message);
              _name.text = "";
              _phone.text = "";
              _email.text = "";
              _relation.text = "";
              Get.back();
            } else {}
          });
        } else {
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
  }

  viewguestap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().viewguestapi().then((response) async {
          viewguestmodal = ViewguestModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && viewguestmodal?.status == "1") {
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

  delet() {
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
                    Text(
                     sel1==1? 'Are You Sure You Want to Delete This Bride\'s Guest ?' :'Are You Sure You Want to Delete This Groom\'s Guest ?' ,
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
                                  deletap();
                                },
                                child: Container(
                                  width: 30.w,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.5.w),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(10)),
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
                                        color: Colors.blue,
                                      ),
                                      color: Color(0xfff4f4f4),
                                      borderRadius: BorderRadius.circular(10)),
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
  deletap(){
  String? value = sel1 == 1 ? (viewguestmodal?.guestlist?.brideGuestList?[select!].id) : viewguestmodal?.guestlist?.groomGuestList?[select!].id ;
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().removeguestapi(value).then((response) async {
          removeguestmodal = RemoveguestModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && removeguestmodal?.status == "1") {
            print(removeguestmodal?.message);
          viewguestap();
          Get.back();
          } else {}
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
