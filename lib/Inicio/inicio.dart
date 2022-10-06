import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estagio/home/home_page_cat.dart';
import 'package:projeto_estagio/login/login.dart';

import '../home/home_page.dart';


class Inicial extends StatefulWidget {
  const Inicial({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Inicial> {
  int currentpage = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              //replace clippath to clipshadow
//images scroll
              child: PageView(
            scrollDirection: Axis.horizontal,
            onPageChanged: (value) {
              setState(() {
                currentpage = value;
              });
            },
            children: const [
              SplashImgs(
                image: "imagens/croissantchocolate.jpg",
              ),
              SplashImgs(
                image: "imagens/strogonoff.jpg",
              ),
              SplashImgs(
                image: "imagens/paoqueijo.jpg",
              ),
            ],
          )),
          Expanded(
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  "Escolha seus pratos favoritos\nde forma rápida e eficiente.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
                const Spacer(),
                //dottScrool
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (index) => dotContainer(index: index),
                  ),
                ),
                const Spacer(),
                //Next Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    minWidth: double.infinity,
                    height: 50,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeCategoria(categoria: "",)));
                    },
                    child: const Text(
                      "Produtos",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const Spacer(),
                //Skip Button
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    )),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

//dotContainer
  Container dotContainer({int? index}) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      height: 6,
      width: currentpage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentpage == index ? Colors.black : Colors.grey,
          borderRadius: BorderRadius.circular(20)),
    );
  }
}

//images section
class SplashImgs extends StatelessWidget {
  const SplashImgs({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipShadow(
      boxShadow: [
        BoxShadow(
          blurRadius: 10.0,
          spreadRadius: 10.0,
          color: Colors.white.withOpacity(1.0),
        )
      ],
      clipper: ClipperClass(),
      child: SizedBox(
        width: double.infinity,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
  }
}

//images curved code
class ClipperClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.width);
    path.quadraticBezierTo(
        size.width / 9, size.height, size.width / 4, size.height);
    path.quadraticBezierTo(size.width - (size.width / 2), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}