default:

format:
	@ \
	terragrunt hcl fmt \
	&& tofu fmt -recursive

mikrotik-certificate:
	@ \
	cd live/mikrotik-certificate \
	&& terragrunt apply >/dev/null

mikrotik-config:
	@ \
	cd live/mikrotik-config \
	&& terragrunt apply >/dev/null

network:
	@ \
	cd live/network \
	&& terragrunt apply >/dev/null \
	&& (terragrunt output -json \
	   | jq -r 'to_entries[] | "\(.key): \(.value.value | @json)"')

passwords:
	@ \
	cd live/passwords \
	&& terragrunt apply >/dev/null \
	&& (terragrunt output -json \
	   | jq -r 'to_entries[] | "\(.key): \(.value.value | @json)"')

root-ca:
	@ \
	cd live/root-ca \
	&& terragrunt apply >/dev/null
