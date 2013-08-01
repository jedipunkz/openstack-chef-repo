name "opstenv01"
description "Example environment defineing the network and database settings you're going to use with OpenStack. The networks will be used in the libraries provided by the osops-utils cookbook. This example is for FlatDHCP with 2 physical networks."

override_attributes(
    "package_component" => "grizzly",
    "osops_networks" => {
      "management" => "10.200.9.0/24",
      "public" => "10.200.9.0/24",
      "nova" => "10.200.9.0/24",
      "swift" => "10.200.9.0/24"
    },
    "mysql" => {
      "root_network_acl" => "%",
      "allow_remote_root" => true,
      "server_root_password" => "secrete",
      "server_repl_password" => "secrete",
      "server_debian_password" => "secrete"
    },
    "openstack" => {
      "developer_mode" => true,
      "compute" => {
        "novnc_proxy" => {
          "bind_interface" => "eth2"
        },
        "libvirt" => {
          "bind_interface" => "eth2"
        },
        "network" => {
          "fixed_range" => "172.18.0.0/24"
        },
        "networks" => [
        {
          "label" => "private",
          "ipv4_cidr" => "172.18.0.0/24",
          "num_networks" => "1",
          "network_size" => "255",
          "bridge" => "br200",
          "bridge_dev" => "eth1",
          "dns1" => "8.8.8.8",
          "dns2" => "8.8.4.4",
          "multi_host" => "T"
        }
        ]
      },
      "identity" => {
        "admin_tenant_name" => "admin",
        "users" => {
          "demo" => {
            "password" => "demo",
            "default_tenant" => "service",
            "roles" => {
              "Member" => [ "Member" ]
            }
          }
        }
      },
      "endpoints" => {
        "compute-novnc" => {
          "host" => "10.200.10.82",
          "scheme" => "http",
          "port" => "6080",
          "path" => "/vnc_auto.html"
        }
      }
    }
)
