import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'textFieldWidget.dart';

class LayoutWeb extends StatefulWidget {
  const LayoutWeb({Key? key}) : super(key: key);

  @override
  State<LayoutWeb> createState() => _LayoutWebState();
}

class _LayoutWebState extends State<LayoutWeb> {
  TextEditingController controller = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF2B2B2B),
      body: Center(
        child: SizedBox(
          width: 95.w,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 50.h,
                            width: 45.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.h),
                                  topRight: Radius.circular(10.h),
                                  bottomLeft: Radius.circular(20.h),
                                  bottomRight: Radius.circular(20.h)
                              ),
                              child: Image.asset(
                                "lib/assets/images/studentsPicture2.png",
                                height: 50.h,
                                width: 45.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 50.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.h),
                                  topRight: Radius.circular(10.h),
                                  bottomLeft: Radius.circular(20.h),
                                  bottomRight: Radius.circular(20.h)
                              ),
                              //color: const Color.fromRGBO(65, 105, 225, .45),
                              color: const Color.fromRGBO(33, 150, 243, .45),
                            ),
                          ),
                          SizedBox(
                            height: 50.h,
                            width: 45.w,
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 10.h,
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
                    ],
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                SizedBox(
                  height: 50.h,
                  width: 35.w,
                  child: Card(
                    color: const Color(0XFF3C3F41),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFieldWidget(
                          controller: controller,
                          hintText: "RA",
                          width: 30.w,
                          keyboardType: TextInputType.name,
                          fontSize: 15.sp,
                        ),
                        TextFieldWidget(
                          controller: controllerSenha,
                          hintText: "Senha",
                          width: 30.w,
                          keyboardType: TextInputType.name,
                          isPassword: true,
                          fontSize: 15.sp,
                        ),
                        SizedBox(
                          height: 60,
                          width: 25.w,
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
