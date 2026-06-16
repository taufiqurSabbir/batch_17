import 'package:batch_17/module_10/crud/controller/productcontroller.dart';
import 'package:flutter/material.dart';

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {

ProductController productController = ProductController();


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

Future fetchData() async{
  await productController.fetchProducts();
  setState(() {

  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product from API'),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8

          ),
          itemCount: productController.products.length,
          itemBuilder: (context,index){
            final product = productController.products[index];
            return Card(
              child: Container(
                child: productController.isLoding ? CircularProgressIndicator() : Column(
                  children: [
                    SizedBox(
                        height: 140,
                        child: Image.network(product.img.toString())),
                    Text(product.productName.toString(), style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold
                    ),),
                    
                    Text('price: ${product.unitPrice} | QTY: ${product.qty}'),
              
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: (){},icon: Icon(Icons.edit,color: Colors.orange,),),
                        IconButton(onPressed: (){},icon: Icon(Icons.delete,color: Colors.red,),),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
