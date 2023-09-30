# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:

This project is going to use semantic versioning for tagging.
[semver.org] (https://semver.org/)

The general format:

**MAJOR.MINOR.PATCH**, eg. `1.0.1`
 
- **MAJOR** version when you make incompatible API changes 
- **MINOR** version when you add functionality in a backward compatible manner 
- **PATCH** version when you make backward compatible bug fixes

## Install the Terraform CLI

### Considerations with the Terraform CLI changes

The Terraform CLI installation instructions have changed due to gpg keyring changes. So we needed to refer to the latest CLI install instructions via Terraform Documentation and change the scripting for the install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distributions

This project is built against Ubunutu.
Please consider checking your Linux Distribution and change accordingly to distribution needs.

[How to check os version in Linux](https://opensource.com/article/18/6/linux-version)

Example of checking os version

```
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Refactoring into Bash scripts

While fixing the Terraform CLI gpg depreciation issues we noticed that the bash script steps were considerable more code. We decided to create a bash script to install the Terraform CLI.

This bash script is located here: [./bin/install_terraform_cli](./bin/install_terraform_cli)

- This will keep the Gitpod Task File ([.gitpod.yml](.gitpod.yml)) tidy.
- This will allow us an easier time to debug and execute manually Terraform CLI.
- This will allow better portabilty for other projects that need to install the Terraform CLI

#### Shebang Considerations

A shebang (pronounced sha-bang) tells the bash script what program will interpret the bash script. eg. `#!/bin/bash`

ChatGPT recommended  this format for bash: `#!/usr/bin/env bash`

- for portability for different os ditributions
- will search the user's PATH for the bash executable 

https://en.wikipedia.org/wiki/Shebang_(Unix)

### Execution Considerations
When executing the bash script we can use the `./` shorthand notation to execute the bash script.

eg. `./bin/install_terraform_cli`

If we are using a script in .gitpod.yml we need to point the script to a program to interpret it.

eg. `source ./bin/install_terraform_cli`

#### Linux Permissions Considerations

In order to make our bash script executable we need to change linux permissions for the file to be executable at the user mode.

```sh
chmod u+x ./bin/install_terraform_cli
```
alternatively:

```sh
chmod 744 ./bin/install_terraform_cli
```

https://en.wikipedia.org/wiki/Chmod


### Github Lifecycle (Before, Init, Command)

We need to be careful when using the Init because it will not rerun if we restart an existing workspace.

https://www.gitpod.io/docs/configure/workspaces/tasks

### Working Env Vars

#### Env command

We can list out all environment variables (Env Vars) using the `env` command

We can filter specific env vars using grep eg. `env | grep AWS_`

#### Setting and Unsetting Env Vars

In the terminal we can set using `export HELLO='world`

In the terminal we can unset using `unset HELLO

We can set an env var temporarily when just running a command 
```sh
HELLO='world' ./bin/print_message
```
Within a bash script wse can set an env without writing export eg.
```sh
#!/usr/bin/env bash

HELLO='world'

echo $HELLO
```

#### Printing Vars

We can print an env var using echo eg. `echo $HELLO`

#### Scoping of Env Vars

When you open up new bash terminals in VSCode it will not be aware of env vars you have set in another window.

If you want Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile`

#### Persisting Env Vars in Gitpod

We can persist env vars in gitpod by storing them iin Gitpod Secret Storage

```
gp env HELLO='world'
```

All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.

You can also set env vars in the `.gitpod.yml` but this can only contain non-sensitive env vars.

### AWS CLI Installation

AWS CLI is installed for this project via the bash script [`./bin/install_aws_cli`](./bin/install_aws_cli)

[Getting started (AWS CLI)](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
[AWS CLI Env Vars](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html)

We can check if our AWS credentials are configured correctly by running the following AWS CLI command:
```sh
aws sts get-caller-identity
```
if it is sucessfull you should see a json payload that looks like this:

```json
"UserId": "AIDAHFO5IKNCPSN73LNOC",
    "Account": "123456789012",
    "Arn": "arn:aws:iam::123456789012:user/terraform-beginner-bootcamp"

```
