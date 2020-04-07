# Ruby Lambda Layer

This repo provides a number of Ruby gems (such as pg) to Lambda functions that
include this layer, so that they can use those gems without having to bundle
them.

## Usage

Add gems that you want to include in the layer to the Gemfile, then run
`./build.sh`. You can deploy the layer to AWS by via `sls deploy`. The output of
that command will show the ARN of the layer, which you can then use in the
configuration for Lambda functions that use this layer, as described in the
[Serverless documentation][docs].

This layer can also be deployed via the AWS CLI:

```shell
$ cd layer
$ zip -r layer.zip ./lib ./ruby/ -x ./ruby/2.5.0/cache/\*
$ aws lambda publish-layer-version \
         --layer-name gemPacks \
         --region us-east-1 \
         --compatible-runtimes ruby2.5 \
         --zip-file fileb://layer.zip
```

## Credit

Based on https://github.com/BranLiang/aws-ruby-lambda-layer, which was based on https://github.com/dschep/sqlite-lambda-layer/

[docs]:https://serverless.com/framework/docs/providers/aws/guide/functions/#layers