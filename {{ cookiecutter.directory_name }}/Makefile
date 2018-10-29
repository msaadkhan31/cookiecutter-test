{% if cookiecutter.dockerenv -%}
    {% set publish_artifact = 'ops/bin/create-push-docker-image.py' -%}
{% else -%}
    {% set publish_artifact = 'ops/bin/upload-eb-version.py' -%}
{% endif %}
.DEFAULT_GOAL := package
clean:
	mvn clean

package: clean
	mvn -B install -DskipTests=true
	mvn package -U

python-requirements:
	chmod +x ops/bin/download_scripts.sh
	ops/bin/download_scripts.sh python
	ops/bin/packages.sh
	chmod +x ops/bin/*

deploy-qa: python-requirements package
	{{ publish_artifact }} --profile=qa --service={{ cookiecutter.service_name }}
	ops/bin/deploy-qa.py --profile=qa --servicSe={{ cookiecutter.service_name }}

deploy-stb: python-requirements package
	{{ publish_artifact }} --profile=stb --service={{ cookiecutter.service_name }}
	ops/bin/deploy-qa.py --profile=stb --service={{ cookiecutter.service_name }}

merge-rc: python-requirements
	ops/bin/merge-branch.sh release-candidate

dryrun-prod: python-requirements package
	{{ publish_artifact }} --profile=prod --service={{ cookiecutter.service_name }}
	ops/bin/deploy-prod.py --profile=prod --service={{ cookiecutter.service_name }} --dryrun=true

deploy-prod: python-requirements package
	{{ publish_artifact }} --profile=prod --service={{ cookiecutter.service_name }}
	ops/bin/deploy-prod.py --profile=prod --service={{ cookiecutter.service_name }} --dryrun=false

ten-percent-prod: python-requirements
	ops/bin/dns-weights-routing.py --profile=prod --service={{ cookiecutter.service_name }} --weight=10

health-check-prod: python-requirements
	ops/bin/health-check.py --profile=prod --service={{ cookiecutter.service_name }}

rollback-new-prod: python-requirements
	ops/bin/dns-weights-routing.py --profile=prod --service={{ cookiecutter.service_name }} --weight=0
	ops/bin/rollback-new-deployment.py --profile=prod --service={{ cookiecutter.service_name }}

full-traffic-prod: python-requirements
	ops/bin/dns-weights-routing.py --profile=prod --service={{ cookiecutter.service_name }} --weight=100

destroy-old-prod: python-requirements
	ops/bin/destroy-idle-env.py --profile=prod --service={{ cookiecutter.service_name }}
