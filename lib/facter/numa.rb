Facter.add('numa') do
  numactl_hw = `/usr/bin/numactl --hardware`

  count = numactl_hw.match(/available: (\d+) nodes /).captures[0]
  nodes_raw = numactl_hw.scan(/node (\d+) cpus: (.*)\nnode \d+ size: (\d+) MB/)

  nodes = {}
  nodes_raw.each do |node_raw|
    nodes[node_raw[0]] = {}
    nodes[node_raw[0]]['cpus'] = node_raw[1].split(' ')
    nodes[node_raw[0]]['memory'] = node_raw[2]
  end

  numa = {}
  numa['count'] = count
  numa['nodes'] = nodes

  setcode do
    numa
  end
end
