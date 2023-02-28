import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskd/ui/product_list.dart';

import '../utils/utils.dart';

class AddProduct extends StatefulWidget {
  String name, price, qty, discount, des;
  int index;

  AddProduct(
      {Key? key,
      required this.name,
      required this.price,
      required this.discount,
      required this.qty,
      required this.des,
      required this.index})
      : super(
          key: key,
        );

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  @override
  initState() {
    setState(() {
      _controller.text = widget.name;
      _controller1.text = widget.price;
      _controller2.text = widget.qty;
      _controller3.text = widget.discount;
      _controller4.text = widget.des;
    });
    super.initState();
  }

  var snackBar1 = SnackBar(
    content: Text('All field are madatory'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Product',
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 50.h),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: ScreenUtil().screenWidth,
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 50.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            height: 45.h,
                            child: TextField(
                              controller: _controller,
                              textAlign: TextAlign.start,
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xff2879FF),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff2879FF)),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                hintText: 'Name',
                                filled: true,
                                fillColor: Color(0xffF4F4F4),
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Gilroy',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            height: 45.h,
                            child: TextField(
                              keyboardType: TextInputType.number,
                              controller: _controller1,
                              textAlign: TextAlign.start,
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xff2879FF),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff2879FF)),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                hintText: 'Price',
                                filled: true,
                                fillColor: Color(0xffF4F4F4),
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Gilroy',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 45.h,
                                  width: 100.w,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: _controller2,
                                    textAlign: TextAlign.start,
                                    cursorColor: Colors.black,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xff2879FF),
                                        ),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Color(0xff2879FF)),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      hintText: 'Qty',
                                      filled: true,
                                      fillColor: Color(0xffF4F4F4),
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Gilroy',
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 100.w,
                                  height: 45.h,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: _controller3,
                                    textAlign: TextAlign.start,
                                    cursorColor: Colors.black,
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1,
                                          color: Color(0xff2879FF),
                                        ),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1, color: Color(0xff2879FF)),
                                        borderRadius: BorderRadius.circular(7),
                                      ),
                                      hintText: 'Discount',
                                      filled: true,
                                      fillColor: Color(0xffF4F4F4),
                                      hintStyle: TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Gilroy',
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            height: 205.h,
                            child: TextField(
                              controller: _controller4,
                              maxLines: 10,
                              textAlign: TextAlign.start,
                              cursorColor: Colors.black,
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xff2879FF),
                                  ),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xff2879FF)),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                hintText: 'Description',
                                filled: true,
                                fillColor: Color(0xffF4F4F4),
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Gilroy',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          InkWell(
                            onTap: () async {
                              if (_controller.text.length > 0 &&
                                  _controller1.text.length > 0 &&
                                  _controller2.text.length > 0 &&
                                  _controller3.text.length > 0 &&
                                  _controller4.text.length > 0 &&
                                  widget.index == -1) {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                Util.name.add(_controller.text);
                                Util.price.add(_controller1.text);
                                Util.qty.add(_controller2.text);
                                Util.discount.add(_controller3.text);
                                Util.des.add(_controller4.text);
                                prefs.setStringList("string", Util.name);
                                prefs.setStringList("string1", Util.price);
                                prefs.setStringList("string2", Util.qty);
                                prefs.setStringList("string3", Util.discount);
                                prefs.setStringList("string4", Util.des);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductList()),
                                );
                              } else if (_controller.text.length > 0 &&
                                  _controller1.text.length > 0 &&
                                  _controller2.text.length > 0 &&
                                  _controller3.text.length > 0 &&
                                  _controller4.text.length > 0 &&
                                  widget.index != -1) {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();

                                Util.name[widget.index] = _controller.text;
                                Util.price[widget.index] = _controller1.text;
                                Util.qty[widget.index] = _controller2.text;
                                Util.discount[widget.index] = _controller3.text;
                                Util.des[widget.index] = _controller4.text;

                                prefs.setStringList("string", Util.name);
                                prefs.setStringList("string1", Util.price);
                                prefs.setStringList("string2", Util.qty);
                                prefs.setStringList("string3", Util.discount);
                                prefs.setStringList("string4", Util.des);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductList()),
                                );
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar1);
                              }
                            },
                            borderRadius: BorderRadius.circular(5.r),
                            child: Container(
                              width: 130.w,
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 15.h,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff2879FF),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Center(
                                child: Text(
                                  'Add',
                                  style: TextStyle(
                                    fontFamily: 'Gilroy',
                                    color: Colors.white,
                                    fontSize: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
