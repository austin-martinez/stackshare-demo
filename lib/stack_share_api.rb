class StackShareAPI
  include HTTParty
  base_uri 'api.stackshare.io/v1'

  def initialize(access_token)
    @access_token = access_token
  end

  def tags(page = 0)
    get('/stacks/tags', { page: page })
  end

  def layers
    get('/tools/layers')
  end

  def tools(layer_id)
    get('/tools/lookup', { layer_id: layer_id })
  end

  def stacks(tag_id)
    get('/stacks/lookup', { tag_id: tag_id })
  end

  private

  def get(path, options = {})
    options = options.merge(access_token: @access_token)
    response = self.class.get(path, query: options)
    response.success? ? response.parsed_response : nil
  end

end
