import 'package:equatable/equatable.dart';

class WatchList extends Equatable{

  final String statusCode;
  final String statusMessage;

  const WatchList({required this.statusCode,required this.statusMessage});

  @override
  List<Object?> get props =>[
    statusCode,
    statusMessage
  ];

}