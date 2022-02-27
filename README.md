This GITHUB repo is attached with Dockerfile and Kubernetes Deployment YAML file.

Steps I followed to perform the task:

1. Wrote a Dockerfile and built an image.

    command: docker build -t xrplimage .

2. Login to docker hub in the terminal.

    command: docker login (in the next step enter your docker credentials)

3. After the image was built, the built image was pushed to docker hub with tag rajkrram/xrplimage:1.0

    command: docker tag xrplimage rajkrram/xrplimage:1.0
             docker push rajkrram/xrplimage:1.0

    Link to Dockerimage for reference : https://hub.docker.com/repository/docker/rajkrram/xrplimage

4. Next step was to configure minikube and kubectl.

    Step 1: Checked if Virtualization is supported in machine
   
    command: systeminfo

    Step 2: Download/Install kubectl, minikube utility & Add it to the Local ENV PATH

    Downloaded kubectl and minikube .exe extension files
    Created a new folder named minikube in c drive and pasted above two files(minikube and kubectl)
    Added environment vairables:
    Search ---> edit environment variables for your account ---> path ---> edit ---> path of the new folder created in C drive.

    Links used for reference : https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/ https://minikube.sigs.k8s.io/docs/start/

    Step 3: Download/Install docker desktop for windows 10

    Links used for reference: https://hub.docker.com/editions/community/docker-ce-desktop-windows

    Step 4: Start the Minikube (Specify the Driver)

    open cmd as an adminstrator 

    command: minikube start --driver=docker
    command: minikube status

    minikube image is finally installed in the docker desktop 

5. Deployment YAML file is then deployed by using below command

    command: kubectl apply -f xrpnlnodedeploy.yaml
    
    command: kubectl create deployment xrplnode --image=rajkrram/xrplimage:1.0 --replicas=2  (alternative command to run without using yaml file)
    
    using above command pods, deployment, replicasets are created.   
