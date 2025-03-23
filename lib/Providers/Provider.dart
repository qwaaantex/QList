import 'package:flutter/cupertino.dart';

class ProviderList extends ChangeNotifier {
  final List _notes = [];
  List _notesFiltered = [];
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerEditing = TextEditingController();
  final TextEditingController _controllerSearch = TextEditingController();
  final GlobalKey<AnimatedListState> _animatedList =
      GlobalKey<AnimatedListState>();
  List get notes => _notes;
  List get notesFiltered => _notesFiltered;
  TextEditingController get controller => _controller;
  TextEditingController get controllersearch => _controllerSearch;
  TextEditingController get controllerediting => _controllerEditing;
  GlobalKey get animatedList => _animatedList;

  void addNotes(text) {
    if (text.isNotEmpty) {
      _notes.add(text);
      _animatedList.currentState?.insertItem(
        _notes.length - 1,
        duration: Duration(milliseconds: 400),
      );
      notifyListeners();
    }
  }

  void editNotes(text, index, context) {
    if (_notes.isNotEmpty) {
      _notes.removeAt(index);
      _notes.insert(index, text);
      notifyListeners();
    }
  }

  void filterNotes(String query) {
    if (query.isEmpty) {
      _notesFiltered = [];
      notifyListeners();
    } else {
      _notesFiltered =
          _notes.where((note) {
            return note.toLowerCase().contains(query.toLowerCase().trim());
          }).toList();
      notifyListeners();
    }
  }

  void filterNotesAdd(value) {
    if (notes.isNotEmpty) {
      _notesFiltered.add(value);
      notifyListeners();
    }
  }

  void clearAllNotes() {
    _controller.clear();
  }

  void remoteNotesAll() {
    _notes.clear();
    notifyListeners();
  }

  void remoteNotes(index) {
    if (_notes.isNotEmpty) {
      _notes.removeAt(index);
      _animatedList.currentState?.removeItem(index, (context, animation) {
        return FadeTransition(opacity: animation);
      }, duration: Duration(milliseconds: 500));
      notifyListeners();
    }
  }
}
