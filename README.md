# CAKEPHP APPLICATION TASK
#Deployment of CAKEPHP APPLICATION AND DOCKER FILE

We have to clone the repository "https://github.com/Ritik8937/CAKEPHP.git" of CAKEPHP Application to our directory.

Step1: We create a docker file to dockerised this CAKEPHP appilcation. by command,

    $ vim Dockerfile

we can use any editor to create dockerfile. Step2: Now build this dockerfile to make docker image out of it.

    $ sudo docker build -t <image_name:tag> .

by using this command docker image is build, we can check it through this command,

    $ sudo docker images

Step3: Now, we have to run our image to create docker container of that image

    $ sudo docker run -it -P <image_name:tag>

we can see the port number by using command,

    $ sudo docker ps

Now, we can check our CAKEPHP Application are and running or not, for this open browser and give address http://localhost:port-number

Then we have to deploy this application on Kubernetes cluster. After setting up the Kubernetes cluster with kubeadm, create a deployment for this CAKEPHP Applicatiom on master node.

Step1:

    $ kubectl run cakephptried --image=8937960489/firstrepo:cakephp --restart=Never


Step2:
Check status of pods with this command,

    $ sudo kubectl get pods

Our deployment is successfully done ,

Step3: Now we should expose this pod to outside world for accessing the Application we use service as a NodePort.

    $ sudo kubectl expose deployment <deployment_name> --type=NodePort

Now, our deployment are exposed for accessing this check the svc to know the ports and ips.

    $ sudo kubectl get svc

Then, run our app on port given in NodePort. and we can it thorugh the port number which is shown when we run service command.
