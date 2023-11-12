clean:
	rm -fr .terraform* *tfstate*
ti:
	terraform init
tp:
	terraform plan
ta:
	terraform apply
tv:
	terraform validate
taa:
	echo "" && echo "waiting....10sec..." && echo "" && sleep 10 && terraform apply --auto-approve
td:
	terraform destroy
tda:
	echo "" && echo "waiting....10sec..." && echo "" && sleep 10 && terraform destroy --auto-approve
