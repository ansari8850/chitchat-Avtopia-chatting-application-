import 'package:chitchat/data/local_datasource/local_datasource.dart';
import 'package:chitchat/domain/entities/contact_entity.dart';
import 'package:chitchat/domain/repositories/get_device_number_repository.dart';

// class GetDeviceNumberRepositoryImpl implements GetDeviceNumberRepository {
//   final LocalDataSource localDataSource;

//   GetDeviceNumberRepositoryImpl({required this.localDataSource});
//   @override
//   Future<List<ContactEntity>> getDeviceNumbers() {
//     return localDataSource.getDeviceNumbers();
//   }
// }
class GetDeviceNumberRepositoryImpl implements GetDeviceNumberRepository {
  final LocalDataSource localDataSource;

  GetDeviceNumberRepositoryImpl({this.localDataSource});

  @override
  Future<List<ContactEntity>> getDeviceNumber() {
    return localDataSource.getDeviceNumbers();
  }
}
