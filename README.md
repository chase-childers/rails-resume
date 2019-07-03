# Rails Resume

This is the rails variation of my personal portfolio site built with [Ruby on Rails](https://rubyonrails.org/) and deployed via Docker Containers.

This [site](chasechilders.com) is run utilizing multiple AWS components and tools:
  * [AWS CLI](https://aws.amazon.com/cli/)
  * [S3](https://aws.amazon.com/s3/) - Simple Storage Service
    * Store and Read  `resume` [data schema](https://github.com/chase-childers/resume) and other image assets
  * [IAM](https://aws.amazon.com/iam/) - Identity and Access Management
    * Securing a this service and other services communicate with eachccess to other AWS components
  * [ECR](https://aws.amazon.com/ecr/) - Elastic Container Registry
    * Docker repository for storing and distributing images
  * [ECS](https://aws.amazon.com/ecs/) - Elastic Container Service
    * Service for hosting, running, and scaling containers
  * [ELB](https://aws.amazon.com/elasticloadbalancing/) - Elastic Load Balancing
    * How traffic gets routed and balanced to muiltiple containers
  * [Route53](https://aws.amazon.com/route53/)
    * Driving people to the website via a Domain Name

## Developing

### Locally

1. **Environment Setup** - [Install Ruby, rbenv, and Rails](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm) 
> NOTE: This project uses `Ruby ~> 2.4` which needs to be installed at set by `rbenv`.  This project also does not use ActiveRecord or any Database components.
2. **Environment Setup** - Setup S3 Bucket and AWS Credentials for reading from S3
  * Install the [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
  * Create an S3 Bucket
  * Configure `app/helper/resume_helper.rb` with your bucket name and the key of your S3 file.
  * Generate an IAM AWS User with S3 Read Access to your S3 Bucket
  * Configure the IAM AWS Credentials in `credentials.yml.enc`
    * `EDITOR=vim rails credentials:edit`

3. Run the application locally
```sh
bin/rails server 
```

4. Access the local environmeent via `localhost:3000`

> Depending on the development changes you may not have to restart the rails server.

### Locally in Containers

> **NOTE: Follow the Environment Setup steps from the Previous Section**

1. **Environment Setup** - Install Docker ([Linux](https://runnable.com/docker/install-docker-on-linux)/[Windows](https://runnable.com/docker/install-docker-on-windows-10))
2. **Environment Setup** - Install [Make GNU](https://www.gnu.org/software/make/) 
3. Build the Development Docker Container
```sh
$ make build-dev
```
4. Run the Development Docker Container
```sh
$ make run-dev
```
> **NOTE: `make dev` will build and run the dev image in one command
5. Stop and Delete the Docker Container
```sh
$ make stop-dev
```
6. SSH Into the Development Docker Container that is running
```sh
$ make ssh-dev
```

## Production
 
1. Build the Production Image
```sh
$ make build-prod
```
2. Create and ECR Registry
3. [Upload Image](https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-push-ecr-image.html) to ECR Registry
3. [Deploy Docker Container](https://aws.amazon.com/getting-started/tutorials/deploy-docker-containers/) as a service