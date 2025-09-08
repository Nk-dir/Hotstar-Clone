## Hi there! this my new project
**Welcome to the Hotstart App Deployment project! This project demonstrates how to deploy a Hotstar Next.js application on Kubernetes cluster using modern DevOps tools, practices and following a DevSecOps approach.**

## 🛠️ **Tools & Services Used**

| **Category**       | **Tools**                                                                                                                                                                                                 |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Version Control** | ![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white)                                                                                                       |
| **CI/CD**           | ![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=flat-square&logo=jenkins&logoColor=white)                                                                                                    |
| **Code Quality**    | ![SonarQube](https://img.shields.io/badge/SonarQube-4E9BCD?style=flat-square&logo=sonarqube&logoColor=white)                                                                                              |
| **Containerization**| ![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)                                                                                                       |
| **Orchestration**   | ![Kubernetes](https://img.shields.io/badge/Kubernetes-326CE5?style=flat-square&logo=kubernetes&logoColor=white)                                                                                          |
| **Monitoring**      | ![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=flat-square&logo=prometheus&logoColor=white) ![Grafana](https://img.shields.io/badge/Grafana-F46800?style=flat-square&logo=grafana&logoColor=white) |
| **Security**        | ![OWASP](https://img.shields.io/badge/OWASP-000000?style=flat-square&logo=owasp&logoColor=white) ![Trivy](https://img.shields.io/badge/Trivy-00979D?style=flat-square&logo=trivy&logoColor=white)         |
| **IAC**             | ![Terraform](https://img.shields.io/badge/Terraform-623CE4?style=flat-square&logo=terraform&logoColor=white)
---
## 🚦 **Project Stages**

Phase 1: Deployment to Docker Container
Goal: To package the application into a portable, self-contained Docker image and verify its functionality in a local containerized environment.

- 1.1. Containerize the Application with Docker

    Task: Create a Dockerfile in the root of the project repository.
    
    Details: This file will define the step-by-step instructions to build the application image. It will include:
    
    Specifying a lightweight base image (e.g., node:18-alpine).
    
    Setting up the working directory.
    
    Copying package.json and installing dependencies to leverage Docker's layer caching.
    
    Copying the application source code into the image.
    
    Exposing the necessary port (e.g., EXPOSE 3000).

    Defining the command to run the application on container startup.

- Outcome: A complete Dockerfile that can be used to build a functional image of the application.

1.2. Build and Push Docker Image to a Container Registry

- Task: Build the Docker image and push it to a centralized registry.

    Details:
    
    Use the docker build command to create the image from the Dockerfile.
    
    Tag the image with a version number and the registry URL (e.g., your-registry/your-app:v1.0.0).
    
    Authenticate with the chosen container registry (e.g., Docker Hub, Amazon ECR).
    
    Push the tagged image to the registry using the docker push command.

- Outcome: The application's Docker image is stored and available in a remote container registry, ready for deployment.

1.3. Run and Validate the Application in a Docker Container

- Task: Run the image as a container on a local machine to ensure it works as expected.

    Details:
    
    Execute the docker run command, mapping the container's exposed port to a port on the local machine (e.g., -p 3000:3000).
    
    Access the application via http://localhost:3000 to perform functional checks.
    
    Review container logs using docker logs to check for any startup errors or runtime issues.

- Outcome: Confirmation that the containerized application runs correctly, validating the Docker image before moving to a clustered environment.

Phase 2: Deployment to EKS Cluster with Monitoring & Security
Goal: To deploy the containerized application onto a scalable and resilient AWS EKS cluster, integrating comprehensive monitoring and security tooling.

2.1. Deploy Application to Amazon EKS Cluster

- Task: Define Kubernetes configurations and deploy the application.

    Details:
    
    Provision an Amazon EKS cluster (if not already available).
    
    Create Kubernetes manifest files (deployment.yaml, service.yaml, ingress.yaml).
    
    The deployment.yaml will specify the Docker image from the registry, the number of replicas, resource limits, and environment variables.
    
    The service.yaml will expose the application within the cluster.
    
    Apply the manifests to the EKS cluster using kubectl apply -f <filename>.

- Outcome: The application is running and accessible within the EKS cluster.

2.2. Set up Prometheus and Grafana for Monitoring

- Task: Install and configure monitoring tools to observe application and cluster health.

    Details:
    
    Deploy Prometheus to the EKS cluster (e.g., using the official Helm chart) to collect metrics from Kubernetes nodes, pods, and application endpoints.
    
    Deploy Grafana to the cluster (e.g., using its Helm chart).
    
    Configure Grafana to use Prometheus as its data source.
    
    Import or create Grafana dashboards to visualize key metrics, such as CPU/memory usage, request latency, error rates, and pod status.

- Outcome: A complete monitoring stack providing real-time visibility into the application's performance and the cluster's health.

2.3. Implement Trivy and OWASP for Security

- Task: Integrate security scanning and best practices into the deployment pipeline.

     Details:
     
     Trivy Vulnerability Scanning: Integrate Trivy into the CI/CD pipeline. The pipeline will be configured to scan the Docker image for known vulnerabilities after it's built but before it's pushed to the            production registry. High-severity findings can be configured to fail the build.
     
     OWASP Best Practices:
     
     Conduct a security review of the application code against the OWASP Top 10 vulnerabilities.
     
     Implement Kubernetes Network Policies to restrict pod-to-pod communication, ensuring a least-privilege network model.
     
     Define Pod Security Standards (or use a policy engine like OPA/Gatekeeper) to prevent containers from running with excessive privileges.

- Outcome: A hardened deployment process that minimizes security vulnerabilities and enforces security best practices within the cluster.
 






