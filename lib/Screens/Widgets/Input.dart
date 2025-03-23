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
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: TextField(
            controller: _provider.controller,
            maxLines: null,
            textAlign: TextAlign.start,
            cursorColor: Colors.white,

            autofocus: true,
            style: TextStyle(color: Colors.white, decorationThickness: 0),
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
              prefixIcon: IconButton(
                onPressed: () {
                  _provider.clearAllNotes();
                },
                icon: Icon(Icons.clear, size: 22),
              ),
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
