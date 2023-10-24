import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wedding_planner/Chat/msg2.dart';
import 'package:wedding_planner/Modal/QouteDetailsModal.dart';
import 'package:wedding_planner/Modal/QuotationAcceptModal.dart';
import 'package:wedding_planner/Provider/taskprovider.dart';
import 'package:wedding_planner/widgets/const.dart';
import 'package:wedding_planner/widgets/drawer.dart';
import 'package:wedding_planner/widgets/load.dart';

import '../widgets/buildErrorDialog.dart';

class quotedetailpage extends StatefulWidget {
  String? Qid;

  quotedetailpage({super.key, this.Qid});

  @override
  State<quotedetailpage> createState() => _quotedetailpageState();
}

class _quotedetailpageState extends State<quotedetailpage> {
  int ind = 0;
  bool isLoading = true;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List HotelIm = [
    'https://4.imimg.com/data4/JB/XG/MY-11819618/wedding-flower-decoration.jpg',
    'https://balloonpro.in/wp-content/uploads/2023/06/20210306_090946.jpg',
    'https://content.jdmagicbox.com/comp/ahmedabad/a8/079pxx79.xx79.190719110521.s4a8/catalogue/lilly-s-flower-decoration-and-gift-shop-ghatlodiya-ahmedabad-decorators-ypttjhzlti.jpg?clr=',
  ];

  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      ind = 0;
      isLoading = true;
    });
    QuoteApi();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        drawer: drawer1(),
        key: scaffoldKey,
        body: isLoading
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 6.h,
                        ),
                        Stack(
                          children: [
                            CarouselSlider.builder(
                              itemCount: HotelIm.length,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(0),
                                        ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: CachedNetworkImage(
                                        imageUrl: HotelIm[index],
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, progress) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'assets/deprf.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              options: CarouselOptions(
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      ind = index;
                                      print(ind);
                                    });
                                  },
                                  viewportFraction: 1,
                                  enableInfiniteScroll: false,
                                  pageSnapping: true,
                                  height: 32.h,
                                  padEnds: true,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.2),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 1.5.w,
                                vertical: 0.6.h,
                              ),
                              child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                      height: 5.h,
                                      width: 10.w,
                                      // padding: EdgeInsets.all(2.w),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.blue),
                                      child: Icon(
                                        CupertinoIcons.back,
                                        color: Colors.white,
                                        size: 23.sp,
                                      ))),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(80)),
                          padding: EdgeInsets.symmetric(
                              vertical: 0.5.h, horizontal: 3.w),
                          child: AnimatedSmoothIndicator(
                            activeIndex: ind,
                            count: HotelIm.length,
                            effect: ScrollingDotsEffect(
                              activeDotColor: Colors.blue,
                              activeStrokeWidth: 2.6,
                              activeDotScale: 1.2,
                              strokeWidth: 9,
                              maxVisibleDots: 5,
                              radius: 8,
                              spacing: 9,
                              dotHeight: 10,
                              dotWidth: 10,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2.h),
                              Text(
                                quotedetailsmodal
                                        ?.details?.supplier?.categoryName ??
                                    '',
                                style: TextStyle(
                                    fontSize: 19.sp,
                                    color: Colors.blue,
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                quotedetailsmodal?.details?.supplier?.name ??
                                    '',
                                style: TextStyle(
                                    height: 1.5,
                                    fontSize: 16.sp,
                                    color: Colors.grey,
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 1.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        child: Icon(
                                          CupertinoIcons.mail,
                                          color: Colors.blue,
                                          size: 18.sp,
                                        ),
                                      ),
                                      SizedBox(width: 3.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            // width: 75.w,
                                            child: Text(
                                              quotedetailsmodal
                                                              ?.details
                                                              ?.supplier
                                                              ?.email ==
                                                          '' ||
                                                      quotedetailsmodal
                                                              ?.details
                                                              ?.supplier
                                                              ?.email ==
                                                          null
                                                  ? 'N/A'
                                                  : quotedetailsmodal?.details
                                                          ?.supplier?.email ??
                                                      '',
                                              style: TextStyle(
                                                  height: 1.5,
                                                  fontSize: 14.sp,
                                                  color: Colors.grey,
                                                  fontFamily: 'sofi',
                                                  letterSpacing: 1,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  quotedetailsmodal?.details?.status == '0'
                                      ? InkWell(
                                          onTap: () {
                                            QuoteAcceptApi();
                                          },
                                          child: Container(
                                            height: 5.5.h,
                                            width: 40.w,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.blue),
                                              borderRadius:
                                                  BorderRadius.circular(25.sp),
                                            ),
                                            child: Center(
                                                child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.check_circle,
                                                    color: Colors.blue),
                                                SizedBox(width: 2.w),
                                                Text(
                                                  "Accept",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      color: Colors.blue,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: 'get'),
                                                ),
                                              ],
                                            )),
                                          ),
                                        )
                                      : InkWell(
                                          onTap: () {},
                                          child: Container(
                                            height: 5.5.h,
                                            width: 40.w,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              border: Border.all(
                                                  color: Colors.blue),
                                              borderRadius:
                                                  BorderRadius.circular(25.sp),
                                            ),
                                            child: Center(
                                                child: Text(
                                              "Accepted",
                                              style: TextStyle(
                                                  fontSize: 13.sp,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'get'),
                                            )),
                                          ),
                                        ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(Msg2(
                                        img: quotedetailsmodal
                                            ?.details?.supplier?.profile,
                                        name: quotedetailsmodal
                                            ?.details?.supplier?.name,
                                        id: quotedetailsmodal
                                            ?.details?.supplier?.id,
                                      ));
                                    },
                                    child: Container(
                                      height: 5.5.h,
                                      width: 42.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(25.sp),
                                      ),
                                      child: Center(
                                          child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.message,
                                              color: Colors.blue),
                                          SizedBox(width: 2.w),
                                          Text(
                                            "Chat now",
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'get'),
                                          ),
                                        ],
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3.5.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'About',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.blue,
                                            fontFamily: 'sofi',
                                            letterSpacing: 1,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 1.h),
                                      SizedBox(
                                        width: 88.w,
                                        child: ReadMoreText(
                                          quotedetailsmodal?.details?.supplier
                                                          ?.description ==
                                                      '' ||
                                                  quotedetailsmodal
                                                          ?.details
                                                          ?.supplier
                                                          ?.description ==
                                                      null
                                              ? 'N/A'
                                              : quotedetailsmodal?.details
                                                      ?.supplier?.description ??
                                                  '',
                                          trimLines: 4,
                                          trimLength: 130,
                                          style: TextStyle(
                                              height: 1.5,
                                              fontSize: 13.sp,
                                              color: Colors.grey.shade700,
                                              fontFamily: 'sofi',
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.bold),
                                          colorClickableText: Colors.blue,
                                          trimMode: TrimMode.Length,
                                          trimCollapsedText: 'Read More',
                                          trimExpandedText: ' Read Less',
                                          moreStyle: TextStyle(
                                              fontSize: 13.sp,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                          lessStyle: TextStyle(
                                              fontSize: 13.sp,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Text(
                                'Photos',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.blue,
                                    fontFamily: 'sofi',
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                              Container(
                                height: 22.h,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: 40.w,
                                        margin: EdgeInsets.only(right: 3.w),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: CachedNetworkImage(
                                            imageUrl: HotelIm[index],
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder: (context,
                                                    url, progress) =>
                                                Center(
                                                    child:
                                                        CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                              'assets/deprf.png',
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: 2.5.h,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  QuoteApi() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider()
            .QuoteDetailsApi(widget.Qid.toString())
            .then((response) async {
          quotedetailsmodal =
              QouteDetailsModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && quotedetailsmodal?.status == "1") {
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

  QuoteAcceptApi() {
    checkInternet().then((internet) async {
      if (internet) {
        taskprovider()
            .QuoteAcceptApi(widget.Qid.toString())
            .then((response) async {
          qouteacceptmodal =
              QouteAcceptModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && qouteacceptmodal?.status == "1") {
            Fluttertoast.showToast(
                msg: "Response Accepted Successfully",
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                fontSize: 11.sp);
            QuoteApi();
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