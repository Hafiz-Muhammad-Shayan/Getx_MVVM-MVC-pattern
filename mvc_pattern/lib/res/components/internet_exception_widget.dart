


import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mvc_pattern/res/colors/app_color.dart';

class InternetExceptionWidget extends StatefulWidget {

  final VoidCallback onpress;

  const InternetExceptionWidget({
    super.key,
    required this.onpress,
  });

  @override
  State<InternetExceptionWidget> createState() => _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height ;
    return Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: height * .15,
            ),
            Icon(
              Icons.cloud_off ,
              color: AppColor.redColor ,
              size: 50 ,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Center(child: Text("internet_exception".tr,textAlign: TextAlign.center,)),
            ),
            SizedBox(
              height: height * .15,
            ),
            InkWell(
              onTap: widget.onpress,
                child: Container(
                  height: 44,
                  width: 160,
                  decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text("Retry",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white,
                      ),
                    ),
                  ),
                ),),

          ],
        ),
    );
  }
}
