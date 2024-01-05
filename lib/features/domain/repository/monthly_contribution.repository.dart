import 'package:clean_architeture_flutter/core/data/repositories/i_base.repository.dart';
import 'package:clean_architeture_flutter/features/data/model/monthlyContribution/monthly_contribution.model.dart';
import 'package:clean_architeture_flutter/features/domain/entity/monthlyContribution/monthly_contribution.entity.dart';

abstract class MonthlyContributionRepository extends IBaseRepository<
    MonthlyContribution, MonthlyContributionModel, dynamic> {}
