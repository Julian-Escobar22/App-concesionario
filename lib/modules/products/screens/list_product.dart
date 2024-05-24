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

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 21.0,
                    crossAxisSpacing: 15.0,
                  ),
                  itemCount: data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    /// Card product
                    return Card(
                      elevation: 1,
                      child: Column(
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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              data?[index]['title'],
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              data?[index]['price'].toString() ?? '',
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
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
