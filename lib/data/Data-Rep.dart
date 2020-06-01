import 'package:epass/data/StateModel.dart';
class Repository {

  List<Map> getAll() => _chhattisgarh;

  getLocalByState(String district) => _chhattisgarh
      .map((map) => StateModel.fromJson(map))
      .where((item) => item.district == district)
      .map((item) => item.lgas)
      .expand((i) => i)
      .toList();


  List<String> getStates() => _chhattisgarh
      .map((map) => StateModel.fromJson(map))
      .map((item) => item.district)
      .toList();

  List _chhattisgarh = [
  {
  "district": "Balod",
  "alias": "balod",
  "lgas": [
  "Balod City",
  "Arjunda",
  "Gunderdehi",
  "Gurur",
  "Chikhlakasa",
  "Dondi Lohara",
  "Dondi",
  "Dalli Rajhara",
  "Sanjari Balod"
  ]
},
{
"district": "Korba",
"alias": "korba",
"lgas": [
"Korba City",
"Katghora",
"Kartala",
"Korba",
"Chhurikala",
"Dipka",
"Pali",
"Pondi Uproda"
]
},
{
"district": "Surguja",
"alias": "surguja",
"lgas": [
"Ambikapur CIty",
"Udaipur",
"Batauli",
"Mainpat",
"Lakhanpur",
"Lundra",
"Sitapur"
]
}
];}