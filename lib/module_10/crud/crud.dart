import 'package:batch_17/module_10/crud/controller/productcontroller.dart';
import 'package:flutter/material.dart';

import 'model/productmodel.dart';

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


productDialog(){
TextEditingController productNameController = TextEditingController();
TextEditingController productIMGController = TextEditingController();
TextEditingController productQTYController = TextEditingController();
TextEditingController productUnitPriceController = TextEditingController();
TextEditingController productTotalPriceController = TextEditingController();
showDialog(context: context, builder: (context)=>AlertDialog(
  title: Text('Add Product'),
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      TextField(
        controller: productNameController,
        decoration: InputDecoration(
          labelText: 'Name',
          border: OutlineInputBorder()
        ),
      ),
      SizedBox(height: 10,),
      TextField(
        controller: productIMGController,

        decoration: InputDecoration(
            labelText: 'Image',
            border: OutlineInputBorder()
        ),
      ),
      SizedBox(height: 10,),
      TextField(
        controller: productQTYController,

        decoration: InputDecoration(
            labelText: 'QTY',
            border: OutlineInputBorder()
        ),
      ),
      SizedBox(height: 10,),
      TextField(
        controller: productUnitPriceController,

        decoration: InputDecoration(
            labelText: 'Unit price',
            border: OutlineInputBorder()
        ),
      ),
      SizedBox(height: 10,),
      TextField(
        controller: productTotalPriceController,

        decoration: InputDecoration(
            labelText: 'Total Price',
            border: OutlineInputBorder()
        ),
      ),
      SizedBox(height: 10,),
    ],
  ),
  actions: [
    TextButton(onPressed: (){
      Navigator.pop(context);
    }, child: Text('Cancel')),

    ElevatedButton(onPressed: (){
      productController.createProducts(Data(
        productName: productNameController.text,
        img: productIMGController.text,
        qty: int.parse(productQTYController.text),
        unitPrice: int.parse(productUnitPriceController.text),
        totalPrice: int.parse(productTotalPriceController.text)
      )).then((value) async {
        if(value){
          await fetchData();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Product Deleted...!'))
          );

        }else{
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Something wrong...!'))
          );
        }
      });
    }, child: Text('Save'))
  ],
));
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
                        IconButton(onPressed: () async {


                         await productController.deleteProduct(product.sId.toString())
                              .then((value) async {
                            if(value){
                              await fetchData();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Product Deleted...!'))
                              );

                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Something wrong...!'))
                              );
                            }
                          });




                        },icon: Icon(Icons.delete,color: Colors.red,),),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
      
      floatingActionButton: FloatingActionButton(onPressed: (){
        productDialog();
      }, child: Icon(Icons.add),),
    );
  }
}
