resource "aws_appsync_graphql_api" "coffee" {
  authentication_type = "API_KEY"
  name                = "coffee"
  #   schema              = <<EOF
  # type Mutation {
  #   putPost(id: ID!, manufacturer: String!): Post
  # }

  # type Post {
  #   id: ID!
  #   manufacturer: String!
  # }

  # type Query {
  #   singlePost(id: ID!): Post
  # }

  # schema {
  #   query: Query
  #   mutation: Mutation
  # }
  # EOF
}

resource "aws_appsync_api_key" "coffee_api_key" {
  api_id = aws_appsync_graphql_api.coffee.id
}

resource "aws_appsync_datasource" "coffee_makers" {
  api_id           = aws_appsync_graphql_api.coffee.id
  name             = "coffee_makers"
  type             = "AMAZON_DYNAMODB"
  service_role_arn = aws_iam_role.appsync_role.arn

  dynamodb_config {
    table_name = "coffee_makers"
  }
}
resource "aws_appsync_datasource" "coffee_grinders" {
  api_id           = aws_appsync_graphql_api.coffee.id
  name             = "coffee_grinders"
  type             = "AMAZON_DYNAMODB"
  service_role_arn = aws_iam_role.appsync_role.arn

  dynamodb_config {
    table_name = "coffee_grinders"
  }
}

resource "aws_appsync_function" "example" {
  api_id                   = aws_appsync_graphql_api.coffee.id
  data_source              = aws_appsync_datasource.coffee_grinders.name
  name                     = "example"
  request_mapping_template = <<EOF
{
    "version": "2018-05-29",
    "method": "GET",
    "resourcePath": "/",
    "params":{
        "headers": $utils.http.copyheaders($ctx.request.headers)
    }
}
EOF

  response_mapping_template = <<EOF
#if($ctx.result.statusCode == 200)
    $ctx.result.body
#else
    $utils.appendError($ctx.result.body, $ctx.result.statusCode)
#end
EOF
}
