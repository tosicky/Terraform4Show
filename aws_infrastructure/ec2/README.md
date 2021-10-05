## EC2 Provisioning

In this project we create multiple ec2 instances using module and assign an ssh keypair to each.

To provision an ec2 instance with an ssh key-pair attached to it, you first need to generate your key-pair locally.

# Procedure:
1. Run `ssh-keygen -f <key_file_name>` within the root module of your terraform project
2. Make sure the `<key_file_name>` and `<key_file_name>.pub` files are in the root module of your terraform project

** DO NOT CHECK-IN/COMMIT YOUR KEYS TO ANY VERSION CONTROL SYSTEM **