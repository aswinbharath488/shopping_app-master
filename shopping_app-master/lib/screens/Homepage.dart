import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/services/apicall.dart';

import '../model/movies.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Products>? products;
  var isLoading = false;
  @override
  void initState() {
    super.initState();
    Data();
  }

  Data() async {
    products = await ApiCall().getData();
    if (products != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          'Shopify',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.black87,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black87,
              ))
        ],
      ),
      body: Visibility(
        visible: isLoading,
        child:
            //  ListView.builder(
            //     itemCount: persons!.length,
            //     itemBuilder: (context, i) {
            //       return ListTile(
            //         title: Text(persons![i].name),
            //         subtitle: Text(persons![i].email),
            //         trailing: Text(persons![i].id.toString()),
            //       );
            //     })
            Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                children: [
                  Expanded(
                      child: Text('ShopNow!',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold))),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.view_list_outlined,
                        color: Colors.black87,
                        size: 18.0,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.grid_view,
                        color: Colors.black87,
                        size: 18.0,
                      )),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 10.0),
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: products!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return Container(
                          height: 700,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: Image.network(products![index].image));
                    }),
              ),
            ),
          ],
        ),
        replacement: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
