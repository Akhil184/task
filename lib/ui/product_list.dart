import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskd/ui/add_product.dart';
import 'package:taskd/ui/product_details.dart';
import 'package:taskd/ui/view_cart.dart';

import '../utils/utils.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  late int tappedIndex;

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      Util.name =prefs.getStringList("string")!;
      Util.price =prefs.getStringList("string1")!;
      Util.qty =prefs.getStringList("string2")!;
      Util.discount =prefs.getStringList("string3")!;
      Util.des =prefs.getStringList("string4")!;
    });
  }

  @override
  initState(){
   getSharedPrefs();
   tappedIndex = -1;
   super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Product List',
          style: TextStyle(
            fontFamily:'Gilroy',
            color: Colors.white,
            fontSize:20.sp,
          ),
        ),
        centerTitle:true,
      ),

      floatingActionButton:FloatingActionButton(
        onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddProduct(name:'',price:'',qty:'',des:'',discount:'',index:-1,)),);
      },
        child:Icon(Icons.add),
      ),
      body:ListView(
        children: [
          Container(
      height:ScreenUtil().screenHeight/1.3,
          child:ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount:Util.price.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    tappedIndex=index;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductDetails(name:Util.name[tappedIndex],price:Util.price[tappedIndex],qty:Util.qty[tappedIndex],discount:Util.discount[tappedIndex], des:Util.des[tappedIndex],index:tappedIndex,)),);
                  });
                },
                child:Container(
                  height:130.h,
                  child: Card(
                    shape: tappedIndex == index ? new RoundedRectangleBorder(side: new BorderSide(color: Color(0xff2879FF), width: 1.0), borderRadius: BorderRadius.circular(7.0)) : new RoundedRectangleBorder(side: new BorderSide(color: Colors.white, width: 1.0), borderRadius: BorderRadius.circular(7.0)),
                    color:Colors.white,
                    child:Column(
                      mainAxisAlignment:MainAxisAlignment.spaceAround,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                    children:[

                        Text(
                          'Name:\n${Util.name[index] ?? 'empty'}',
                          style: TextStyle(
                            color:Colors.black,
                            fontFamily:'Gilroy',
                            fontSize: 15.sp,
                          ),
                        ),
                    Text(
                      'Qty:\n${Util.qty[index] ?? 'empty'}',
                      style: TextStyle(
                        color:Colors.black,
                        fontFamily:'Gilroy',
                        fontSize: 15.sp,
                      ),
                    ),
                      SizedBox(width:1.w,),
                      Icon(
                        Icons.arrow_right_alt,
                      ),
                        ],
                        ),
                        Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                          children:[
                        Text(
                         'Price:\n${Util.price[index] ?? 'empty'}',
                          style: TextStyle(
                            color:Colors.black,
                            fontFamily:'Gilroy',
                            fontSize:15.sp,
                          ),
                        ),
                            Text(
                             'Discount:\n${Util.discount[index] ?? 'empty'}',
                              style: TextStyle(
                                color:Colors.black,
                                fontFamily:'Gilroy',
                                fontSize:15.sp,
                              ),
                            ),
                            SizedBox(width:45.w,),
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
        Padding(padding:EdgeInsets.only(left:70.w,right:70.w,top:20.h),
          child:InkWell(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewCart()),);
            },
            borderRadius: BorderRadius.circular(5.r),
            child: Container(
              width:150.h,
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 15.h,
              ),
              decoration: BoxDecoration(
                color:Color(0xff2879FF),
                borderRadius: BorderRadius.circular(5.r),
              ),
              child:Center(
                child:Text('View Cart',
                  style: TextStyle(
                    fontFamily:'Gilroy',
                    color: Colors.white,
                    fontSize:15.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
        ],
      )
    );
  }
}
