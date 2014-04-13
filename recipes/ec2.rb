require 'chef_metal_fog'

ec2testdir = "#{ENV['HOME']}/ec2creds"

directory ec2testdir

with_fog_ec2_provisioner :ssh_username => 'ec2-user'

with_provisioner_options 'bootstrap_options' => {
    'image_id' => 'ami-2f726546',
    'flavor_id' => 'm3.large',
    'block_device_mapping' => [{'DeviceName' => '/dev/sda1', 'Ebs.VolumeSize' => 30}]
  }

fog_key_pair "dockerdemo_ssh_key_tom" do
  private_key_path "#{ec2testdir}/dockerdemo_ssh_key_tom"
  public_key_path "#{ec2testdir}/dockerdemo_ssh_key_tom.pub"
end
