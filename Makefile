dockerdir = extra/docker
k8sdir = extra/k8s

define stripver
	$(shell sh -c 'ver=$(1); echo $${ver%.*}')
endef

default:

version:
	$(eval VERSION=$(shell jq -r .version < package.json))
	$(eval MINOR=$(call stripver,$(VERSION)))
	$(eval MAJOR=$(call stripver,$(MINOR)))

docker: version
	docker build \
		-t jwtd -t jwtd:$(MAJOR) -t jwtd:$(MINOR) -t jwtd:$(VERSION) \
		-f $(dockerdir)/Dockerfile .

k8s:
	kubectl apply -Rf $(k8sdir)

minikube-load:
	docker save jwtd | minikube image load -

.PHONY: default version docker
