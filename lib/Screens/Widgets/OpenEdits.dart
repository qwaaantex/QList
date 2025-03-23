import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:ionicons/ionicons.dart';
import 'package:provider/provider.dart';
import 'package:qlist/Providers/Provider.dart';
import 'package:qlist/Screens/Widgets/InfoNotes.dart';
import 'package:qlist/Theme/Theme.dart';

class OpenEdits extends StatefulWidget {
  const OpenEdits({super.key});

  @override
  State<OpenEdits> createState() => _OpenEditsState();
}

class _OpenEditsState extends State<OpenEdits> {
  @override
  Widget build(BuildContext context) {
    ProviderList _provider = Provider.of<ProviderList>(context);
    final _notes = _provider.notes;
    return AnimatedList(
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
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: QListTheme().canvasColor,
                    ),
                    child: Center(
                      child: Container(
                        child: ListTile(
                          dense: true,
                          trailing: GestureDetector(
                            onTap: () {
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
                            child: Icon(HugeIcons.strokeRoundedBook01),
                          ),
                          leading: GestureDetector(
                            onTap: () {
                              _provider.addStar(index);
                            },
                            child: AnimatedSwitcher(
                              duration: Duration(seconds: 10),
                              child: Icon(
                                Ionicons.star,
                                color:
                                    _provider.isStarred ? null : Colors.yellow,
                                size: 25,
                              ),
                            ),
                          ),

                          title: Align(
                            alignment: Alignment.center,
                            child: Text(
                              _provider.notes[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
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
    );
  }
}
