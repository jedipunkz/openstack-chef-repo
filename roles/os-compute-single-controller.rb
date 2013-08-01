name "os-compute-single-controller"
description "Roll-up role for all of the OpenStack Compute services on a single, non-HA controller."
run_list(
  "role[os-base]",
  "role[os-ops-database]",
  "role[os-ops-messaging]",
  "role[os-identity]",
  "role[os-image]",
  "role[os-compute-scheduler]",
  "role[os-compute-api]",
  "role[os-block-storage]",
  "role[os-compute-cert]",
  "role[os-compute-vncproxy]",
  "role[os-dashboard]",
  "recipe[openstack-compute::conductor]",
  "recipe[openstack-block-storage::volume]",
  "recipe[openstack-block-storage::scheduler]",
  "recipe[openstack-block-storage::identity_registration]",
  "recipe[openstack-compute::identity_registration]",
  "recipe[openstack-image::identity_registration]",
  "recipe[openstack-network::identity_registration]",
  "recipe[openstack-compute::nova-setup]",
  "role[os-block-storage-api]",
  "role[os-image-registry]"
  )
  # "role[os-network]",
