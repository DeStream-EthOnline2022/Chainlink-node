include .env

build:
	docker build -t $(IMAGE_NAME) .
login:
	aws ecr get-login-password --region ${AWS_REGION} --profile ${AWS_PROFILE}| docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com
tag:
	docker tag ${IMAGE_NAME} ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}:latest
push:
	docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${IMAGE_NAME}:latest
list:
	aws ecr list-images --repository-name ${IMAGE_NAME} --profile ${AWS_PROFILE} --region ${AWS_REGION}
