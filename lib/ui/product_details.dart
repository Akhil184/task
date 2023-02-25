import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskd/ui/product_list.dart';

import 'add_product.dart';

class ProductDetails extends StatefulWidget {
  String name,price,qty,discount,des;
  int index;

  ProductDetails({Key? key,required this.name,required this.price,required this.discount,required this.qty,required this.des,required this.index}) : super(key: key,);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

  int counter= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Row(
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          children: [
        Text('Product Details',style: TextStyle(
        fontFamily:'Gilroy',
        color: Colors.white,
        fontSize:20.sp,
      ),
        ),
        InkWell(
          onTap: () async {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddProduct(name:widget.name,price:widget.price,qty:widget.qty,des:widget.des,discount:widget.discount, index:widget.index,)),);
          },
          borderRadius: BorderRadius.circular(5.r),
          child: Container(
            width:60.h,
            height:40.h,
            padding: EdgeInsets.symmetric(
              horizontal: 15.w,
              vertical: 15.h,
            ),
            decoration: BoxDecoration(
              color:Color(0xff2879FF),//pp
              borderRadius: BorderRadius.circular(5.r),
            ),
            child:Center(
              child:Text('Edit',
                style: TextStyle(
                  fontFamily:'Gilroy',
                  color: Colors.white,
                  fontSize:10.sp,
                ),
              ),
            ),
          ),
        ),
        ],
        ),
        centerTitle: true,
      ),
      body:ListView(
        children:[
        Expanded(
        child:Padding(padding:EdgeInsets.only(left:20.w,right:20.w,top:50.h),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
        width: ScreenUtil().screenWidth,
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 50.h),
        decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20.r),
    color:Colors.white,
    ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children:[
                  Text(
                    'Name:${widget.name ?? 'empty'}',
                    style: TextStyle(
                      color:Colors.black,
                      fontFamily:'Gilroy',
                      fontSize: 17.sp,
                    ),
                  ),
                  Text(
                    'Qty:${widget.qty?? 'empty'}',
                    style: TextStyle(
                      color:Colors.black,
                      fontFamily:'Gilroy',
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(height:20.h,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children:[
                  Text(
                    'Price:${widget.price ?? 'empty'}',
                    style: TextStyle(
                      color:Colors.black,
                      fontFamily:'Gilroy',
                      fontSize: 17.sp,
                    ),
                  ),
                  Text(
                    'Discount:${widget.discount ?? 'empty'}',
                    style: TextStyle(
                      color:Colors.black,
                      fontFamily:'Gilroy',
                      fontSize: 17.sp,
                    ),
                  ),
                ],
              ),
             Padding(padding:EdgeInsets.only(top:30.h,right:100.w),
              child:Text(
                'Description:\n${widget.des ?? 'empty'}',
                style: TextStyle(
                  color:Colors.black,
                  fontWeight:FontWeight.bold,
                  fontFamily:'Gilroy',
                  fontSize: 20.sp,
                ),
              ),
             ),
              SizedBox(height:20.h,),
              Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children:[
              IconButton(
                icon: Icon(
                  Icons.remove,
                  color: Theme.of(context).accentColor,
                ),
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
                iconSize: 32.0,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  setState(() {
                      counter--;
                    }
                  );
                },
              ),
              Text(
                '$counter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).accentColor,
                ),
                padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
                iconSize: 32.0,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  setState(() {
                      counter++;
                    }
                  );
                },
              ),
                  Text(
                    'Total Price',
                    style: TextStyle(
                      color:Colors.black,
                      fontFamily:'Gilroy',
                      fontSize: 20.sp,
                    ),
                  ),
              ],
              ),
              SizedBox(height:30.h,),
          InkWell(
            onTap: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductList()),);
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
                child:Text('Add to Cart',
                  style: TextStyle(
                    fontFamily:'Gilroy',
                    color: Colors.white,
                    fontSize:15.sp,
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
    ],
    ),
    );

  }
}
