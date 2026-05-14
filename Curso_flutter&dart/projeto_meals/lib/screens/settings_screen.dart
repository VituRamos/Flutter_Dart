import 'package:flutter/material.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(this.settings,this.onSettingsChanged,{super.key});

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  late Settings settings;

  void initState(){
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title, 
    String subtitle, 
    bool value,
    Function(bool) onChanged,
    ){
      return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value){
          onChanged(value);
          widget.onSettingsChanged(settings);
        },
        );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[

                //Configuração sem Gluten
                _createSwitch('Sem Glúten',
                  'Só exibe refeições sem glúten.',
                  settings.isGlutenFree,
                  (value) => setState(() => settings.isGlutenFree = value),
                ),

                //Configuração sem Lactose
                _createSwitch(
                  'Sem Lactose',
                  'Só exibe refeições sem Lactose.',
                  settings.isLactoseFree,
                  (value) => setState(() => settings.isLactoseFree = value),
                ),

                //Configuração Vegana
                _createSwitch(
                  'Vegana',
                  'Só exibe refeições Vegana.',
                  settings.isVegan,
                  (value) => setState(() => settings.isVegan = value),
                ),

                //Configuração Vegana
                _createSwitch(
                  'Vegetariana',
                  'Só exibe refeições Vegetarianas.',
                  settings.isVegetarian,
                  (value) => setState(() => settings.isVegetarian = value),
                ),

              ],
            ),
          ),
        ],
      )
    );
  }
}