import 'package:project_final/common/styles/spacing_styles.dart';
import 'package:project_final/utils/constants/colors.dart';
import 'package:project_final/utils/services/firestore.dart';
import 'package:flutter/material.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({super.key});

  @override
  State<ListProduct> createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
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
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;

                return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    /// Card product
                    return Card(
                      elevation: 1,
                      margin: const EdgeInsets.symmetric(vertical: 10.0),
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
                                  image: NetworkImage(data?[index]['img']),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              data?[index]['title'],
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.primary,
                                fontSize: 18.0, // Ajustar el tamaño del texto si es necesario
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data?[index]['price'].toString() ?? '',
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0, // Ajustar el tamaño del texto si es necesario
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
}
