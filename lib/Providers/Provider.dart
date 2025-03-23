import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderList extends ChangeNotifier {
  List<String> _notes = [];
  List<String> _notesFiltered = [];
  bool _isStarred = false;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerEditing = TextEditingController();
  final TextEditingController _controllerSearch = TextEditingController();
  final GlobalKey<AnimatedListState> _animatedList =
      GlobalKey<AnimatedListState>();
  List<String> get notes => _notes;
  List<String> get notesFiltered => _notesFiltered;
  TextEditingController get controller => _controller;
  TextEditingController get controllersearch => _controllerSearch;
  TextEditingController get controllerediting => _controllerEditing;
  GlobalKey get animatedList => _animatedList;
  bool get isStarred => _isStarred;

  ProviderList() {
    _notes = [];
    _notesFiltered = [];
    loadNotes();
  }

  void loadNotes() async {
    try {
      final SharedPreferences storage = await SharedPreferences.getInstance();
      List<String>? savedNotes = storage.getStringList("_notes");

      _notes = savedNotes ?? [];
      notifyListeners();
    } catch (e) {
      debugPrint("$e");
    }
  }

  void addNotes(text) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    if (text.isNotEmpty) {
      _notes.add(text);
      await storage.setStringList("_notes", _notes);
      _animatedList.currentState?.insertItem(
        _notes.length - 1,
        duration: Duration(milliseconds: 400),
      );
      notifyListeners();
    }
  }

  void addStar(index) {
    _isStarred = !isStarred;
    notifyListeners();
  }

  void editNotes(text, index, context) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    if (text.isNotEmpty) {
      _notes.removeAt(index);
      _notes.insert(index, text);
      await storage.setStringList("_notes", _notes);
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

  void remoteNotesAll() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    _notes.clear();
    await storage.setStringList("_notes", _notes);
    notifyListeners();
  }

  void remoteNotes(index) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    if (_notes.isNotEmpty) {
      _notes.removeAt(index);
      await storage.setStringList("_notes", _notes);
      _animatedList.currentState?.removeItem(index, (context, animation) {
        return FadeTransition(opacity: animation);
      }, duration: Duration(milliseconds: 500));
      notifyListeners();
    }
  }
}
