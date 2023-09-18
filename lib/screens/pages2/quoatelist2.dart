import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:wedding_planner/screens/pages2/QuateDetails.dart';
import 'package:wedding_planner/widgets/drawer.dart';

class QuoateList2 extends StatefulWidget {
  const QuoateList2({super.key});

  @override
  State<QuoateList2> createState() => _QuoateList2State();
}

TextEditingController _search = TextEditingController();

class chat {
  String? image;
  String? name;
  String? type;
  String? date;
  String? details;

  chat(
    this.image,
    this.name,
    this.type,
    this.date,
    this.details,
  );
}

List<chat> mesgs = [
  chat(
      'https://e1.pxfuel.com/desktop-wallpaper/238/852/desktop-wallpaper-masque-luffy-smiling-luffy-smile-thumbnail.jpg',
      'Luffy',
      'Flower Decor',
      '22-08-2023',
      'A decorations full of Flowers with dif dif flowers'),
  chat(
      'https://static.wikia.nocookie.net/fictionalfighters/images/4/48/Sanji.png/revision/latest?cb=20150406032640',
      'Sanji',
      'Cake Decor',
      '20-03-2024',
      'A decorations for Cake as You want.'),
  chat(
      'https://w0.peakpx.com/wallpaper/311/533/HD-wallpaper-one-piece-nico-robin-one-piece-two-years-later.jpg',
      'Robin',
      'Chair Decor',
      '17-05-2023',
      'A decorations of chair like arrangements , sitting types etc'),
  chat(
      'https://i.pinimg.com/736x/59/e3/d2/59e3d2fb93af21511690470abc014831.jpg',
      'Nami',
      'Room Decor',
      '15-09-2024',
      'A decorations for your room special as like you'),
  chat(
      'https://i.pinimg.com/236x/23/62/50/236250f1055a352c4a0cd5e0a21aaf33.jpg',
      'Chopper',
      'Garden Decor',
      '12-10-2024',
      'A decorations of your garden'),
  chat(
      'https://w0.peakpx.com/wallpaper/311/533/HD-wallpaper-one-piece-nico-robin-one-piece-two-years-later.jpg',
      'Robin',
      'Chair Decor',
      '17-05-2023',
      'A decorations of chair like arrangements , sitting types etc'),
  chat(
      'https://i.pinimg.com/736x/59/e3/d2/59e3d2fb93af21511690470abc014831.jpg',
      'Nami',
      'Room Decor',
      '15-09-2024',
      'A decorations for your room special as like you'),
  chat(
      'https://i.pinimg.com/236x/23/62/50/236250f1055a352c4a0cd5e0a21aaf33.jpg',
      'Chopper',
      'Garden Decor',
      '12-10-2024',
      'A decorations of your garden'),
];

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _QuoateList2State extends State<QuoateList2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      drawer: drawer1(),
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                      )),
                  Text(
                    "Quotation List",
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'sofi',
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: Icon(
                        Icons.menu_rounded,
                      ))
                ],
              ),
              SizedBox(height: 1.h),
              searchBox(),
              SizedBox(height: 1.h),
              SizedBox(
                height: 79.h,
                child: ListView.builder(
                  itemCount: mesgs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 1.h, bottom: 1.h),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                // Color of the shadow
                                offset: Offset(0, 1.5),
                                // Offset of the shadow (x, y)
                                blurRadius: 8, // Spread of the shadow
                                // How much the shadow extends
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              height: 8.h,
                              width: 16.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: mesgs[index].image ?? '',
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
                            SizedBox(
                              width: 5.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 68.w,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        mesgs[index].name ?? '',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1,
                                            fontFamily: 'sofi',
                                            color: Colors.black),
                                      ),
                                      Text(
                                        mesgs[index].date ?? '',
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'sofi',
                                            color:
                                                Colors.black.withOpacity(0.5)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 0.8.h),
                                SizedBox(
                                  width: 66.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 52.w,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              mesgs[index].type ?? '',
                                              maxLines: 2,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black
                                                    .withOpacity(0.75),
                                              ),
                                            ),
                                            SizedBox(height: 0.8.h),
                                            Text(
                                              mesgs[index].details ?? '',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'sofi',
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          print('right');
                                          Get.to(QuatationDetails2());
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(2.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: Colors.pink),
                                          child: Icon(
                                            CupertinoIcons.arrow_right,
                                            color: Colors.white,
                                            size: 18.sp,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 3.w,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  padding: EdgeInsets.zero,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      width: 95.w,
      height: 6.5.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            // Color of the shadow
            offset: Offset(0, 2.5),
            // Offset of the shadow (x, y)
            blurRadius: 4, // Spread of the shadow
            // How much the shadow extends
          ),
        ],
      ),
      child: TextField(
        cursorColor: Colors.black,
        controller: _search,
        onChanged: (value) {},
        style: TextStyle(
          color: Colors.black,
          fontSize: 12.sp,
          fontFamily: 'get',
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.black,
          ),
          focusedBorder: InputBorder.none,
          // Remove border when focused
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(
            fontSize: 15.sp,
            letterSpacing: 1,
            fontFamily: 'Sofi',
            fontWeight: FontWeight.w700,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
