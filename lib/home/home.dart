import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int activeIndex = 0;
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10.0, 48.0, 10.0, 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              // É a primeira seção de produtos da página home.
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.black26,
                      onTap: () {},
                      child: Ink.image(
                        image: const AssetImage('assets/images/snacks.png'),
                        height: 70,
                        width: 107,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                        height:
                            6), // SizedBox é uma caixa usada para separar os elementos.
                    const Text(
                      'Snacks',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.black26,
                      onTap: () {},
                      child: Ink.image(
                        image: const AssetImage('assets/images/refeicao.png'),
                        height: 70,
                        width: 107,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Refeição',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.black26,
                      onTap: () {},
                      child: Ink.image(
                        image: const AssetImage('assets/images/lanches.png'),
                        height: 70,
                        width: 107,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Lanches',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            const SizedBox(
              height: 32,
            ),
            const Text("Famosos da cantina",
                style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.black;
                      }
                      return const Color.fromARGB(255, 4, 36, 116);
                    }),
                    overlayColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(0, 0, 0, 0))),
                child: const Text("Ver mais"),
                onPressed: () {},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.black26,
                      onTap: () {},
                      child: Ink.image(
                        image: const AssetImage('assets/images/strogonoff.png'),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Strogonoff',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.black26,
                      onTap: () {},
                      child: Ink.image(
                        image: const AssetImage('assets/images/croissant.png'),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Croissant',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      splashColor: Colors.black26,
                      onTap: () {},
                      child: Ink.image(
                        image: const AssetImage(
                            'assets/images/sanduiche_natural.png'),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Sanduíche',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            InkWell(
              splashColor: Colors.black26,
              onTap: () {},
              child: Ink.image(
                image: const AssetImage('assets/images/banner_salgados.png'),
                height: 117,
                width: 334,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
