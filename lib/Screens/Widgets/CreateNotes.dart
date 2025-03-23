import 'package:flutter/material.dart';
import 'package:qlist/Screens/Widgets/Input.dart';
import 'package:qlist/Theme/Theme.dart';

class CreateNotes extends StatefulWidget {
  const CreateNotes({super.key});

  @override
  State<CreateNotes> createState() => _CreateNotesState();
}

class _CreateNotesState extends State<CreateNotes> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
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
    );
  }
}
