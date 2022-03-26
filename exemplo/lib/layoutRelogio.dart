import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LayoutRelogio extends StatefulWidget {
  const LayoutRelogio({Key? key}) : super(key: key);

  @override
  State<LayoutRelogio> createState() => _LayoutRelogioState();
}

class _LayoutRelogioState extends State<LayoutRelogio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF2B2B2B),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Stack(
              children: [
                SizedBox(
                  height: 50.h,
                  width: 95.w,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.h),
                        topRight: Radius.circular(10.h),
                        bottomLeft: Radius.circular(25.h),
                        bottomRight: Radius.circular(25.h)
                    ),
                    child: Image.asset(
                      "lib/assets/images/studentsPicture.png",
                      height: 55.h,
                      width: 95.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 50.h,
                  width: 95.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.h),
                        topRight: Radius.circular(10.h),
                        bottomLeft: Radius.circular(25.h),
                        bottomRight: Radius.circular(25.h)
                    ),
                    //color: const Color.fromRGBO(65, 105, 225, .45),
                    color: const Color.fromRGBO(33, 150, 243, .45),
                  ),
                ),
                SizedBox(
                  height: 50.h,
                  width: 95.w,
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "PCE",
                        style: TextStyle(
                            fontSize: 36.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Protótipo de Controle Educacional",
                        style: TextStyle(
                          fontSize: 21.sp,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 22.sp,
                  color: const Color.fromRGBO(33, 150, 243, 1),
                ),
                children: <TextSpan>[
                  const TextSpan(text: 'BEM VINDO AO '),
                  TextSpan(
                    text: 'PCE',
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: const Color.fromRGBO(33, 150, 243, 1),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2.h),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 22.sp,
                  color: const Color.fromRGBO(33, 150, 243, 1),
                ),
                children: <TextSpan>[
                  const TextSpan(text: 'Somando no processo da sua \n'),
                  TextSpan(
                    text: 'APRENDIZAGEM',
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: const Color.fromRGBO(33, 150, 243, 1),
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.h),
            child: SizedBox(
              height: 12.h,
              width: 60.w,
              child: ElevatedButton(
                onPressed: (){

                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromRGBO(33, 150, 243, .45),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.h),
                    ),
                  ),
                ),
                child: Text(
                  "ENTRAR",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.transparent,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
