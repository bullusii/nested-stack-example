## WHAT?

This is a writer lambda.
It creates a lambda that writes to S3 bucket created in the master stack
It also creates a policy that allows access to the S3 bucket

RUN IN THIS DIRECTORY:

sam build -u -t template.yml
sam package --s3-bucket BUCKET --template-file template.yml

COPY the hash output
DUPLICATE the template.yml > template.package.yml
REPLACE CodeUri value with s3://$BUCKET/$HASH

aws s3 cp template.package.yml s3:BUCKET/DESIRED_LOCATION

The desired location above will need to be referenced in the global template for templateURL.
