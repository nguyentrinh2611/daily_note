// ignore_for_file: public_member_api_docs, sort_constructors_first

// Package imports:
import 'package:bunnynote/core/error/failures.dart';
import 'package:bunnynote/core/usecases/usecase.dart';
import 'package:bunnynote/features/register/domain/entities/task.dart';
import 'package:bunnynote/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:dartz/dartz.dart';

class AddNewTask extends UseCase<String, AddNewTaskParams> {
  final TasksRepository repository;
  AddNewTask({
    required this.repository,
  });
  @override
  Future<Either<Failure, String>?> call(AddNewTaskParams params) async {
    return await repository.addNewTask(newTask: params.newTask);
  }
}

class AddNewTaskParams extends DefaultParams {
  final SCTask newTask;
  const AddNewTaskParams({
    required this.newTask,
  });
}
