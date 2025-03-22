import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlist/Providers/Provider.dart';

class Input extends StatefulWidget {
  const Input({super.key});

  @override
  State<StatefulWidget> createState() => InputState();
}

class InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    ProviderList _provider = Provider.of<ProviderList>(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Создание заметки",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        SizedBox(height: 10),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            controller: _provider.controller,
            autofocus: true,
            textAlign: TextAlign.start,
            cursorColor: Colors.white,
            style: TextStyle(color: Colors.white),
            onSubmitted: (value) {
              Navigator.pop(context);
              _provider.addNotes(value);
              _provider.clearAllNotes();
            },
            decoration: InputDecoration(
              isDense: true,
              hintText: "Введите заметку...",

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.grey),
                borderRadius: BorderRadius.circular(24),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.grey),
                borderRadius: BorderRadius.circular(24),
              ),
              prefixIcon: Icon(Icons.notes_rounded),
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                onPressed: () {
                  Navigator.pop(context);
                  _provider.addNotes(_provider.controller.text);
                  _provider.clearAllNotes();
                },
                icon: Icon(Icons.add_circle, size: 22),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
