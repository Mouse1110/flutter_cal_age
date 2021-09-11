import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingController = TextEditingController();
  String age = 'Tuổi sẽ hiện ở đây';
  Color colorI = Colors.black;
  String txtColor = 'Màu sắc yêu thích';
  String theThao = 'thể thao';
  String monAn = 'Món ăn';
  double opacity = 1.0;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text('XuLySuKien'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.center,
              color: Colors.pink.withOpacity(0.4),
              child: const Text(
                'Chương trình tính tuổi',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: _textEditingController,
                    decoration: const InputDecoration(
                        label: Text('Gõ năm sinh vào đây')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonClick(
                          press: () {
                            if (_textEditingController.text != '') {
                              setState(() {
                                age =
                                    'Tuổi của bạn: ${2021 - int.parse(_textEditingController.text)} Già rồi đó';
                              });
                            }
                          },
                          label: 'TUỔI',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ButtonClick(
                          press: () {
                            setState(() {
                              txtColor = 'Thích màu hồng nhá';
                              colorI = Colors.pinkAccent;
                            });
                          },
                          label: 'MÀU SẮC',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonClick(
                          press: () {
                            setState(() {
                              monAn = 'Thích ăn bánh tráng trộn';
                            });
                          },
                          label: 'MÓN ĂN',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ButtonClick(
                          press: () {
                            setState(() {
                              theThao = 'Thích bóng rổ';
                            });
                          },
                          label: 'THỂ THAO',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Opacity(
                          opacity: opacity,
                          child: ButtonClick(
                            press: () {
                              setState(() {
                                opacity = 0;
                              });
                            },
                            label: 'ẨN',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ButtonClick(
                          press: () {
                            setState(() {
                              opacity = 1;
                            });
                          },
                          label: 'HIỆN',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: ButtonClick(
                              label: 'MỞ MÀN HÌNH MỚI',
                              press: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SecondPage()));
                              }))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(age),
                  Text(
                    txtColor,
                    style: TextStyle(color: colorI),
                  ),
                  Text(monAn),
                  Text(theThao),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonClick extends StatelessWidget {
  final String label;
  final Function press;
  const ButtonClick({Key? key, required this.label, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 18)),
      onPressed: () {
        press();
      },
      child: Text(label),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('XuLySuKien'),
        backgroundColor: Colors.pink,
      ),
      body: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            color: Colors.grey,
            alignment: Alignment.center,
            child: Text(
              'Quay về',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          )),
    );
  }
}
