import 'package:flutter/material.dart';
import 'widgets/expenses.dart';

var kcolorscheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(225, 96, 59, 181));
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kcolorscheme,
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kcolorscheme.onPrimaryContainer,
            foregroundColor: kcolorscheme.primaryContainer
        ),
        cardTheme: CardTheme().copyWith(
          color: kcolorscheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorscheme.secondaryContainer,
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            color: kcolorscheme.onSecondaryContainer,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )
        )
      ),
      home: Expenses(),
    ),
  );
}
