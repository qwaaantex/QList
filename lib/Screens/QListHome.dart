import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlist/Providers/Provider.dart';
import 'package:qlist/Screens/Widgets/Clear.dart';
import 'package:qlist/Screens/Widgets/CreateNotes.dart';
import 'package:qlist/Screens/Widgets/OpenEdits.dart';
import 'package:qlist/Screens/Widgets/SearchEdits.dart';
import 'package:qlist/Screens/Widgets/Tittle.dart';
import 'package:qlist/Theme/Theme.dart';

class Qlisthome extends StatefulWidget {
  const Qlisthome({super.key});

  @override
  State<StatefulWidget> createState() => QlisthomeState();
}

class QlisthomeState extends State<Qlisthome> {
  @override
  Widget build(BuildContext context) {
    ProviderList _provider = Provider.of<ProviderList>(context);
    List _notes = _provider.notes;
    String _notesSearch = _provider.controllersearch.text;
    return MaterialApp(
      theme: QListTheme(),
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: Tittle(),

          leading: CreateNotes(),
          actions: [Clear()],
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Align(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            child:
                _notesSearch.isEmpty
                    ? _notes.isEmpty
                        ? Text(
                          "Активных заметок нет",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        )
                        : OpenEdits()
                    : _provider.notesFiltered.isEmpty
                    ? Center(
                      child: Text(
                        "Совпадений не найдено",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                    : SearchEdits(),
          ),
        ),
      ),
    );
  }
}
