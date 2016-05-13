namespace :tags do
  desc "Load all tags into DB"
  task load_all: :environment do
    api = StackShareAPI.new(ENV['STACKSHARE_ACCESS_TOKEN'])
    page = 0
    while new_tags = api.tags(page)
      new_tags.each do |tag|
        Tag.where(id: tag['id']).first_or_create(name: tag['name'])
      end
      page += 1
    end
  end

end
