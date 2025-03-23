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
    return MaterialApp(
      theme: QListTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
            child: Center(child: Tittle()),
          ),
          leading: IconButton(
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
                                MediaQuery.of(context).copyWith().size.height *
                                0.006,
                            width:
                                MediaQuery.of(context).copyWith().size.height *
                                0.04,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48),
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 16),
                          Center(child: Input()),
                          SizedBox(height: 32),
                        ],
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
          alignment: Alignment.center,
          child:
              _notes.isEmpty
                  ? Text(
                    "У вас нету активных заметок",
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
                                            borderRadius: BorderRadius.circular(
                                              48,
                                            ),
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
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
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
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        ),
      ),
    );
  }
}
