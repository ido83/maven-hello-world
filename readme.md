# Build and Publish Java Application Pipeline with GitHub Actions and DockerHub




# Descreption 
    This repository contains the source code of simple Java application,along with a GitHub Actions workflow that automates the process of building, testing, packaging, and Publish  this application image.
    This is an overview of this CI/CD pipeline, including the technologies used, GitHub secrets configuration , and a breakdown of each step in the pipeline.


# Quick Start
    1. **Clone the repository**: `git clone https://github.com/<username>/<repository>.git`
    2. **Set up GitHub Secrets**: Navigate to your repository settings in GitHub, find the "Secrets" section, and add the necessary secrets mentioned (need to Match the actual names) in the "Secrets      Configuration" section.
    3. **Trigger the workflow**: Push a change to the `master` branch or manually trigger the workflow through GitHub's UI under the "Actions" tab.


# Prerequisites
    - Docker installed on your local machine.
    - A Docker Hub account + Generete Accesss tokens anad add them.
    - Git installed on your local machine.


# Technologies Used 
     Java: We use Java 1.8 for compling the application.
     Maven: For build and dependency management tool for this Project and Maven Plugins.
     Docker: For containerizing the application, ensuring consistent environments across the runners and for images creations .
     GitHub Actions: Automates CI/CD pipeline, from code push to Publish the final image Version.
     Bash: For automated process like versioning and other configuration



# Secrets Configuration
    Set your own GitHub secrets to securely handle sensitive data with GitHub Actions workflow:
    DOCKERHUB_USERNAME: Enter Your Docker Hub username, used for pushing images.
    DOCKERHUB_PASSWORD: Enter Docker Hub password, used for Docker login.
    OR
    DOCKERHUB_TOKEN: Enter Docker Hub Token for more secure connections.
    GIT_USER: Your git username for committing version bumps.
    EMAIL: Your email associated with the git user for commit operations.

# Workflow Overview

    Workflow File Location: .github/workflows/build_and_deploy.yml
    Trigger: The pipeline is triggered on every push to the master branch , you can change your trigger if needed.

# Workflow Pipline Steps Explained 
Jobs
Build and Deploy

    Environment: The job runs on the latest Ubuntu runner (ubuntu-latest) provided by GitHub Actions. This ensures that we got a consistent and up-to-date environment for this pipeline execution.

    Steps:
        Checkout: Clones the repository code onto the runner.
        Set Up JDK 1.8: Prepares the Java development environment.
        Compile Java Source Code: Compiles the application source code.
        Run Tests: Executes unit tests to ensure code reliability.
        Package Artifact: Packages compiled code into a JAR file.
        Increment Patch Version: Automatically increments the application's patch version by using bash script.
        Commit and Push Version : Commits the version increment back to the repository to make sure the remote repo is aligned with the latest pom version.
        Build Docker Image: Builds a Docker image of the application with 2 tags , latest and the version we working on.
        Login to Docker Hub: Authenticates with Docker Hub to enable image pushing.
        Push Docker Image: Pushes the built image to Docker Hub twice latest + version number.
        Pull Docker Image: Pulls the image for testing.
        Run Docker Container for Testing: Tests the running container to ensure the app is running on the continer.
## Troubleshooting/Common Issues

- **Issue**: Docker login fails with "unauthorized" error.
  - **Solution**: Ensure your `DOCKERHUB_USERNAME` and `DOCKERHUB_PASSWORD` or `DOCKERHUB_TOKEN` secrets are correctly set in the GitHub repository settings.

## Feedback

Your feedback is crucial for making this project better! There are several ways you can provide feedback or get help:

### Reporting Issues or Suggestions

If you encounter any bugs or have suggestions for improvements, please report them by opening an issue in the GitHub repository. Here's how:

1. Navigate to the **Issues** tab of the GitHub repository.
2. Click on **New Issue**.
3. Choose an appropriate template if available, or start with a blank issue.
4. Provide a descriptive title and detailed information about the issue or suggestion. Screenshots and code snippets can be very helpful.
5. Submit the issue.

# So have FUN and Pipline as much as you can =)

```
