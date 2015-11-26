# facter2-numa
NUMA CPU and Memory layout structured facts for facter 2.x.

To use structured facts in your Puppet manifests, you may need to set `stringify_facts = false` in the `[main]` section of your `puppet.conf`.

### Sample output
```
$ facter numa
{"count"=>"2", "nodes"=>{"0"=>{"cpus"=>["0", "1", "2", "3"], "memory"=>"8192"}, "1"=>{"cpus"=>["4", "5", "6", "7"], "memory"=>"8192"}}}

$ facter --yaml numa
---
numa:
  count: "2"
  nodes:
    "0":
      memory: "8192"
      cpus:
      - "0"
      - "1"
      - "2"
      - "3"
    "1":
      memory: "8192"
      cpus:
      - "4"
      - "5"
      - "6"
      - "7"

$ facter --json numa
{
  "numa": {
    "nodes": {
      "0": {
        "cpus": [
          "0",
          "1",
          "2",
          "3"
        ],
        "memory": "8192"
      },
      "1": {
        "cpus": [
          "4",
          "5",
          "6",
          "7"
        ],
        "memory": "8192"
      }
    },
    "count": "2"
  }
}
```
# Installation

### Requirements
`facter-2.x`

`numactl`

### Option A

Pick a package for your distribution from the releases tab. CentOS/Red Hat 6, 7; Ubuntu 14.04; Debian 8.

### Option B

Drop the file `numa.rb`

on CentOS 6 in `/usr/lib/ruby/site_ruby/1.8/facter`

on CentOS 7 in `/usr/share/ruby/vendor_ruby/facter`

on Ubuntu 14.04 in `/usr/lib/ruby/vendor_ruby/facter`

on Debian 8 in `/usr/lib/ruby/vendor_ruby/facter`

### Option C

Use the `new23d-facter2_numa` module from the Forge. It would only expose the structured `numa` fact for your manifests though.

