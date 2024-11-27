import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "What are you craving today? 🍳", 
        hintStyle: const TextStyle(
          color: Color(0xFFB39DDB), 
          fontSize: 16,
          fontStyle: FontStyle.italic,
        ),
        filled: true,
        fillColor: const Color(0xFFF3F8FB), 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color(0xFFD7BCE8), width: 2), 
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color(0xFFD7BCE8), width: 2), 
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: Color(0xFF9575CD), width: 2.5), 
        ),
        prefixIcon: const Icon(Icons.search, color: Color(0xFFD7BCE8)), 
      ),
    );
  }
}