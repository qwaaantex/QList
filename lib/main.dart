import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlist/Providers/Provider.dart';
import 'package:qlist/Screens/QListHome.dart';
import 'package:qlist/Theme/Theme.dart';

void main() {
  runApp(MainList());
}

class MainList extends StatefulWidget {
  const MainList({super.key});

  @override
  State<StatefulWidget> createState() => MainListState();
}

class MainListState extends State<MainList> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderList(),
      child: MaterialApp(theme: QListTheme(), home: Qlisthome()),
    );
  }
}
