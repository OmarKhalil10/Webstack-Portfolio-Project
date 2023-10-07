# Webstack-Portfolio-Project:This is the final project in my 12-month ALX Software Engineer Program 

# Centralized-and-Automated-Medical-Image-Analysis-Laboratory

## Development Setup
1. **Download the project starter code locally**
```
git clone https://github.com/John0Isaac/Centralized-and-Automated-Medical-Image-Analysis-Laboratory.git
cd Centralized-and-Automated-Medical-Image-Analysis-Laboratory
```

2. **Before and After editing your code, Use the commands below:**

before editing anything pull new changes from GitHub.
```
git pull
```
Once you are done editing, you can push the local repository to your Github account using the following commands.
```
git add .
git commit -m "your comment message"
git push
```

3. **Initialize and activate a virtualenv using:**
```
python -m virtualenv venv
source venv/bin/activate
```
>**Note** - In Windows, the `venv` does not have a `bin` directory. Therefore, you'd use the analogous command shown below:
```
source venv/Scripts/activate
deactivate
```

4. **Install the dependencies:**
```
pip install -r requirements.txt
```

5. **Run the development server:**
```
export FLASK_APP=app.py
export FLASK_ENV=development
export FLASK_DEBUG=true
flask run --reload
```

6. **Verify on the Browser**<br>
Navigate to project homepage [http://127.0.0.1:5000/](http://127.0.0.1:5000/) or [http://localhost:5000](http://localhost:5000)


# Adding Routes
## To add a new page
* Create the html, css, js in the specified folder using the same folder structure.
* Create a new route in the [app.py](./app.py) file with the name you want using only dashes to seperate words.
```PYTHON
@app.route('NEW-ROUTE')
```
* Define your serving function using a unique name not used before in the whole application.
```PYTHON
def NEW_UNIQUE_NAME():
```
* Return your html file path using render_template.
```PYTHON
return render_template('FOLDER_PATH/FILE_PATH.html')
```
* Your newely created route should look like this.
```PYTHON
@app.route('NEW-ROUTE')
def NEW_UNIQUE_NAME():
    return render_template('FOLDER_PATH/FILE_PATH.html')
```

## To run the development server
* Open git bash terminal
```bash
FLASK_APP=app.py
FLASK_ENV=development
flask run --reload
```

# Push to Production
## 1. Set up GCP account, project, etc.

```
export MY_EMAIL_ADDRESS=omar@bamboogeeks.com
export MY_PROJECT_ID=ml-tf-398511
```

## 2. Configure your project.

```
gcloud config set account $MY_EMAIL_ADDRESS
gcloud auth login $MY_EMAIL_ADDRESS
gcloud config set project $MY_PROJECT_ID
```

## 3. Build a Docker image of the Flask application

1. Test docker connectivity
```
docker ps
```

2. Build docker image locally
```
./run_docker.sh
```

## 4. Push the Docker image to Container Registry 

```
docker push gcr.io/$MY_PROJECT_ID/camil:v1
```

### Container Registry Repository

![Container Registry Repository](/static/docs/3.png)

### Docker image

![Docker image](/static/docs/4.png)

### Docker image details

![Docker image details](/static/docs/5.png)

## 5. Deploy a Docker image on Cloud Run

```
gcloud run deploy ca-mil \
 --image gcr.io/$MY_PROJECT_ID/camil:v1 \
 --region europe-west6 \
 --platform managed \
 --memory 8Gi \
 --cpu 2 \
 --max-instances 25
```

### Cloud Run revision for dogbreedspotter

![Cloud Run](/static/docs/6.png)


#### Use the gcloud run revisions list command to list all revisions of your Cloud Run service. Replace <SERVICE_NAME> with the name of your service.

```
gcloud run revisions list --platform managed --region europe-west6 --service ca-mil --format="value(name)" | sort
```

#### Use the gcloud run revisions delete command to delete each of the old revisions. Replace <REVISION_NAME> with the name of each revision you want to delete. [If Any!]

```
gcloud run revisions delete <REVISION_NAME> --platform managed --region europe-west6 --quiet
```

#### NOTE
You can run this command for each old revision you copied in the previos step

#### Show the description of a specific revision in Google Cloud Run

```
gcloud run revisions describe dog-breed-spotter-00019-5s2 \
  --platform managed \
  --region europe-west6 \
```

## 14. Check the Flask application on Cloud Run

```
https://dog-breed-spotter-t6mbhrffxa-oa.a.run.app
```

Or you send HTTPS requests to the Cloud Run instance for testing

```
python request_main_v6.py
```

### The response can be found from the log on dog-breed-spotter-00019-5s2 instance on Cloud Run.

![dog-breed-spotter-00019-5s2 logs](/static/docs/7.png)

## Contributions

Contributions and enhancements to **CA-MIL** are welcome! Feel free to fork the repository, make improvements, and submit pull requests.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/OmarKhalil10/DogBreedSpotter/blob/main/LICENSE) file for details.

## Authors

- [Omar Khalil]

## Contact

If you have any questions or suggestions, please feel free to [contact me](mailto:omar.khalil498@gmail.com).


### NOTE:
We shall build the Docker image and push it to Container Registry on GCP. The service name is defined as camil with tag v1

1. Authenticating with existing credentials
```
docker login
```

2. Build your docker image
```
./run_docker.sh
```



## Future Work
- [ ] validate emails sent using both news letter and contact us
- [ ] make muiltiple version of the logo with multiple sizes to fix different screen sizes
- [ ] create a database with all required data about vaccination centers, doctors, pharmacies and hospitals
- [ ] add a 2 tables to this database, one for contact us and another one for our news letter subscipers
- [ ] add more detectors for diseases like ones mentioned in the sides for future work
