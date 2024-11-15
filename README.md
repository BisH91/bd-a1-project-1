# BD-A1 Project

## Overview
This project demonstrates a complete data processing pipeline using Docker. It includes:
- Data Cleaning
- Exploratory Data Analysis (EDA)
- Visualization
- K-means clustering

The pipeline runs entirely within a Docker container. The outputs are copied to the host machine using a bash script.

---

## Project Structure
- **load.py**: Loads the dataset and starts the pipeline.
- **dpre.py**: Handles data preprocessing tasks, including cleaning and transformation.
- **eda.py**: Conducts exploratory data analysis and saves insights as text files.
- **vis.py**: Creates a visualization and saves it as an image.
- **model.py**: Applies K-means clustering and saves the cluster distribution as a text file.
- **final.sh**: Bash script to copy results from the container to the host machine and stop the container.
- **Dockerfile**: Builds the Docker image for the pipeline.
- **twitterdata.csv**: The dataset used for this project.

## Setup and Execution Steps

### Step 1: Clone the Repository
Clone the project repository and navigate to the project directory:
```bash
git clone https://github.com/yourusername/bd-a1.git
cd bd-a1
```

### Step 2: Build the Docker Image
Build the Docker image using the provided `Dockerfile`:
```bash
docker build -t bd-a1-image .
```

### Step 3: Run the Docker Container
Start a Docker container using the built image:
```bash
docker run -it --name bd-a1-container bd-a1-image
```

### Step 4: Start the Pipeline
Inside the container, execute the pipeline by running:
```bash
python3 /home/doc-bd-a1/load.py /home/doc-bd-a1/twitterdata.csv
```
This command will:
- Load the dataset
- Perform data preprocessing
- Conduct exploratory data analysis
- Generate visualizations
- Apply K-means clustering

The results are saved in the container at `/home/doc-bd-a1/`.

### Step 5: Copy Output Files to Host Machine
Exit the container and run the provided `final.sh` script on your host machine to copy the results:
```bash
bash final.sh
```
This script will:
- Create a `service-result/` directory on your host
- Copy the following files:
  - `res_dpre.csv`: Preprocessed dataset
  - `eda-in-X.txt`: EDA insights
  - `vis.png`: Visualization
  - `k.txt`: K-means clustering results

### Step 6: Stop the Docker Container
After copying the results, stop the container:
```bash
docker stop bd-a1-container
```

---

## Docker Commands Summary
Here are all the Docker commands used in this project:
- Build the Docker image:
  ```bash
  docker build -t bd-a1-image .
  ```
- Run the Docker container:
  ```bash
  docker run -it --name bd-a1-container bd-a1-image
  ```
- Copy files from the container to the host:
  ```bash
  docker cp bd-a1-container:/home/doc-bd-a1/ ./bd-a1/service-result/
  ```
- Stop the container:
  ```bash
  docker stop bd-a1-container
  ```
- Remove the container (optional):
  ```bash
  docker rm bd-a1-container
  ```


## Outputs
After running the pipeline, the following files will be available in the `service-result/` directory:
- **Preprocessed Data**: `res_dpre.csv`
- **EDA Insights**: `eda-in-1.txt`, `eda-in-2.txt`, etc.
- **Visualization**: `vis.png`
- **K-means Clustering Results**: `k.txt`



## Conclusion
This project demonstrates a complete data science pipeline within a Docker container. It showcases the use of Python for data analysis, visualization, and machine learning, while leveraging Docker for portability and reproducibility.


