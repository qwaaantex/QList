import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qlist/Screens/Widgets/SubmittedClear.dart';
import 'package:qlist/Theme/Theme.dart';

class Clear extends StatefulWidget {
  const Clear({super.key});

  @override
  State<Clear> createState() => _ClearState();
}

class _ClearState extends State<Clear> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
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
                          MediaQuery.of(context).copyWith().size.height * 0.006,
                      width:
                          MediaQuery.of(context).copyWith().size.height * 0.04,
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
    );
  }
}
