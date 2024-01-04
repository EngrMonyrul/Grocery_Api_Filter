import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplegrocery/src/viewmodel/consts/consts.dart';
import 'package:simplegrocery/src/viewmodel/providers/home_page_provider.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  void showData() {
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    homePageProvider.addProducts();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      showData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Examples'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Consumer<HomePageProvider>(builder: (context, value, child) {
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .1,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: categoriesList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: FilterChip(
                          label: Text(categoriesList[index]),
                          selected:
                              value.filterList.contains(categoriesList[index]),
                          onSelected: (selected) {
                            if (selected) {
                              value.addFilterList(value: categoriesList[index]);
                            } else {
                              value.removeFilterList(
                                  value: categoriesList[index]);
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: value.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(value.products[index].image!),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        color: Colors.black.withOpacity(0.3),
                        child: Text(
                          'Price -\$${value.products[index].price}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
