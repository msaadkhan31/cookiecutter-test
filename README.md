#READ ME for User Data:

When you will run generate the boiler plate template, it will prompt you to provide the following information.

Below are the arguements with the description:

*Argument* | *Description* | *Value*
:---: | :---: | :---:
directory_name | Directory Name on the root: Default: ops | ops or empty
service_name | Name of your service | Ex: captain-service
application_name | Name of EB application name | Ex: Microservices
s3_bucket_name | Name where artifacts stored | Ex: careemeng-sbb
s3_key | Path under the bucket | microservices/captain-services
team_name | Your team name | tech-platform
team_name | Your email id | saad.khan@careem.com
project_slack_channel | Name of your slack channel | ci-cd_iac2_onboarding
jenkins_agent_label | Jenkins agent label default:pipeline-generator-agent | Name or empty
code_source | SCM selection | type 1 for phabricator
project_type | Type of your project | ex: maven
branch | Git branch from where your CI will run | Ex: latest
artifact_name | Name of your artifact in your pom file | ex: captain-service
artifact_path | path of the artifact in your repo default: target | empty or provide value
dockerenv | If you are env is dockerized type single or multi | keep empty if not docker otherwise `single` or `multi`
task_defination_path | task definition path  is the path of Docker.aws.json file kept in your repo | ex: aws/eng
dockerfile_path | Dockerfile path in your code | type your Dockerfile path or name is not `Dockerfile`
health_url | Health check URL default: health | type if your URL other then health


#KEY NOTES:
Service_name: The service name will be reflect on the following locations:

    - Route53 URL for qa, stb and prod : qa-{{ cookiecutter.service_name }}.careem-internal.com
    - ECR-repo: 848569320300.dkr.ecr.eu-west-1.amazonaws.com/{{ cookiecutter.service_name }}
    - And create a folder under ops with the name of your service_name
 If you want to change ECR or Route53 URL, open the file ops/bin/config.ini

