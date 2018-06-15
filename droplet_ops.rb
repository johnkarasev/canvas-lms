require 'droplet_kit'

class DropletOps
  def initiliaze(token)
    @client = DropletKit::Client.new(access_token: token)
  end
  def delete(id)
    @client.droplets.delete(id: id)
  end
  def delete_all()
    @client.regions.all.each do |drop|
      client.droplets.delete(drop: drop[:id])
    end
  end
end