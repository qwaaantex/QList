import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlist/Providers/Provider.dart';
import 'package:qlist/Screens/Widgets/InfoNotes.dart';
import 'package:qlist/Screens/Widgets/Input.dart';
import 'package:qlist/Screens/Widgets/SubmittedClear.dart';
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

          leading: IconButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                barrierColor: Colors.black.withOpacity(0.4),
                backgroundColor: QListTheme().canvasColor,
                context: context,
                builder:
                    (context) => Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 16),
                            Container(
                              height:
                                  MediaQuery.of(
                                    context,
                                  ).copyWith().size.height *
                                  0.006,
                              width:
                                  MediaQuery.of(
                                    context,
                                  ).copyWith().size.height *
                                  0.04,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(48),
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 32),
                            Center(child: Input()),
                            SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
              );
            },
            icon: Icon(Icons.add, color: Colors.white, size: 30),
          ),
          actions: [
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                  barrierColor: Colors.black.withOpacity(0.4),
                  backgroundColor: QListTheme().canvasColor,
                  context: context,
                  builder:
                      (context) => SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: 16),
                            Container(
                              height:
                                  MediaQuery.of(
                                    context,
                                  ).copyWith().size.height *
                                  0.006,
                              width:
                                  MediaQuery.of(
                                    context,
                                  ).copyWith().size.height *
                                  0.04,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(48),
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 16),
                            SubmittedClear(),
                            SizedBox(height: 32),
                          ],
                        ),
                      ),
                );
              },
              icon: Icon(CupertinoIcons.delete, color: Colors.white),
            ),
          ],
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
                        : AnimatedList(
                          key: _provider.animatedList,
                          initialItemCount: _notes.length,
                          itemBuilder: (context, index, animation) {
                            return SizeTransition(
                              sizeFactor: animation,
                              child: GestureDetector(
                                onLongPress: () {
                                  showModalBottomSheet(
                                    barrierColor: Colors.black.withOpacity(0.4),
                                    backgroundColor: QListTheme().canvasColor,
                                    context: context,
                                    builder:
                                        (context) => SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(height: 16),
                                              Container(
                                                height:
                                                    MediaQuery.of(
                                                      context,
                                                    ).copyWith().size.height *
                                                    0.006,
                                                width:
                                                    MediaQuery.of(
                                                      context,
                                                    ).copyWith().size.height *
                                                    0.04,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(48),
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(height: 16),
                                              InfoNotes(index: index),
                                              SizedBox(height: 32),
                                            ],
                                          ),
                                        ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Center(
                                      child: Container(
                                        padding: EdgeInsets.all(16),
                                        width:
                                            MediaQuery.of(context).size.width *
                                            0.9,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            24,
                                          ),
                                          color: QListTheme().canvasColor,
                                        ),
                                        child: SizedBox(
                                          child: Center(
                                            child: Text(
                                              _provider.notes[index],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                    : _provider.notesFiltered.isEmpty
                    ? Center(
                      child: Text(
                        "Совпадений не найдено",
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                    : AnimatedList(
                      initialItemCount: _provider.notesFiltered.length,
                      itemBuilder: (context, index, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: QListTheme().canvasColor,
                                ),
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        _provider.notesFiltered[index],
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
          ),
        ),
      ),
    );
  }
}
