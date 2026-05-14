import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this._favoriteMeals,{super.key});

  final List<Meal> _favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedScreenIndex = 0;
  late List<Map<String,Object>> _screens;

  void initState(){
    super.initState();
    _screens = [
    {'title':'Lista de Categorias','screen': CategoriesScreen()},
    {'title':'Meus favoritos','screen': FavoriteScreen(widget._favoriteMeals)}
  ];
  }

  _selectedScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        title: Text((_screens[_selectedScreenIndex]['title']) as String)
      ),

      drawer: MainDrawer(),

      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(

        onTap: _selectedScreen,

        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,

        items: [

          //Item 1
          BottomNavigationBarItem(
            icon: Icon(Icons.category,),
            label: "Categorias",
          ),

          //Item 1
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,),
            label: "Favoritos",
          )

        ], //items
      ),
    );
  }
}