// ignore_for_file: avoid_redundant_argument_values

import 'package:explore/bloc/filter_bloc.dart';
import 'package:explore/config/colors.dart';
import 'package:explore/config/text.dart';
import 'package:explore/modules/model/filter.dart';
import 'package:explore/widgets/button_layer.dart';
import 'package:explore/widgets/customised_tile.dart';
import 'package:explore/widgets/middle_layer.dart';
import 'package:explore/widgets/top_layer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isSelected = [false, false, false, false];
  int _selectedScreenIndex = 0;
  bool isActive = false;
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    const cardTexts = <String>[
      'Top Rated',
      'Near To Location',
      'Recommended',
      'Matched with you Age'
    ];

    return Scaffold(
      backgroundColor: lightPurple,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            elevation: 0,
            backgroundColor: lightPurple,
            title: Text(
              'Explore',
              style: Theme.of(context).textTheme.titleText,
            ),
            centerTitle: false,
            actions: [
              Container(
                margin: const EdgeInsets.only(top: 5, bottom: 3),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: purpleColor,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Switch to Tinder'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, top: 5, bottom: 3),
                child: FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () {},
                  child: const Icon(
                    Icons.filter_alt_outlined,
                    color: purpleColor,
                  ),
                ),
              ),
            ],
          ),
        ],
        body: BlocProvider(
          create: (context) => FilterBloc(),
          child: BlocConsumer<FilterBloc, FilterState>(
            listener: (context, state) {
              if (state is FilterError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message!),
                  ),
                );
              }
            },
            builder: (context, state) {
           
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 70,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const SizedBox(
                            width: 10,
                          ),
                          scrollDirection: Axis.horizontal,
                          itemCount: cardTexts.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  isSelected[index] = !isSelected[index];
                                });
                              },
                              child: CustomisedTile(
                                isSelected: isSelected[index],
                                cardTexts: cardTexts[index],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        const SizedBox(
                          height: 20,
                        ),
                        for (int i = 0; i < cardTexts.length; i++)
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            height: 300,
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  13,
                                ),
                              ),
                              color: Colors.white,
                              child: Flex(
                                direction: Axis.vertical,
                                children: const [
                                  TopLayer(),
                                  SizedBox(
                                    height: 10,
                                  ),

                                 
                                  MiddleLayer(cardTexts: cardTexts),
                                 
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ButtonLayer(),
                                ],
                              ),
                            ),
                          )
                      ]),
                    )
                  ],
                );
             
            },
          ),
        ),
      ),
      bottomNavigationBar: TitledBottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        indicatorColor: orangeColor,
        items: [
          TitledNavigationBarItem(
            icon: Column(
              children: [
                Icon(
                  Icons.home_outlined,
                  color: _selectedScreenIndex == 0 ? orangeColor : greyColor,
                ),
                Text(
                  'Hood',
                  style: TextStyle(
                    color: _selectedScreenIndex == 0 ? orangeColor : greyColor,
                  ),
                )
              ],
            ),
            title: const Text(''),
          ),
          TitledNavigationBarItem(
            icon: Column(
              children: [
                Icon(
                  Icons.search,
                  color: _selectedScreenIndex == 1 ? orangeColor : greyColor,
                ),
                Text('Find',
                    style: TextStyle(
                      color:
                          _selectedScreenIndex == 1 ? orangeColor : greyColor,
                    ))
              ],
            ),
            title: const Text(''),
          ),
          TitledNavigationBarItem(
            icon: Column(
              children: [
                Icon(
                  Icons.handshake_outlined,
                  color: _selectedScreenIndex == 2 ? orangeColor : greyColor,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text('Myfavour',
                      style: TextStyle(
                        color:
                            _selectedScreenIndex == 2 ? orangeColor : greyColor,
                      )),
                )
              ],
            ),
            title: const Text(''),
          ),
          TitledNavigationBarItem(
              icon: Column(
                children: [
                  Icon(
                    Icons.mail_outline,
                    color: _selectedScreenIndex == 3 ? orangeColor : greyColor,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text('Messenger',
                        style: TextStyle(
                          color: _selectedScreenIndex == 3
                              ? orangeColor
                              : greyColor,
                        )),
                  ),
                ],
              ),
              title: const Text('')),
          TitledNavigationBarItem(
            icon: Column(
              children: [
                Icon(
                  Icons.settings_outlined,
                  color: _selectedScreenIndex == 4 ? orangeColor : greyColor,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text('Settings',
                      style: TextStyle(
                        color:
                            _selectedScreenIndex == 4 ? orangeColor : greyColor,
                      )),
                )
              ],
            ),
            title: const Text(''),
          )
        ],
      ),
    );
  }
}





