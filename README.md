## WHAT IS THIS?
Demo for cloudformation nested stacks

TODO;

This is an example of using nested stacks.

- Shows how to handle dependencies
- Shows how to retain S3 bucket on Deletion
- How to pass variables from global to child stack
- Maintain standards in children stacks
- Use of outputs
- Shows how to organize code


WILL Document:
- How to deploy the global stack
- Versioning Example and update of child


##DEPLOYMENT
Follow readmes for each component and deploy them prior to deploying the global template.
The global template will require 3 URLs and a S3 bucket as inputs before you can deploy.

```aws cloudformation deploy --stack-name cf-nested-test --template-file global-template.yml --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND```

CHANGE VERSION:
###Creates change set but does not deploy (remove --no-execute-changeset to deploy)
```aws cloudformation deploy --stack-name cf-nested-test --template-file global-template.yml --parameter-overrides Version=V2.0.0 --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND --no-execute-changeset```

RUN NEXT COMMAND TO SEE CHANGES
