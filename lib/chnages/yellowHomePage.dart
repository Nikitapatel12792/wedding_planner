import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/Modal/AddtofavouriteModal.dart';
import 'package:wedding_planner/Modal/HomeModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/chnages/Meetings%20Page.dart';
import 'package:wedding_planner/new%20pages/Check%20List.dart';
import 'package:wedding_planner/screens/SupplierPage.dart';
import 'package:wedding_planner/widgets/bottamnav.dart';
import 'package:wedding_planner/widgets/buildErrorDialog.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/load.dart';

class YellowHomeScreen extends StatefulWidget {
  int? sele;

  YellowHomeScreen({super.key, required this.sele});

  @override
  State<YellowHomeScreen> createState() => _YellowHomeScreenState();
}

class cate {
  String? image;
  String? name;

  cate(
    this.image,
    this.name,
  );
}

class cate1 {
  String? image;
  String? name;
  String? desc;

  cate1(
    this.image,
    this.name,
    this.desc,
  );
}

class kop {
  String? image;
  String? name;
  String? dec;
  String? price;
  String? btn;

  kop(
    this.image,
    this.name,
    this.dec,
    this.price,
    this.btn,
  );
}

List<cate> Categories = [
  cate('https://cdn-icons-png.flaticon.com/512/6491/6491166.png', 'Wedding '),
  cate(
      'https://cdn-icons-png.flaticon.com/512/3436/3436370.png', 'Engagement '),
  cate('https://cdn-icons-png.flaticon.com/512/6117/6117300.png',
      'Anniversary '),
  cate('https://cdn-icons-png.flaticon.com/512/2454/2454313.png', 'Birthday '),
  cate('https://cdn-icons-png.flaticon.com/512/6491/6491166.png', 'Wedding '),
];
List<cate1> venue = [
  cate1(
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining',
      'A Big Hall with sitting'),
  cate1(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),
  cate1(
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining',
      'A Big Hall with sitting'),
  cate1(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),
  cate1(
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining',
      'A Big Hall with sitting'),
  cate1(
      'https://cdn0.weddingwire.in/vendor/3794/3_2/960/jpg/weddingvenue-surat-farms-lawnspace-4_15_413794-165648466054217.jpeg',
      'Royal Decor',
      'A Royal Decoration venue'),
];
TextEditingController _search = TextEditingController();
int sel = 1;
int? fav;

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
List<kop> Supaliers = [
  kop(
      "https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg",
      "Flower Suppliers",
      "Flower suppliers provide a wide range of fresh and beautiful flowers to meet various floral needs",
      "\$250",
      "View Detail"),
  kop(
      "https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg",
      "Flower Suppliers",
      "Flower suppliers provide a wide range of fresh and beautiful flowers to meet various floral needs",
      "\$250",
      "View Detail"),
  kop(
      "https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg",
      "Flower Suppliers",
      "Flower suppliers provide a wide range of fresh and beautiful flowers to meet various floral needs",
      "\$250",
      "View Detail"),
  kop(
      "https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg",
      "Flower Suppliers",
      "Flower suppliers provide a wide range of fresh and beautiful flowers to meet various floral needs",
      "\$250",
      "View Detail"),
  kop(
      "https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg",
      "Flower Suppliers",
      "Flower suppliers provide a wide range of fresh and beautiful flowers to meet various floral needs",
      "\$250",
      "View Detail"),
];

class _YellowHomeScreenState extends State<YellowHomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      sel = 1;
    });
    homeap();
  }

  int? sel1 = 0;
  int? mydata;
  bool isLoading = true;
  List<String> type = ["All Suppliers", "To Do", "Meeting"];

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        key: scaffoldKey,
        extendBody: true,
        drawer: drawer1(),
        body: isLoading
            ? Container()
            : SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 4.5.h,
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 92.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Hi, " +
                                              (homemodal?.userData?.groomName ==
                                                          null ||
                                                      homemodal?.userData
                                                              ?.groomName ==
                                                          ""
                                                  ? "N/A"
                                                  : (homemodal
                                                          ?.userData?.groomName)
                                                      .toString()) +
                                              " & " +
                                              (homemodal?.userData?.brideName ==
                                                          null ||
                                                      homemodal?.userData
                                                              ?.brideName ==
                                                          ""
                                                  ? "N/A"
                                                  : (homemodal
                                                          ?.userData?.brideName)
                                                      .toString()),
                                          style: TextStyle(
                                              fontSize: 23.sp,
                                              fontFamily: 'sofi',
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                              color: Colors.blue),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            scaffoldKey.currentState
                                                ?.openDrawer();
                                          },
                                          icon: Icon(
                                            Icons.menu_rounded,
                                            color: Colors.blue,
                                            size: 23.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: .50.h),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.date_range_outlined,
                                            color:
                                                Colors.black.withOpacity(0.75)),
                                        SizedBox(width: 2.w),
                                        Padding(
                                          padding: EdgeInsets.only(top: 0.4.h),
                                          child: Text(
                                            homemodal?.userData?.functionDate ==
                                                        null ||
                                                    homemodal?.userData
                                                            ?.functionDate ==
                                                        ""
                                                ? "N/A"
                                                : homemodal?.userData
                                                        ?.functionDate ??
                                                    "",
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                fontFamily: 'sofi',
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                                color: Colors.black
                                                    .withOpacity(0.75)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          searchBox(),
                        ],
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        height: 4.5.h,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    sel1 = index;
                                  });
                                  sel1 == 1
                                      ? Get.to(Check_list())
                                      : sel1 == 2
                                          ? Get.to(MeetingsPage(
                                              sele: 0,
                                            ))
                                          : Container();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 3.w),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: sel1 == index
                                          ? Colors.blue
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(25)),
                                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Text(type[index],
                                      style: TextStyle(
                                          fontSize: 14.sp,
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
                      SizedBox(
                        height: 3.h,
                      ),
                      homemodal?.suppliers?.length == 0
                          ? Text("No supplier.",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontFamily: 'sofi',
                                  color: Colors.white,
                                  letterSpacing: 1))
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (int index = 0;
                                      index <
                                          (homemodal?.suppliers?.length ?? 0);
                                      index++) ...[
                                    Container(
                                      width: 80.w,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2.w),
                                      padding: EdgeInsets.all(3.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: Colors.white),
                                      child: Stack(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 1.5.h,
                                              ),
                                              Container(
                                                // padding: EdgeInsets.all(5.sp),
                                                width: 80.w,
                                                height: 20.h,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),

                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                  child: CachedNetworkImage(
                                                    width: 80.w,
                                                    height: 20.h,
                                                    fit: BoxFit.contain,
                                                    imageUrl: homemodal
                                                            ?.suppliers?[index]
                                                            .profilePath ??
                                                        "",
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                progress) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Image.asset(
                                                      'assets/user.png',
                                                      color: Colors.black,
                                                      fit: BoxFit.contain,
                                                      width: 80.w,
                                                      height: 20.h,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.5.h,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 3.w),
                                                child: Text(
                                                    homemodal?.suppliers?[index]
                                                            .name ??
                                                        "",
                                                    style: TextStyle(
                                                        fontSize: 14.5.sp,
                                                        fontFamily: 'sofi',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                        letterSpacing: 1)),
                                              ),
                                              SizedBox(
                                                height: 1.5.h,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 3.w),
                                                child: Text(
                                                    homemodal?.suppliers?[index]
                                                            .service ??
                                                        "",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 14.5.sp,
                                                        fontFamily: 'sofi',
                                                        color: Colors.black54,
                                                        letterSpacing: 1)),
                                              ),
                                              SizedBox(
                                                height: 3.h,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 4.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text("Starting Price : ",
                                                        style: TextStyle(
                                                            fontSize: 14.5.sp,
                                                            fontFamily: 'sofi',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                Colors.black54,
                                                            letterSpacing: 1)),
                                                    Text(
                                                        "\$ " +
                                                            (homemodal
                                                                    ?.suppliers?[
                                                                        index]
                                                                    .cost)
                                                                .toString(),
                                                        style: TextStyle(
                                                            fontSize: 14.5.sp,
                                                            fontFamily: 'sofi',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            letterSpacing: 1))
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 4.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(SupplierfourScreen(
                                                        suppid: homemodal
                                                            ?.suppliers?[index]
                                                            .id,
                                                      ));
                                                    },
                                                    child: Container(
                                                      width: 50.w,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h,
                                                              horizontal: 5.w),
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      25)),
                                                      child: Center(
                                                        child: Text(
                                                            "View Detail",
                                                            style: TextStyle(
                                                                fontSize: 17.sp,
                                                                fontFamily:
                                                                    'sofi',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    1)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.5.h,
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                              left: 60.w,
                                              top: 1.5.h,
                                              child: Container(
                                                height: 10.w,
                                                width: 10.w,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        mydata = index;
                                                        fav = homemodal
                                                                    ?.suppliers?[
                                                                        index]
                                                                    .fav ==
                                                                "1"
                                                            ? 0
                                                            : 1;
                                                      });

                                                      favourite();
                                                    },
                                                    icon: homemodal
                                                                ?.suppliers?[
                                                                    index]
                                                                .fav ==
                                                            "1"
                                                        ? Icon(
                                                            Icons.favorite,
                                                            color: Colors.red,
                                                            size: 20.sp,
                                                          )
                                                        : Icon(
                                                            Icons
                                                                .favorite_border,
                                                            color: Colors.red,
                                                            size: 20.sp,
                                                          )),
                                              ))
                                        ],
                                      ),
                                    )
                                  ]
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ),
        bottomNavigationBar: bottomnavbar(selit: widget.sele),
      ),
    );
  }

  Widget searchBox() {
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

  homeap() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().homeapi().then((response) async {
          homemodal = HomeModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && homemodal?.status == "1") {
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

  favourite() {
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
                      homemodal?.suppliers?[mydata!].fav == "0"
                          ? 'Are You Sure You Want to add to favourite?'
                          : 'Are You Sure You Want to remove to favourite?',
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
                                  addtofavouriteap(
                                      homemodal?.suppliers?[mydata!].id,
                                      homemodal?.suppliers?[mydata!].serviceId);
                                },
                                child: Container(
                                  width: 30.w,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.5.w),
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(98)),
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
                                      color: Color(0xffffffff),
                                      borderRadius: BorderRadius.circular(98)),
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

  addtofavouriteap(String? supplierid, String? catid) {
    final Map<String, String> data = {};
    data['userID'] = (userData?.user?.id).toString();
    data['supplierID'] = supplierid.toString();
    data['categoryID'] = catid.toString();
    data['isFav'] = fav.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider().addtofavouriteapi(data).then((response) async {
          addtofavouritemodal =
              AddtofavouriteModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              addtofavouritemodal?.status == "1") {
            homeap();
            Get.back();
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
