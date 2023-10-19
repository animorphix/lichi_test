import 'package:flutter/material.dart';
import 'package:lichi_flutter/Pages/product_list_page.dart';
import 'package:provider/provider.dart';

import 'Cart/cart.dart';
import 'provider/change_notifier.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> loadData() async {
    //final productProvider = Provider.of<ProductProvider>(context, listen: false);
    try {
      await fetchData('shoes', context);
    } catch (e) {
      throw Error();
    }
  }

  @override
  void initState() {
    super.initState();
    loadData(); // Trigger the data fetch when the widget is created
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: loadData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          } else if (snapshot.hasError) {
            return Center(
                child: Column(
              children: [
                Text("Произошла ошибка, повторите позднее ${snapshot.error}"),
                ElevatedButton(
                  onPressed: () {
                    loadData();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'Повторить',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ));
          } else {
            return const ProductListPage();
          }
        },
      ),
    );
  }
}
