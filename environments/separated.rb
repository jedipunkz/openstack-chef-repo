name "separated"
description "separated nodes environment"

override_attributes(
    "release" => "icehouse",
    "osops_networks" => {
      "management" => "10.200.10.0/24",
      "public" => "10.200.10.0/24",
      "nova" => "10.200.10.0/24"
    },
    "mysql" => {
      "bind_address" => "0.0.0.0",
      "root_network_acl" => "%",
      "allow_remote_root" => true,
      "server_root_password" => "secrete",
      "server_repl_password" => "secrete",
      "server_debian_password" => "secrete"
    },
    "nova" => {
      "network" => {
        "fixed_range" => "172.18.0.0/24",
        "public_interface" => "eth0"
      }
    },
    "rabbitmq" => {
      "address" => "10.200.10.46",
      "port" => "5672"
    },
    "openstack" => {
      "developer_mode" => true,
      "compute" => {
        "rabbit" => {
          "host" => "10.200.10.46"
        },
        "novnc_proxy" => {
          "bind_interface" => "eth2"
        },
        "libvirt" => {
          "bind_interface" => "eth2"
        },
        "network" => {
          "fixed_range" => "10.200.9.0/24"
        },
        "rabbit_server_chef_role" => "os-ops-messaging",
        "networks" => [
        {
          "label" => "private",
          "ipv4_cidr" => "10.200.9.0/24",
          "num_networks" => "1",
          "network_size" => "255",
          "bridge" => "br200",
          "bridge_dev" => "eth0",
          "dns1" => "8.8.8.8",
          "dns2" => "8.8.4.4",
          "multi_host" => "T"
        }
        ]
      },
      "identity" => {
        "bind_interface" => "eth2",
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
      "image" => {
        "api" => {
          "bind_interface" => "eth2"
        },
        "debug" => true,
        "identity_service_chef_role" => "os-identity",
        "rabbit_server_chef_role" => "os-ops-messaging",
        "registry" => {
          "bind_interface" => "eth2"
        },
        "syslog" => {
          "use" => false
        },
        "upload_image" => {
          "cirros" => "http://hypnotoad/cirros-0.3.0-x86_64-disk.img",
        },
        "upload_images" => [
          "cirros"
        ]
      },
      "network" => {
        "api" => {
          "bind_interface" => "eth2",
        }
      },
      "db" => {
        "bind_interface" => "eth2",
        "compute" => {
          "host" => "10.200.10.46"
        },
        "identity" => {
          "host" => "10.200.10.46"
        },
        "image" => {
          "host" => "10.200.10.46"
        },
        "network" => {
          "host" => "10.200.10.46"
        },
        "volume" => {
          "host" => "10.200.10.46"
        },
        "dashboard" => {
          "host" => "10.200.10.46"
        }
      },
      "mq" => {
        "bind_interface" => "eth2",
        "host" => "10.200.10.46",
        "user" => "guest",
        "vhost" => "/nova",
        "servers" => "10.200.10.46",
        "compute" => {
          "service_type" => "rabbitmq",
          "rabbit" => {
            "host" => "10.200.10.46",
            "port" => "5672"
          }
        },
        "block-storage" => {
          "service_type" => "rabbitmq",
          "rabbit" => {
            "host" => "10.200.10.46",
            "port" => "5672"
          }
        }
      },
      "endpoints" => {
        "compute-api-bind" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8774",
          "path" => "/v2/%(tenant_id)s"
        },
        "compute-api" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8774",
          "path" => "/v2/%(tenant_id)s"
        },
        "compute-ec2-admin-bind" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8773",
          "path" => "/services/Admin"
        },
        "compute-ec2-admin" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8773",
          "path" => "/services/Admin"
        },
        "compute-ec2-api-bind" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8773",
          "path" => "/services/Cloud"
        },
        "compute-ec2-api" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8773",
          "path" => "/services/Cloud"
        },
        "compute-xvpvnc-bind" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "6081",
          "path" => "/console"
        },
        "compute-xvpvnc" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "6081",
          "path" => "/console"
        },
        "compute-novnc-bind" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "6080",
          "path" => "/vnc_auto.html"
        },
        "compute-novnc" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "6080",
          "path" => "/vnc_auto.html"
        },
        "compute-vnc" => {
          "host" => "0.0.0.0",
          "scheme" => "http",
          "port" => "6080",
          "path" => "/vnc_auto.html"
        },
        "image-api-bind" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "9292",
          "path" => "/v2"
        },
        "image-api" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "9292",
          "path" => "/v2"
        },
        "image-registry-bind" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "9191",
          "path" => "/v2"
        },
        "image-registry" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "9191",
          "path" => "/v2"
        },
        "identity-bind" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "5000",
          "path" => "/v2.0"
        },
        "identity-api" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "5000",
          "path" => "/v2.0"
        },
        "identity-admin" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "35357",
          "path" => "/v2.0"
        },
        "volume-api-bind" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8776",
          "path" => "/v1/%(tenant_id)s"
        },
        "block-storage-api" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8776",
          "path" => "/v1/%(tenant_id)s"
        },
        "telemetry-api-bind" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8777",
          "path" => "/v1"
        },
        "telemetry-api" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8777",
          "path" => "/v1"
        },
        "network-api-bind" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "9696",
          "path" => "/v2"
        },
        "network-api" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "9696",
          "path" => "/v2"
        },
        "orchestration-api-bind" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8004",
          "path" => "/v1/%(tenant_id)s"
        },
        "orchestration-api" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8004",
          "path" => "/v1/%(tenant_id)s"
        },
        "orchestration-api-cfn-bind" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8000",
          "path" => "/v1"
        },
        "orchestration-api-cfn" => {
          "host" => "10.200.10.46",
          "scheme" => "http",
          "port" => "8000",
          "path" => "/v1"
        },
        "mq" => {
          "port" => "5672"
        }
      }
    }
)
