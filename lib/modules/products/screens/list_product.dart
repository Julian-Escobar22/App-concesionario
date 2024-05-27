import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:project_final/common/styles/spacing_styles.dart';
import 'package:project_final/utils/constants/colors.dart';
import 'package:project_final/utils/services/firestore.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  int? _expandedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5DC), // Fondo beige
      body: Padding(
        padding: TSpacingStyles.paddingWithAppBarHeight,
        child: RefreshIndicator(
          onRefresh: () async {
            await getAllCollection(nameCollection: 'products');
            setState(() {});
          },
          child: FutureBuilder(
            future: getAllCollection(nameCollection: 'products'),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.brown.shade300, // Fondo del header
                        borderRadius: BorderRadius.circular(16.0), // Bordes redondeados
                      ),
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        'Nuestros productos',
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.white, // Color del texto
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: AnimationLimiter(
                        child: ListView.builder(
                          itemCount: data?.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 500),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _expandedIndex = index;
                                        _showProductDialog(data![index]['title'], data[index]['img']);
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(vertical: 10.0),
                                      child: Card(
                                        elevation: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: AspectRatio(
                                                  aspectRatio: 16 / 9,
                                                  child: Image(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(data[index]['img']),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                data[index]['title'],
                                                textAlign: TextAlign.left,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  color: AppColors.primary,
                                                  fontSize: 18.0, // Ajustar el tamaño del texto si es necesario
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                data[index]['price'].toString() ?? '',
                                                style: const TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16.0, // Ajustar el tamaño del texto si es necesario
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void _showProductDialog(String title, String imageURL) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageURL),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 18.0, // Ajustar el tamaño del texto si es necesario
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
