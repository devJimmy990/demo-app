class Singleton {
  static Singleton? _instance;
  static bool _firstInitialization = false;

  Singleton._() {
    _firstInitialization = true;
  }

  factory Singleton() {
    if (_instance == null) {
      _instance = Singleton._(); 
      print("Object created");
    } else {
      print("Object already created");
      _firstInitialization = false;
    }
    print("Is already initialized?: $_firstInitialization");
    return _instance!;
  }

  bool get isFirstInitialization => _firstInitialization;
}
