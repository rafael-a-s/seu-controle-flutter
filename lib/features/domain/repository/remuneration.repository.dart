import 'package:clean_architeture_flutter/core/data/repositories/i_base.repository.dart';
import 'package:clean_architeture_flutter/features/data/model/remuneration/remuneration.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/remuneration/remuneration.entity.dart';

abstract class RemunerationRepository
    extends IBaseRepository<Remuneration, RemunerationModel, dynamic> {}
