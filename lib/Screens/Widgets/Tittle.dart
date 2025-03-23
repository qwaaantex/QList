import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlist/Providers/Provider.dart';

class Tittle extends StatefulWidget {
  const Tittle({super.key});

  @override
  State<Tittle> createState() => _TittleState();
}

class _TittleState extends State<Tittle> {
  @override
  Widget build(BuildContext context) {
    final ProviderList _provider = Provider.of<ProviderList>(context);

    return TextField(
      controller: _provider.controllersearch,
      cursorColor: Colors.grey,
      textAlign: TextAlign.center,
      enableInteractiveSelection: false,
      onSubmitted: (value) {
        _provider.filterNotesAdd(value);
        _provider.filterNotes(_provider.controllersearch.text);
      },
      onChanged: (value) {
        _provider.filterNotesAdd(value);
        _provider.filterNotes(_provider.controllersearch.text);
      },
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        isDense: true,
        suffixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 40),
        prefixIconConstraints: BoxConstraints(minWidth: 40, minHeight: 40),
        suffixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          alignment: Alignment.center,
          child: IconButton(
            onPressed: () {
              _provider.controllersearch.clear();
              _provider.filterNotes(_provider.controllersearch.text);
            },
            icon: Icon(Icons.clear, size: 20),
          ),
        ),
        prefixIcon: Align(
          widthFactor: 1.0,
          heightFactor: 1.0,
          alignment: Alignment.center,
          child: Icon(Icons.search, size: 20),
        ),

        hintText: "Поиск...",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(width: 2, color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(width: 2, color: Colors.grey),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
