# 📝 Flask Task Manager

A simple, containerized task manager application built with **Flask**, **SQLAlchemy**, and **PostgreSQL**, supporting schema migrations with **Flask-Migrate**. Easily run, build, and manage the app using **Docker Compose** and a developer-friendly **Makefile**.

## Features

- 📋 Create, complete, and delete tasks in a simple web UI
- 🐘 PostgreSQL database with persistent volume storage
- 🐳 Docker + Docker Compose support
- ⚙️ Environment configuration via `.env` and optional `.env-local`
- 🧩 Schema migrations using Flask-Migrate
- 📦 Makefile for easy CLI automation

## Pre-requisites

Before running the application, ensure you have the following installed on your system:

- **Docker**: To containerize and run the application.
- **Make**: To use the provided Makefile for automation.


## Getting Started

Follow these steps to set up and run the Flask Task Manager application locally:

1. clone the repo `git clone https://github.com/earthastronaut/task-manager.git`
2. (optional) overwrite env `cp .env .env-local`
3. Start `make up`
4. Access at [http://localhost:5000](http://localhost:5000)


Run tests `make test`


## Deployment on Render

To deploy the Flask Task Manager application on [Render](https://render.com), follow these steps:

1. **Create a Render Account**  
   Sign up for a free account on [Render](https://render.com) if you don’t already have one.

2. **Create a New Web Service**  
   - Navigate to the Render dashboard and click **New > Web Service**.
   - Connect your GitHub repository containing the Task Manager project.

3. **Configure the Service**  
   - Set the **Build Command** to:
     ```bash
     make build
     ```
   - Set the **Start Command** to:
     ```bash
     make run
     ```
   - Choose a runtime environment that supports Docker.

4. **Add Environment Variables**  
   - Add the required environment variables from your [.env](http://_vscodecontentref_/0) file in the **Environment** section of the Render dashboard.
   - Ensure sensitive information like database credentials is securely added.

5. **Set Up a PostgreSQL Database**  
   - In the Render dashboard, create a new **PostgreSQL Database**.
   - Update the `POSTGRES_*` environment variables (see .env) in your Render service to point to the Render database.

6. **Deploy the Application**  
   - Save the configuration and deploy the service.
   - Render will automatically build and start your application.

7. **Verify Deployment**  
   - Once the deployment is complete, visit the provided Render URL to access your Flask Task Manager application.

For more details, refer to the [Render Documentation](https://render.com/docs).

## How to Contribute

Contributions are welcome! If you'd like to contribute to the Flask Task Manager project, follow these steps:

1. **Fork the Repository**  
   - Click the **Fork** button on the top-right corner of the repository page to create your own copy.

2. **Clone the Repository**  
   - Clone your forked repository to your local machine:
     ```bash
     git clone https://github.com/your-username/task-manager.git
     ```
   - Replace `your-username` with your GitHub username.

3. **Create a New Branch**  
   - Create a new branch for your feature or bug fix:
     ```bash
     git checkout -b feature-or-bugfix-name
     ```

4. **Make Changes**  
   - Implement your changes or fixes in the codebase.
   - Ensure your code follows the project's coding standards and is well-documented.

5. **Test Your Changes**  
   - Run the application and ensure your changes work as expected.
   - Add or update tests if necessary:
     ```bash
     make test
     ```

6. **Commit Your Changes**  
   - Commit your changes with a descriptive commit message:
     ```bash
     git commit -m "Add feature or fix description"
     ```

7. **Push Your Changes**  
   - Push your branch to your forked repository:
     ```bash
     git push origin feature-or-bugfix-name
     ```

8. **Open a Pull Request**  
   - Go to the original repository and click **New Pull Request**.
   - Select your branch and provide a clear description of your changes.

9. **Collaborate**  
   - Work with the maintainers to review and refine your contribution.

Thank you for helping improve the Flask Task Manager project!

## License

This project is licensed under the **MIT License**. You are free to use, modify, and distribute this software in accordance with the terms of the license.

For more details, see the [LICENSE](./LICENSE) file.