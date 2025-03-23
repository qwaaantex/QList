import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlist/Providers/Provider.dart';
import 'package:qlist/Screens/Widgets/EditNotes.dart';
import 'package:qlist/Theme/Theme.dart';

class InfoNotes extends StatefulWidget {
  final int index;
  const InfoNotes({super.key, required this.index});

  @override
  State<StatefulWidget> createState() => InfoNotesState();
}

class InfoNotesState extends State<InfoNotes> {
  @override
  Widget build(BuildContext context) {
    ProviderList _provider = Provider.of<ProviderList>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: MediaQuery.of(context).copyWith().size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(width: 2, color: Colors.grey),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {
              Navigator.pop(context);
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
                            SizedBox(height: 16),
                            EditNotes(index: widget.index),
                            SizedBox(height: 32),
                          ],
                        ),
                      ),
                    ),
              );
            },
            child: Text(
              "Редактировать",
              style: QListTheme().textTheme.titleSmall,
            ),
          ),
        ),
        SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).copyWith().size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(width: 2, color: Colors.grey),
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {
              Navigator.pop(context);
              _provider.remoteNotes(widget.index);
            },
            child: Text("Удалить", style: QListTheme().textTheme.titleSmall),
          ),
        ),
      ],
    );
  }
}
