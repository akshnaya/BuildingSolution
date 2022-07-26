##################################################################################
# Makefile
#
# To build and push the example-app image
#
###################################################################################

#Note: we will have to login to the objectstore phx.ocir.io/oraclegbudevcorp where the image resides
# before we proceed 

build: build-example-app push-example-app

build-example-app:
		docker build -t phx.ocir.io/oraclegbudevcorp/cnedev-shared/baseimages/user/akshnaya/example-app .

push-example-app: 
		docker push phx.ocir.io/oraclegbudevcorp/cnedev-shared/baseimages/user/akshnaya/example-app

