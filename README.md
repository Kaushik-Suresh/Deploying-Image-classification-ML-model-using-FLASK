# Deploying-Image-classification-ML-model-using-FLASK
To serve a image classification model using flask with docker conatiner in AWS Beanstalk


# 1.	Problem background
Naturalis Biodiversity Center is involved in monitoring the biodiversity in the Netherlands. For this project, they are interested in recognizing and counting flowers of multiple species across the country. To achieve this, their biodiversity and computer vision (CV) researchers are working on a computer vision model that uses flower images to recognize the variety of the flower and count the number of flowers in those images. For now, they are using images clicked by biodiversity researchers in the field using cameras and the long-term plan is to use pictures collected by drones. Once the computer vision model is ready, Naturalis recognizes that it should be run in the cloud. Hence, they are seeking to have the design and a functional prototype of cloud infrastructure that will host the computer vision model which will ultimately be used by the researchers at Naturalis.

# 2. Goal specification and added value
As previously mentioned, it is important for the stakeholder to have an appropriate tool that the researchers at Naturalis can use to upload the flower images and the tool will also host the computer vision model which will make predictions about the type and number of flowers in those images. One way to offer a tool that is easy to access is to deploy it in a cloud environment. Therefore, the model can be accessed by the researchers through the internet, and the pictures can be stored and shared online.

The goal of the project is to: Design a functional cloud prototype capable of running a pre-trained computer vision model and displaying the predictions for new images as they get uploaded by biodiversity researchers.

# 3.	Strategy
- Amongst multiple alternatives existing in the market today, I propose a solution based on the Amazon Web Services (AWS) Elastic Beanstalk and Simple Storage Service (S3).
- The prototype uses the Flask framework to create the interface between the user and application and will run in a containerized environment called Docker.
- In the background the Elastic Beanstalk will provision the computation to run the model and host it on the web, it will also communicate with the S3, to store the images uploaded by the users.


# 4. Why AWS? 
- In parallel, I evaluated three cloud solution providers: Amazon Web Services (AWS), Google Cloud Platform (GCP), and Microsoft Azure. This evaluation was on four criteria: service offering, cost, industry coverage(share), and the learning curve. On these criteria, AWS was selected as it proved to be the most cost-effective and offered more options than its competing platforms. Next, I selected the most scalable, user-friendly service from among the options on AWS fit for our purpose, which in our case is the AWS Beanstalk.
Comparison of cloud services.png
![Comparison of cloud services](https://github.com/Kaushik-Suresh/Deploying-Image-classification-ML-model-using-FLASK/blob/main/static/Comparison%20of%20cloud%20services.png)

- 

# 5. FLASK App
The containerized flask app is built using Python 3.6 and relevant python libraries necessary for the development of a web app. The development and containerization of the flask app include five main stages.
 - Designed an user interface from which data can be uploaded and the result of the model prediction viewed by the user.
 - Built a sample image classification model which was incorporated into our code and stored in a .h model file
 - Read in a series of sample data (from the MNIST dataset) which was preprocessed and passed to the model for prediction.
 - Posted the results on the web interface and stored them in a CSV file in our local system
Now, having selected the service that will serve as the backbone of our architecture, we proceeded to build the other component of our architecture. The designed component (a flask app) was built locally and integrated into a docker container. The flask app was built such that it provided a minimal but friendly user interface for uploading the images to be predicted either as single files or in a batch of about five files at a time. After uploading the image(s), the classification was done automatically by the model. After testing for full functionality on a local computer, the containerized app was transferred to the host Beanstalk environment. Once on Beanstalk, the full architecture was again tested before full deployment.
  
# 6. Docker
Once the app was tested and bug-free, I integrated it into a docker container. The containerized app was then uploaded to the cloud environment which had been set up using Amazon Beanstalk.


3.2.	Cloud Environment
As mentioned above our strategy for cloud was driven by four factors mainly the cost-effectiveness, hence, it was decided to train the model locally. This will help to save the cost of training in the cloud. The trained model was then placed in a docker as it provides virtualization of all the dependencies of our model and application. We chose to deploy the dockerized container app on AWS using Amazon beanstalk. AWS Elastic Beanstalk is an easy-to-use service for deploying and scaling web applications and services. It charges based on the number of Amazon EC2 instances, the bandwidth consumed, and database or storage used and handles the complexities of managing the underlying infrastructure. 

AWS provides three options that help to deploy our model in the cloud, and they are Lambda function, Elastic Beanstalk, and SageMaker. In Table 3.1, we draw the comparison between these three options provided by AWS, and the comparison is drawn on the four factors which motivated our strategy for cloud deployment. 	

 
Figure 1 Comparison of AWS technologies for model deployment
 
4.	Results
Based on the above strategy, the system design of our final cloud product is illustrated in the figure 3.1. 

 
Figure 2 Proposed system design of the cloud infrastructure

Figure 4.1 gives us an overview of our cloud product and how different components interact with one another. At a fundamental level, as also described in strategy, we divided our product to two main components- local component consisting of flask app and a cloud component which deploys the flask app on the AWS. Thus, we will also present the results in two parts based on the two main components in section 4.1 and 4.2 respectively. 
 
4.1	 Results of the Containerized Flask App
The flask app is an easy-to-use and efficient front end, which acts as a bridge between the bio-diversity researchers and the deployed model in the cloud. Once the flask app is triggered manually the biodiversity researcher can access the app through the following URL address (http://127.0.0.1:5000/). The researcher could use the interface to select and upload the images that are required to be classified as shown in figure 4.3.
 
Figure 3 Frond end interface for the bio-diversity researchers to upload the images
The flask app notifies the user by listing the set of images uploaded and the classification results of those images could be downloaded in a Comma Separated File (CSV) format as shown in figure 4.3. 
 
Figure 4 Front end interface to download the image classification results




4.2 Results of Cloud Environment
                      
Figure 5 A view of Dockerized container in the Amazon Beanstalk
		

Once the flask app is ready, we then dockerize it and deploy it on AWS using beanstalk. The front end of the application is shown in section 4.1 above. The results of the cloud part cannot be illustrated like the results of section 4.1 because the cloud is serving as our back end. 

If our deployment of the flask container model is successful, the screen on the AWS console will look like the figure 4.5

          
Figure 6 AWS Console showing the successful deployment of Flask app
![image](https://github.com/Kaushik-Suresh/Deploying-Image-classification-ML-model-using-FLASK/assets/36950565/cc80e611-4784-4342-9132-8d531432345e)
