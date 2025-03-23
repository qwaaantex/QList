import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlist/Providers/Provider.dart';
import 'package:rive_animated_icon/rive_animated_icon.dart';

class EditNotes extends StatefulWidget {
  final int index;
  const EditNotes({super.key, required this.index});

  @override
  State<EditNotes> createState() => EditNotesState();
}

class EditNotesState extends State<EditNotes> {
  @override
  Widget build(BuildContext context) {
    ProviderList _provider = Provider.of<ProviderList>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Редактирование заметки",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(height: 10),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            controller: _provider.controllerediting,
            autofocus: true,
            textAlign: TextAlign.start,
            cursorColor: Colors.white,
            maxLines: null,
            style: TextStyle(color: Colors.white, decorationThickness: 0),
            onSubmitted: (value) {
              Navigator.pop(context);
              _provider.editNotes(value, widget.index, context);
            },
            decoration: InputDecoration(
              isDense: true,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: "Введите заметку...",

              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.grey),
                borderRadius: BorderRadius.circular(24),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(width: 2, color: Colors.grey),
                borderRadius: BorderRadius.circular(24),
              ),
              prefixIcon: IconButton(
                onPressed: () {
                  _provider.controllerediting.clear();
                },
                icon: Icon(Icons.clear, size: 22),
              ),
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  Navigator.pop(context);
                  _provider.editNotes(
                    _provider.controllerediting.text,
                    widget.index,
                    context,
                  );
                  _provider.controllerediting.clear();
                },
                icon: RiveAnimatedIcon(
                  riveIcon: RiveIcon.add,
                  loopAnimation: true,
                  width: 32,
                  height: 32,
                  color: Color(0xFF3F3E47),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
