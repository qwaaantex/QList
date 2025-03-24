import 'package:animated_icon/animated_icon.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:qlist/Providers/Provider.dart';
import 'package:qlist/Screens/Widgets/InfoNotes.dart';
import 'package:qlist/Theme/Theme.dart';

class SearchEdits extends StatefulWidget {
  const SearchEdits({super.key});

  @override
  State<SearchEdits> createState() => _SearchEditsState();
}

class _SearchEditsState extends State<SearchEdits> {
  @override
  Widget build(BuildContext context) {
    ProviderList _provider = Provider.of<ProviderList>(context);
    return AnimatedList(
      initialItemCount: _provider.notesFiltered.length,
      itemBuilder: (context, index, animation) {
        return FadeTransition(
          opacity: animation,
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: QListTheme().canvasColor,
                  ),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: QListTheme().canvasColor,
                      ),
                      child: Center(
                        child: SizedBox(
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
                              child: Icon(
                                HugeIcons.strokeRoundedBook01,
                                size: 26,
                              ),
                            ),
                            leading: GestureDetector(
                              onTap: () {
                                _provider.replaceStar(index);
                              },
                              child: AnimatedSwitcher(
                                duration: Duration(seconds: 1),
                                child:
                                    _provider.isStars[index] == "true"
                                        ? AnimateIcon(
                                          onTap: () {
                                            _provider.replaceStar(index);
                                          },
                                          iconType: IconType.animatedOnTap,
                                          height: 30,
                                          width: 30,
                                          color: Colors.yellow,
                                          animateIcon: AnimateIcons.heart,
                                        )
                                        : AnimateIcon(
                                          onTap: () {
                                            _provider.replaceStar(index);
                                          },
                                          iconType: IconType.animatedOnTap,
                                          height: 30,
                                          width: 30,
                                          color: Color(0xFF3F3E47),
                                          animateIcon: AnimateIcons.heart,
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
