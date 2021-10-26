import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:grocery_app/models/Category.dart';
import 'package:grocery_app/models/store.dart';

class HomeController extends GetxController {
  int i = 0;
  final List<Category> categories = [];
  final List<String> ads = [];
  final List<Store> stores = List();
  //final Map<Category, List<Store>> stores = Map();
  FirebaseApp app;
  FirebaseFirestore firestore;

  void FirebaseInitialize() async {
    //List<Category> c=[];
    if (categories.isNotEmpty) {
      categories.clear();
    }
    if (stores.isNotEmpty) {
      stores.clear();
    }
    app = await Firebase.initializeApp();
    print("Firebase initialized");

    firestore = FirebaseFirestore.instance;
    print("Firestore initialized");
    getCategories();
    //print("aya 3ad"+c.isEmpty.toString());
    getAds();

    // c.forEach((element) {
    //   categories.add(element);
    // });
    update();
// print("chnwa length"+categories.length.toString());
    getStores();

    update();
  }

  getAds() {
    int j = 0;
    firestore.collection("Ads").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.id);
        //print(result.data());
        List list = result.data().values.toList();
        //Category category = Category(list[1], list[0],result.id);
        //print(list[0]);
        // print(category.name);
        // print(category);
        for (int k = 0; k < list[0].length; k++) {
          ads.add(list[0][k]);
          print("ads length" + ads.length.toString());
        }
        j++;
      });
    });
  }

  getStores() {
    firestore.collection("Stores").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.data());
        print("heni hne" + result.id);
        List list = result.data().values.toList();
        for (var l in list) {
          print(l);
        }
        //print(list);
        print("list:" + list.length.toString());

        // DocumentReference dr = result.reference;

        DocumentReference dr = result['category'];
        print("ref is" + dr.toString());

        dr.get().then((DocumentSnapshot ds) {
          String id = ds.id;

          final found =
              categories.firstWhere((element) => element.id == id, orElse: () {
            return null;
          });
          print(found);
          // Category category=getCategory(id);
          Store s = Store(
              id: result.id,
              description: result['description'],
              manager: result['manager'],
              phone: result['phone'],
              opentime: result['open_time'],
              long: result['long'],
              closetime: result['close_time'],
              zipCode: result['zip_code'],
              available: result['open_days'],
              lat: result['lat'],
              address: result['address'],
              image: result['image'],
              city: result['city'],
              images: result['images'],
              social: result['Social'],
              country: result['country'],
              email: result['email'],
              name: result['name'],
              category: found);
          print("walit object " + s.id);
          // print(s.category.name);
          stores.add(s);
        });
        print("stores:" + stores.length.toString());
      });
      print("stores:" + stores.length.toString());
    });
  }

  getStoresByCategory(String category) {
    final found = stores.where((element) => element.category.name == category);

    List<Store> foundStores = found.toList();
    return foundStores;
  }

  // Category getCategory(String id) {
  //   firestore.collection("Categories").doc(id).get().then((querySnapshot) {
  //     List<dynamic> list = querySnapshot.data().values.toList();
  //     Category category = Category(list[1], list[0]);

  //     return category;
  //   });
  // }

  // void getStores() {
  //   print("length=" + categories.length.toString());
  //   for (int i = 0; i < categories.length; i++) {
  //     List<Store> store = List();
  //     stores[categories[i]] = store;
  //   }
  //   stores.forEach((key, value) {
  //     print(key);
  //     print(value);
  //   });
  //   firestore.collection("Stores").get().then((querySnapshot) {
  //     querySnapshot.docs.forEach((result) {
  //       // print(result.data());
  //       List list = result.data().values.toList();
  //       // print(list);
  //       DocumentReference dr = result.data().values.toList()[0];
  //       dr.get().then((DocumentSnapshot ds) {
  //         String id = ds.id;
  //         Category category = getCategory(id);
  //         Store s = Store(
  //             manager: list[1],
  //             phone: list[2],
  //             long: list[3],
  //             zipCode: list[4],
  //             lat: list[5],
  //             address: list[6],
  //             city: list[7],
  //             social: list[8],
  //             country: list[9],
  //             name: list[10],
  //             email: list[11],
  //             category: category);
  //         print(s.name);
  //         stores[category].add(s);
  //       });
  //     });
  //     //getReference();
  //     // List list=result.data().values.toList();
  //     // Category category=Category(list[1],list[0]);
  //     // print(list[0]);
  //     // print(category.name);
  //     // print(category);
  //     // categories.add(category);
  //     // print(categories[i].name);
  //     // i++;
  //   });
  //   stores.forEach((key, value) {
  //     print(key.name + ":");
  //     print(value);
  //   });

  //   update();
  // }

// void onInit(){
//   getCategories();
//   super.onInit();
// }

  void getCategories() {
    firestore.collection("Categories").get().then((querySnapshot) {
      querySnapshot.docs.forEach((result) {
        print(result.id);
        //print(result.data());
        List list = result.data().values.toList();
        Category category =
            Category(name: list[1], image: list[0], id: result.id);
        //print(list[0]);
        // print(category.name);
        // print(category);
        categories.add(category);
        i++;
        print(categories.length);
      });
    });

    print("chnwa length" + categories.length.toString());

    update();
  }
}
