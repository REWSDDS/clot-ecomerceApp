import 'package:alfa/core/model/address_model.dart';
import 'package:alfa/core/model/cloth_model.dart';
import 'package:alfa/core/model/payment_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static late Box box;
  static late Box boxAdd;
  static late Box cardbox;

  static const String boxName = 'liked_cloth';
  static const String boxAddress = 'address_add';
  static const String cardBoxName = 'card_box';

  // ! INIT
  static createBox() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ClothModelAdapter());
    Hive.registerAdapter(ClothSizeAdapter());
    Hive.registerAdapter(AddressModelAdapter());
    Hive.registerAdapter(PaymentModelAdapter());
    Hive.registerAdapter(KartaAdapter());
    box = await Hive.openBox<ClothModel>(boxName);
    boxAdd = await Hive.openBox<AddressModel>(boxAddress);
    cardbox = await Hive.openBox<PaymentModel>(cardBoxName);
  }

  // ! Plastik kartani cache ga qoshish
  static savePaymentCard(PaymentModel paymentModel) async {
    await Hive.box<PaymentModel>(cardBoxName).add(paymentModel);
  }

  // ! Obshiy kartalarni cache dan olish
  static Future<List<PaymentModel>> getAllPaymentCards() async {
    final box = Hive.box<PaymentModel>(cardBoxName);
    return box.values.toList();
  }

  static deletePaymentCard(int index) async {
    await Hive.box<PaymentModel>(cardBoxName).deleteAt(index);
  }

  static likeCloth(ClothModel model) async {
    await Hive.box<ClothModel>(boxName).add(model);
  }

  //?Address Save
  static addAddress(AddressModel model) async {
    await Hive.box<AddressModel>(boxAddress).add(model);
  }

  static unLikeCloth(ClothModel model) {
    List<ClothModel> liked = getAllLikedCloths();
    for (var i = 0; i < liked.length; i++) {
      if (liked[i] == model) {
        Hive.box<ClothModel>(boxName).deleteAt(i);
      }
    }

    getAllLikedCloths();
  }

  static deleteAddress(AddressModel model) {
    List<AddressModel> add = allAddress();
    for (var i = 0; i < add.length; i++) {
      if (add[i] == model) {
        Hive.box<AddressModel>(boxAddress).deleteAt(i);
      }
    }
    allAddress();
  }

  static List<ClothModel> getAllLikedCloths() {
    final box = Hive.box<ClothModel>(boxName);
    return box.values.toList();
  }

  //?Address Save
  static List<AddressModel> allAddress() {
    final box = Hive.box<AddressModel>(boxAddress);
    return box.values.toList();
  }

  static clearAllNews() async => await box.clear();
  //?Address Save
  static deleteAllAddress() async => await box.clear();
  // ! Clear data
}


// import 'package:hive/hive.dart';
// import 'person.dart';

// class HiveService {
//   static const String personBoxName = 'personBox';

//   /// Initialize the Hive and open the box.
//   Future<void> init() async {
//     await Hive.initFlutter();
//     Hive.registerAdapter(PersonAdapter());
//     await Hive.openBox<Person>(personBoxName);
//   }

//   /// Save a single Person object.
//   Future<void> savePerson(Person person) async {
//     final box = Hive.box<Person>(personBoxName);
//     await box.put(person.name, person); // Using name as the key for simplicity.
//   }

//   /// Save a list of Person objects.
//   Future<void> savePersons(List<Person> persons) async {
//     final box = Hive.box<Person>(personBoxName);
//     final Map<String, Person> personMap = { for (var person in persons) person.name: person };
//     await box.putAll(personMap);
//   }

//   /// Retrieve a single Person object by name.
//   Person? getPerson(String name) {
//     final box = Hive.box<Person>(personBoxName);
//     return box.get(name);
//   }

//   /// Retrieve all Person objects.
  // List<Person> getAllPersons() {
  //   final box = Hive.box<Person>(personBoxName);
  //   return box.values.toList();
  // }

//   /// Delete a Person object by name.
//   Future<void> deletePerson(String name) async {
//     final box = Hive.box<Person>(personBoxName);
//     await box.delete(name);
//   }
// }
