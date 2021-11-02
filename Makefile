# 编译时间
msg := commit by ehlxr at $(shell date "+%Y-%m-%d %T")

.PHONY: push
push:
	git config core.sshCommand "ssh -i ~/.ssh/id_rsa_0vo -F /dev/null"
	git add --all && git commit -m "$(msg)" && git push

.PHONY: init
init:
	@ git pull
	@ rm -rf .git
	@ git init -b master && git add --all && git commit -m "$(msg)"
	@ git config core.sshCommand "ssh -i ~/.ssh/id_rsa_0vo -F /dev/null"
	@ git remote add origin git@github.com:0vo/oss.git
	@ git remote set-url --add origin git@git.ehlxr.me:ehlxr/oss.git
	@ git push -f --set-upstream origin master