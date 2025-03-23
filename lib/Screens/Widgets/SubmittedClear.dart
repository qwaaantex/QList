import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlist/Providers/Provider.dart';
import 'package:qlist/Theme/Theme.dart';

class SubmittedClear extends StatelessWidget {
  const SubmittedClear({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    ProviderList _provider = Provider.of<ProviderList>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Вы точно хотите очистить всё?",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        SizedBox(height: 10),
        Container(
          width: size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(width: 2, color: Colors.grey),
          ),
          child: TextButton(
            style: QListTheme().textButtonTheme.style,
            onPressed: () {
              Navigator.pop(context);
              _provider.remoteNotesAll();
            },
            child: Text("Удалить", style: QListTheme().textTheme.titleSmall),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(width: 2, color: Colors.grey),
          ),
          child: TextButton(
            style: QListTheme().textButtonTheme.style,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Отмена", style: QListTheme().textTheme.titleSmall),
          ),
        ),
      ],
    );
  }
}
