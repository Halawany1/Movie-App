import 'package:wather_app/movies/domain/entities/watch_list.dart';

class WatchListModel extends WatchList{
 const WatchListModel({required super.statusCode, required super.statusMessage});

  factory WatchListModel.fromJson(Map<String,dynamic> json)=>
      WatchListModel(
        statusCode:json['status_code'],
        statusMessage:json['status_message'],
      );
}