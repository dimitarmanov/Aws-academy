import boto3


def terminate_instances(instance_ids):
    ec2 = boto3.client('ec2', region_name='eu-west-1')
    response = ec2.terminate_instances(InstanceIds=instance_ids)
    print(f"Terminating instances: {instance_ids}")
    print(response)


def lambda_handler(event, context):
    ec2 = boto3.client('ec2', region_name='eu-west-1')

    response = ec2.describe_instances()

    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            instance_id = instance['InstanceId']
            instance_state = instance['State']['Name']
            instance_type = instance['InstanceType']
            print(f"Instance ID: {instance_id}")
            print(f"Instance State: {instance_state}")
            print(f"Instance Type: {instance_type}")
            print("-----------------------------------")
            if instance_state == 'running':
                terminate_instances([instance_id])