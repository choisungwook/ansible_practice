create_builder:
	docker buildx create --name multiarch-builder --use
	docker buildx inspect --bootstrap

build:
	docker buildx build --platform linux/arm64/v8,linux/amd64 -t choisunguk/ansible:3.11.7-bookworm-controller-noroot -f debian-controller.Dockerfile .
	docker buildx build --platform linux/arm64/v8,linux/amd64 -t choisunguk/ansible:3.11.7-bookworm-managed-node-noroot -f debian-managed-node.Dockerfile .
	docker buildx build --platform linux/arm64/v8,linux/amd64 -t choisunguk/ansible:3.9-rocky-managed-node-noroot -f rocky-managed-node.Dockerfile .

push:
	docker buildx build --push --platform linux/arm64/v8,linux/amd64 -t choisunguk/ansible:3.11.7-bookworm-controller-noroot -f debian-controller.Dockerfile .
	docker buildx build --push --platform linux/arm64/v8,linux/amd64 -t choisunguk/ansible:3.11.7-bookworm-managed-node-noroot -f debian-managed-node.Dockerfile .
	docker buildx build --push --platform linux/arm64/v8,linux/amd64 -t choisunguk/ansible:3.9-rocky-managed-node-noroot -f rocky-managed-node.Dockerfile .
