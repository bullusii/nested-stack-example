##WHAT?

This is the template for the S3 bucket.

This needs to be deployed to get the S3 location to use in the global-template.

##HOW?

aws s3 cp template.yml s3://YOURLOCATION
then use that S3:Location in TemplateURL in global-template
