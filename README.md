# Documentation: CI/CD Pipeline for Simple Web Application Deployment

## Overview

This document details the Continuous Integration and Continuous Deployment (CI/CD) setup designed for a simple web application hosted on an AWS EC2 instance. The pipeline automates the build, test, package, and deployment processes upon code changes in the Git repository.

## Repository Setup

- **Repository**: A Git repository is set up with all necessary files including the web application, build scripts, and CI/CD configuration.
- **Branches**: Main development happens in the `main` branch, which is monitored for changes to trigger the pipeline.

## Web Application

### Description

The web application consists of a basic "Hello, World!" page.

### File: `index.html`

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hello, World! I am Anastasiia Lozovan</title>
</head>
<body>
    <h1>Hello, World! I am Anastasiia Lozovan</h1>
</body>
</html>
```
## CI/CD Pipeline

### GitHub Actions Workflows

#### Deploy and Restart Nginx
- **Trigger**
  - **Event**: Push
  - **Branches**: `main`
- **Jobs**
  - **Deploy**
    - **Environment**: Ubuntu Latest
    - **Steps**:
      - **Checkout Repository**: Syncs the code from the main branch.
      - **Install SSH and Dependencies**: Ensures all necessary software for deployment is installed.
      - **Deploy via SSH**: Securely copies files to the EC2 server and handles environment-specific configurations.
      - **Restart Nginx**: Restarts the Nginx service to apply new changes.

#### Build and Test
- **Trigger**
  - **Event**: Push
  - **Branches**: `main`
- **Jobs**
  - **Build and Test**
    - **Environment**: Ubuntu Latest
    - **Steps**:
      - **Checkout Code**: Gets the latest code from the repository.
      - **Run Build Script**: Executes the build script which includes linting and unit tests.
      - **Archive Artifacts**: If applicable, packages the application for deployment.

### Deployment Setup
- **Cloud Environment**: AWS EC2
  - Configuration steps for setting up an EC2 instance should be documented, including security groups, key pairs, and IAM roles necessary for deployment.

### Continuous Deployment
- **Deployment to Cloud**: Detailed steps on how the CI/CD pipeline automatically deploys the application to AWS EC2 after successful tests.

## Testing the CI Pipeline
- **Procedure**: Make changes to the `index.html` file and push to the `main` branch. Observe if the CI pipeline triggers correctly and deploys the updated application to the staging environment.
- **Verification**: Access the application through the public DNS/IP of the EC2 instance to verify the deployment.

## Security and Credentials
- **SSH Keys and Secrets**: Managed through GitHub Secrets to ensure secure connections and handling of sensitive data.

## Maintenance and Monitoring
- **Updates and Changes**: Regularly update the documentation when changes to the pipeline or application are made.
- **Monitoring**: Use GitHub Actions logs and cloud monitoring tools to track the health and performance of the application.

## FAQs
- **Q: How to roll back a deployment?**
  - **A**: Revert the commit in the `main` branch and the CI/CD pipeline will redeploy the previous state of the application.
