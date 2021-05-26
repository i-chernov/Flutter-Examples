// В этом примере создается приложение Material. 
// Материал - это стандартный язык визуального дизайна для мобильных устройств и Интернета. 
// Flutter предлагает богатый набор виджетов Material.
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// Основной метод использует обозначение стрелки ( => ). 
// Используйте стрелку для однострочных функций или методов.
void main() => runApp(MyApp());

// Приложение расширяет StatelessWidget , что делает само приложение виджетом. 
// Во Flutter почти все является виджетом, включая выравнивание, отступы и макет.
class MyApp extends StatelessWidget {
  // Основная задача виджета - предоставить метод build который описывает, 
  // как отображать виджет с точки зрения других виджетов более низкого уровня.
  // Метода build запускается каждый раз, когда MaterialApp требует рендеринга.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Welcome to Flutter",
      home: RandomWords()
    );
  } 
}

// StatefulWidget поддерживают состояние , которое может меняться в течение жизни виджета.
// Сам объект StatefulWidget является неизменяемым, 
// но объект State сохраняется в течение всего времени существования виджета.
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RandomWordsState();
}

// Класс состояния RandomWords
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[]; // Cохранение предлагаемых пар слов.
  final _biggerFont = const TextStyle(fontSize: 18.0); // Увеличение размера шрифта

  // Этот метод создает ListView который отображает предлагаемую пару слов.
  // Класс ListView предоставляет свойство itemBuilder , 
  // которое является анонимной функцией. 
  // В функцию передаются два параметра - BuildContext и итератор строки i. 
  // Итератор начинается с 0 и увеличивается каждый раз при вызове функции, 
  // один раз для каждой предложенной пары слов. 
  // Эта модель позволяет списку предложений продолжать расти по мере прокрутки пользователя.
  Widget _buildSuggestions() => ListView.builder(
    itemBuilder: (BuildContext _context, int i) {
      if (i.isOdd) return Divider();
      final int index = i ~/ 2; // Делит на 2 и обрезает плавающею часть
      if (index >= _suggestions.length) _suggestions.addAll(generateWordPairs().take(10));
      // Функция _buildSuggestions вызывает _buildRow один раз для каждой пары слов
      return _buildRow(_suggestions[index]);
    },
  );
  
  Widget _buildRow(WordPair pair) => ListTile(
    title: Text(pair.asPascalCase, style: _biggerFont),
  );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Startup Name Generator")),
      body: _buildSuggestions()
    );
  }

}