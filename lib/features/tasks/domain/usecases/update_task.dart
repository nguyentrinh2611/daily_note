// ignore_for_file: public_member_api_docs, sort_constructors_first

// Package imports:
import 'package:bunnynote/core/usecases/usecase.dart';
import 'package:bunnynote/features/register/domain/entities/task.dart';
import 'package:bunnynote/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:dartz/dartz.dart';

// Project imports:
import '../../../../core/error/failures.dart';

class UpdateTaskParram extends DefaultParams {
  final List<SCTask> tasks;
  const UpdateTaskParram({
    required this.tasks,
  });
  @override
  List<Object?> get props => [isShowDefaultLoading, tasks];
}

class UpdateTask implements UseCase<String, UpdateTaskParram> {
  final TasksRepository repository;
  UpdateTask({
    required this.repository,
  });
  @override
  Future<Either<Failure, String>?> call(UpdateTaskParram params) async {
    return await repository.updateTask(parram: params);
  }
}
