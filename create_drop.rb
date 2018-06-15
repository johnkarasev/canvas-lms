require 'droplet_kit'
token = '7ade0d11512ba3472cee32a0cd8954644e6a545834df95256c411eb8f0888d30'
client = DropletKit::Client.new(access_token: token)

=begin
regions = client.regions.all
puts regions
droplet = DropletKit::Droplet.new(
    name: 'canvas_app',
    region: 'nyc3',
    size: 's-1vcpu-1gb',
    image: 'ubuntu-16-04-x64',
    ipv6: true,
    tags: ["api-test"]
)
client.droplets.create(droplet)
=end

def delete_droplet(id, client)
  client.droplets.delete(id: id)
end

droplets = client.droplets.all

droplets.each do |id|
  delete_droplet(id[:id], client)
end