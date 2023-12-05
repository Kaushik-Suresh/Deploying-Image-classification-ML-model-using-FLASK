# Deploying-Image-classification-ML-model-using-FLASK
To serve a image classification model using flask with docker conatiner in AWS Beanstalk

# Architecture 

![Proposed system design of the cloud infrastructure![Uploading image.png…](https://github.com/Kaushik-Suresh/Deploying-Image-classification-ML-model-using-FLASK/blob/main/Architecture.png)


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
- In parallel, I evaluated three cloud solution providers: Amazon Web Services (AWS), Google Cloud Platform (GCP), and Microsoft Azure. This evaluation was on four criteria: service offering, cost, industry coverage(share), and the learning curve. On these criteria, AWS was selected as it proved to be the most cost-effective and offered more options than its competing platforms. 

AWS provides three options that help to deploy our model in the cloud, and they are Lambda function, Elastic Beanstalk, and SageMaker. In the below table, I draw a comparison between these three options provided by AWS, and the comparison is drawn on the four factors that motivated to choose AWS Beanstalk.

![Comparison of cloud services](https://github.com/Kaushik-Suresh/Deploying-Image-classification-ML-model-using-FLASK/blob/main/static/Comparison%20of%20cloud%20services.png)

# 

# 5. FLASK App
The containerized flask app is built using Python 3.6 and relevant python libraries necessary for the development of a web app. The development and containerization of the flask app include five main stages.
 - Designed an user interface from which data can be uploaded and the result of the model prediction viewed by the user.
 - Built a sample image classification model which was incorporated into our code and stored in a .h model file
 - Read in a series of sample data (from the MNIST dataset) which was preprocessed and passed to the model for prediction.
 - Posted the results on the web interface and stored them in a CSV file in our local system
Now, having selected the service that will serve as the backbone of our architecture, we proceeded to build the other component of our architecture. The designed component (a flask app) was built locally and integrated into a docker container. The flask app was built such that it provided a minimal but friendly user interface for uploading the images to be predicted either as single files or in a batch of about five files at a time. After uploading the image(s), the classification was done automatically by the model. After testing for full functionality on a local computer, the containerized app was transferred to the host Beanstalk environment. Once on Beanstalk, the full architecture was again tested before full deployment.

![Front end using the FLask App to upload the image files](https://github.com/Kaushik-Suresh/Deploying-Image-classification-ML-model-using-FLASK/blob/main/static/Front%20end.png)

  
# 6. Docker
Once the app was tested and bug-free, I integrated it into a docker container. The containerized app was t)hen uploaded to the cloud environment which had been set up using Amazon Beanstalk.

![AWS Console showing the successful deployment of Flask app](https://github.com/Kaushik-Suresh/Deploying-Image-classification-ML-model-using-FLASK/blob/main/static/Docker%20in%20AWS.png)

# 7. Results 

The flask app notifies the user by listing the set of images uploaded and the classification results of those images could be downloaded in a Comma Separated File (CSV) format as shown in below figure.
![Results](https://github.com/Kaushik-Suresh/Deploying-Image-classification-ML-model-using-FLASK/blob/main/static/Results.png)


