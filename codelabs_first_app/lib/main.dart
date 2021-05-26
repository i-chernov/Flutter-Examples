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
    final wordPair = WordPair.random();
    return MaterialApp(
      title: "Welcome to Flutter",
      // Виджет Scaffold из библиотеки материалов предоставляет панель приложения по умолчанию, 
      // заголовок и свойство body, которое содержит дерево виджетов для главного экрана. 
      // Поддерево виджетов может быть довольно сложным.
      home: Scaffold(
        appBar: AppBar(title: const Text("Welcome to Flutter")),
      // Тело этого примера состоит из виджета Center содержащего дочерний виджет Text . 
      // Виджет « Center выравнивает свое поддерево виджета по центру экрана.
        body: Center(
          child: Text(wordPair.asPascalCase)
        ),
      ),
    );
  } 
  
}