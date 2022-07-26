# BuildingSolution

Note: Using oracle slim image as base image for the docker along with python3 packages.
Also using OCI artifactory path to stor ethe built docker image, from which deploy file in kubernetes pulls.
This solution will work on kubernetes cluster deployed on OCI(Oracle cloud Infrastructure)

In this project, A basic application exposing 2 simple REST API endpoints (POST, GET) is implemented.

  - POST - store some persistent data

  - GET - retrieve data
/apps path has the code for the same

```
Endpoint	             Method(s)	        Usage
/appdetails	              post	        input the data in the form of json
/appdetails                   get               get the list of all the data stored
```


Implement automation that deploys and makes available the REST API endpoints on a Kubernetes environment

Implement automation that provisions all infrastructure elements that are used to run the solution
/artifacts path has the collections of files for the same.


The below command will build and push the example-app image to the repository(OCI artifactory path is used here for eg):
```
make build
```

For testing, after deploying all the files and deploying the pod, run the below script at /test/functional_test.sh.
