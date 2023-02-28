import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class ViewCart extends StatefulWidget {
  const ViewCart({Key? key}) : super(key: key);

  @override
  State<ViewCart> createState() => _ViewCartState();
}

class _ViewCartState extends State<ViewCart> {
  int totalPrice = 0, totalDiscount = 0;

  @override
  initState() {
    setState(() {
      for (int i = 0; i < Util.price.length; i++) {
        totalPrice = int.parse(Util.price[i]) + totalPrice;
        totalDiscount = int.parse(Util.discount[i]) + totalDiscount;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'View Cart',
            style: TextStyle(
              fontFamily: 'Gilroy',
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            Container(
              height: ScreenUtil().screenHeight / 2,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: Util.price.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {});
                    },
                    child: Container(
                      height: 100.h,
                      child: Card(
                        //shape: tappedIndex == index ? new RoundedRectangleBorder(side: new BorderSide(color: Color(0xff2879FF), width: 1.0), borderRadius: BorderRadius.circular(7.0)) : new RoundedRectangleBorder(side: new BorderSide(color: Colors.white, width: 1.0), borderRadius: BorderRadius.circular(7.0)),
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Name:\n${Util.name[index] ?? 'empty'}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gilroy',
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  'Qty:\n${Util.qty[index] ?? 'empty'}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gilroy',
                                    fontSize: 15.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 60.w,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Price:\n${Util.price[index] ?? 'empty'}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gilroy',
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  'Discount:\n${Util.discount[index] ?? 'empty'}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gilroy',
                                    fontSize: 15.sp,
                                  ),
                                ),
                                SizedBox(
                                  width: 45.w,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: ScreenUtil().screenWidth,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 50.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price:${totalPrice * 5 / 100 + totalPrice}',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Gilroy',
                              fontSize: 17.sp,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Total Tax:5%',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Gilroy',
                              fontSize: 17.sp,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Total discount:${totalDiscount}',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Gilroy',
                              fontSize: 17.sp,
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'Total Estimated  Price:${totalPrice * 5 / 100 + totalPrice - totalDiscount}',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Gilroy',
                              fontSize: 17.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
