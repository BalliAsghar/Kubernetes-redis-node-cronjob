.DEFAULT_GOAL := deploy

deploy:
	@echo "Building and deploying the app..."

	docker build -t node-app:1.0.0 .

	@echo "load image to k3d cluster..."
	k3d image import node-app:1.0.0 -c Edge

	@echo "Restarting app..."
	kubectl rollout restart deployment node-app -n node-app-namespace

	@echo "Done!"

