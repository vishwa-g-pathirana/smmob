class data {
  String? name ;
  String? prodID ;
  String? url ;
data();
  Map<String, dynamic> toJson() => {'name': name , 'proID': prodID, 'url':url};
  data.fromSnapshot(snapshot)
  : name = snapshot.data()['name'],
        prodID = snapshot.data()['proID'],
        url = snapshot.data()['url'];
}