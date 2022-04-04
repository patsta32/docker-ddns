export REGISTRY="eu.gcr.io/ac-hunterr"
export DOCKER_REGISTRY="eu.gcr.io/ac-hunterr"
export IMAGE="patsta32/docker-ddns:latest"
export PROJECT_ID="ac-hunterr"
export GOOGLE_COMPUTE_ZONE="europe-west-3"
export COMPUTE_ZONE_OR_REGION=$GOOGLE_COMPUTE_ZONE

echo $REGISTRY
echo $DOCKER_REGISTRY

 gcloud auth activate-service-account --key-file=keyfile.json
 gcloud auth configure-docker --project $PROJECT_ID
 gcloud --quiet config set project $PROJECT_ID
 gcloud --quiet config set compute/zone $COMPUTE_ZONE_OR_REGION
 gcloud --quiet auth configure-docker

docker tag docker.io/patsta32/docker-ddns eu.gcr.io/ac-hunterr/patsta32/docker-ddns
docker push eu.gcr.io/ac-hunterr/patsta32/docker-ddns:latest