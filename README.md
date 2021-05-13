# Keet Terraform Demo

This is a Terraform demo for Keet Health.

## Installation

Clone this repository to your local machine:

```bash
git clone git@github.com:strabitz/keet-terraform-demo.git
```

Then install Terraform onto your machine if you haven't already using the
[Terraform documentation](https://learn.hashicorp.com/tutorials/terraform/install-cli).

Last, make sure you have AWS credentials configured locally.

## Usage

From the top level of the repository, run the following:
```bash
terraform apply
```

After this command completes, you will need to wait for the user-data
provisioning script to finish executing on the instance. You can view the
progress of this script by right clicking on the instance in the AWS
management console, clicking on "Monitor and troubleshoot", then clicking on
"Get system log".

Once the script finishes, get the public IP from the EC2 instance in the
management console, then go to `http://[public-ip]:8080` to connect to the
webserver.

## Next steps

Now, here is a list of things I would do next, as per the instructions.

* I would install the AWS SSM agent and Docker onto the EC2 instance then make
an AMI, so that we can skip the steps of having to download Docker during the
provisioning stage.
* I would create an IAM role and an IAM role profile to attach to the EC2
instance. On this IAM role I would attach a policy to enable SSM on the EC2
instance.
* I would convert the steps required to run the nginx Docker container into an
SSM document, which I would provision in the Terraform to run on the EC2
instance. This allows for us to do away with the user-data script, which is
really annoying to debug and not very transparent.
* I would add a VPC, subnet, internet gateway, route table, and route table
association in order to have some more control over the default AWS resources
that are created for you.
* I would add the public IP as an output as well, so the user running the
Terraform can access the webserver without having to track down the public IP
in the console.

These next improvements would depend on the requirements, but are probably
good things to do:

* I would create a certificate using ACM so that we could enable HTTPS on the
webserver.
* Assuming that this is important infrastructure, I would bring up the
instance using an autoscaling group, so that if for any reason the webserver
instances fail, we can automatically bring up new ones.
* Since we'll have multiple webservers, we'll want to associate a load
balancer with the autoscaling group, so that requests are distributed evenly
across our servers.
* Assuming we want to have a website name, we'll need to set up a Route53
record.
