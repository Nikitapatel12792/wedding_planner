import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/BannerPage.dart';
import 'package:wedding_planner/screens/SupplierPage.dart';
import 'package:wedding_planner/screens/viewAllVenue.dart';
import 'package:wedding_planner/screens/view_all%20Categ.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class cate {
  String? image;
  String? name;

  cate(
    this.image,
    this.name,
  );
}

List<cate> Categories = [
  cate(
      'https://media.weddingz.in/images/bbda52972b1de50671f1b9de639610de/Anais-Events-6.jpg',
      'Wedding Decor'),
  cate(
      'https://i.pinimg.com/originals/1f/84/20/1f8420a90aacebb1e64255bc4d57c5ad.jpg',
      'Engagement Decor'),
  cate('https://m.media-amazon.com/images/I/71xdPvVRJwL.jpg',
      'Anniversary Decor'),
  cate(
      'https://content.jdmagicbox.com/comp/surat/z9/0261px261.x261.210715153040.p8z9/catalogue/om-yash-collection-ballon-decoration-vesu-surat-birthday-party-decorators-6evf9oecpb.jpg',
      'Birthday Decor'),
];
List<cate> venue = [
  cate(
      'https://media.weddingz.in/images/98203e459408c4f2f9c9014d9a6f669f/luxury-wedding-venues-in-surat-that-you-must-check-out-prior-to-finalizing-your-wedding-destination.jpg',
      'Dining Arrangement'),
  cate(
      'https://www.happywedding.app/blog/wp-content/uploads/2022/02/Wedding-Venues-in-Washington-State.jpg',
      'Garden Sitting Arrangement'),
  cate(
      'https://imgmedia.lbb.in/media/2019/04/5ca1cedf8722f4176f30d878_1554108127903.jpg',
      'Simple Walk-away Arrangement'),
  cate(
      'https://image.wedmegood.com/resized/540X/uploads/member/739856/1662626980_IMG_0378.jpg?crop=7,99,1139,641',
      'Engagement Arrangement'),

];
TextEditingController _search = TextEditingController();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer1(),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(children: [
            SizedBox(
              height: 7.h,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 92.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Hi, Zoro',
                            style: TextStyle(
                                fontSize: 22.sp,
                                fontFamily: 'get',
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                                color: Colors.pink),
                          ),
                          IconButton(
                              onPressed: () {
                                _scaffoldKey?.currentState?.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu_rounded,
                                color: Colors.pink,
                                size: 23.sp,
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Choose a Venue For Your Wedding',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'sofi',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                searchBox(),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                  height: 6.5.h,
                  width: 14.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(90),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          'https://i.pinimg.com/280x280_RS/fc/71/56/fc7156e9ddbd524ab1541d3942725efd.jpg',
                      progressIndicatorBuilder: (context, url, progress) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/icons/deprf.png',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'sofi',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(ViewAllCategory());
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'sofi',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.pink),
                        )),
                  ],
                ),
                SizedBox(height: 1.h),
                Container(
                  height: 18.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.pink.withOpacity(0.2),
                          ),
                          padding: EdgeInsets.all(2.w),
                          margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 1.w),
                                height: 9.h,
                                width: 30.w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        Categories[index].image.toString(),
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Center(
                                            child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Image.asset(
                                      'assets/icons/deprf.png',
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 1.h),
                              SizedBox(
                                  width: 30.w,
                                  child: Text(
                                    Categories[index].name.toString(),
                                    style: TextStyle(
                                        color: Colors.pink,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ],
                          ));
                    },
                    itemCount: Categories.length,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Wedding Suppliers',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'sofi',
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                      color: Colors.black),
                ),
                SizedBox(height: 1.h),
                Container(
                    height: 22.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.pink,
                    ),
                    padding: EdgeInsets.all(2.w),
                    margin: EdgeInsets.symmetric(horizontal: 1.5.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            height: 70.h,
                            width: 40.w,
                            child: Image.asset('assets/copl.png')),
                        SizedBox(width: 1.w),
                        SizedBox(
                          width: 44.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Special for you',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    fontFamily: 'sofi'),
                              ),
                              Text(
                                'A Offer for You. You can get 30 % off on all selected venue',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                    fontFamily: 'sofi'),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(MoodBordsScreen());
                                },
                                child: Container(
                                  width: 28.w,
                                  height: 5.h,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25.sp),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "Book Now",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.pink,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'sofi'),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Wedding Venue',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: 'sofi',
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.black),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(ViewAllVenue());
                        },
                        child: Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'sofi',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.pink),
                        )),
                  ],
                ),
                SizedBox(height: 1.h),
                SizedBox(
                  height: 29.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return
                          Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              height: 27.h,
                              width: 45.w,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 17.h,
                                    width: 45.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.fill,
                                        imageUrl: venue[index].image ?? '',
                                        progressIndicatorBuilder:
                                            (context, url, progress) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                          'assets/icons/deprf.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 1.5.h),
                                    child: Text(
                                      venue[index].name ?? '',
                                      style: TextStyle(
                                          fontFamily: 'get',
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                      },
                      itemCount: venue.length),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            )
          ]),
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      alignment: Alignment.center,
      width: 75.w,
      height: 6.h,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.pink.withOpacity(0.08),
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(90),
      ),
      child: TextField(
        controller: _search,
        onChanged: (value) {},
        style:
            TextStyle(color: Colors.black, fontSize: 12.sp, fontFamily: 'get'),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 25,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 35,
            minWidth: 40,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.black, fontFamily: 'get'),
        ),
      ),
    );
  }
}