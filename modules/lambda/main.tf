module "label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"
  context = var.context
}

module "label_get_all_authors" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = module.label.context
  name    = "get-all-authors"
}

module "label_get_all_courses" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = module.label.context
  name    = "get-all-courses"
}

module "label_get_course" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = module.label.context
  name    = "get-course"
}

module "label_save_course" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = module.label.context
  name    = "save-course"
}

module "label_update_course" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = module.label.context
  name    = "update-course"
}

module "label_delete_course" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  context = module.label.context
  name    = "delete-course"
}

module "lambda_get_all_authors" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"
  publish = true

  function_name = module.label_get_all_authors.id
  description   = "Get all authors"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role   = false

  lambda_role = var.role_get_all_authors_arn

  source_path = "${path.module}/src/get_all_authors"

  environment_variables = {
    TABLE_NAME = var.table_authors_name
  }

  allowed_triggers = {
    ApiGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  use_existing_cloudwatch_log_group = true
  logging_log_group                 = var.logging_log_group_get_all_authors

  tags = module.label_get_all_authors.tags
}

module "lambda_get_all_courses" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"
  publish = true

  function_name = module.label_get_all_courses.id
  description   = "Get all courses"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role   = false

  lambda_role = var.role_get_all_courses_arn

  source_path = "${path.module}/src/get_all_courses"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  allowed_triggers = {
    ApiGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  use_existing_cloudwatch_log_group = true
  logging_log_group                 = var.logging_log_group_get_all_courses

  tags = module.label_get_all_courses.tags
}

module "lambda_get_course" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"
  publish = true

  function_name = module.label_get_course.id
  description   = "Get course"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role   = false

  lambda_role = var.role_get_course_arn

  source_path = "${path.module}/src/get_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  allowed_triggers = {
    ApiGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  use_existing_cloudwatch_log_group = true
  logging_log_group                 = var.logging_log_group_get_course

  tags = module.label_get_course.tags
}

module "lambda_save_course" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"
  publish = true

  function_name = module.label_save_course.id
  description   = "Save course"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role   = false

  lambda_role = var.role_save_course_arn

  source_path = "${path.module}/src/save_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  allowed_triggers = {
    ApiGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  use_existing_cloudwatch_log_group = true
  logging_log_group                 = var.logging_log_group_save_course

  tags = module.label_save_course.tags
}

module "lambda_update_course" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"
  publish = true

  function_name = module.label_update_course.id
  description   = "Update course"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role   = false

  lambda_role = var.role_update_course_arn

  source_path = "${path.module}/src/update_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  allowed_triggers = {
    ApiGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  use_existing_cloudwatch_log_group = true
  logging_log_group                 = var.logging_log_group_update_course

  tags = module.label_update_course.tags
}

module "lambda_delete_course" {
  source  = "terraform-aws-modules/lambda/aws"
  version = "7.2.3"
  publish = true

  function_name = module.label_delete_course.id
  description   = "Delete course"
  handler       = "index.handler"
  runtime       = "nodejs16.x"
  create_role   = false

  lambda_role = var.role_delete_course_arn

  source_path = "${path.module}/src/delete_course"

  environment_variables = {
    TABLE_NAME = var.table_courses_name
  }

  allowed_triggers = {
    ApiGatewayAny = {
      service    = "apigateway"
      source_arn = "${var.aws_api_gateway_rest_api_execution_arn}/*/*/*"
    }
  }

  use_existing_cloudwatch_log_group = true
  logging_log_group                 = var.logging_log_group_delete_course

  tags = module.label_delete_course.tags
}
