namespace :layers do
  desc "Load all layers"
  task load_all: :environment do
    api = StackShareAPI.new(ENV['STACKSHARE_ACCESS_TOKEN'])
    api.layers.each do |layer|
      Layer.first_or_create(id: layer['id'], name: layer['name'], slug: layer['slug'])
    end
  end

end
