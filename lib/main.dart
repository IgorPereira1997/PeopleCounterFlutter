import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  static int limitUp = 20;
  static int limitDown = 0;

  void decrement() {
    if (count > limitDown) {
      setState(() {
        count--;
      });
    }
  }

  void increment() {
    if (count < limitUp) {
      setState(() {
        count++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/img/imagem.jpg'),
              fit: BoxFit.cover,
              opacity: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Limite atual de pessoas: ',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  DropdownButton<int>(
                    value: limitUp,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 25,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 0,
                    ),
                    onChanged: (int? newValue) {
                      setState(() {
                        limitUp = newValue!;
                      });
                    },
                    items: <int>[5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text(
                          value.toString(),
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Text(
              count >= limitUp
                  ? (count > limitUp
                      ? 'Local lotado! Remova ' +
                          (count - limitUp).toString() +
                          ((count - limitUp) == 1 ? ' pessoa!' : ' pessoas!')
                      : 'Local Lotado!')
                  : 'Pode entrar!',
              style: TextStyle(
                fontSize: 26,
                color: count >= limitUp
                    ? Colors.red
                    : const Color.fromRGBO(22, 163, 3, 1),
                fontWeight: FontWeight.w900,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35),
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 100,
                  color: count >= limitUp ? Colors.red : Colors.purple,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: count == 0 ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: count == 0
                        ? Colors.white.withOpacity(0.2)
                        : Colors.white,
                    fixedSize: const Size(80, 80),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 35,
                ),
                TextButton(
                  onPressed: count >= limitUp ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor: count >= limitUp
                        ? Colors.white.withOpacity(0.2)
                        : Colors.white,
                    fixedSize: const Size(80, 80),
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
