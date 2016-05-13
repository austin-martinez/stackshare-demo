class Recommendation
  def initialize(tag_id)
    @tag_id = tag_id
  end

  def top_tools(count = 5)
    sorted_tools.take(count).map { |tool| tool[1] }
  end

  private

  def stacks
    api.stacks(@tag_id)
  end

  def sorted_tools
    @sorted_tools ||= tools.sort do |a,b|
      b[1]['companies'].length <=> a[1]['companies'].length
    end
  end

  def tools
    tools = {}
    stacks.each do |stack|
      stack['tools'].each do |tool|
        id = tool['id']
        if tools[id]
          tools[id]['companies'] << stack
        else
          tools[id] = tool.merge('companies' => [stack])
        end
      end
    end
    tools
  end

  def api
    @api ||= StackShareAPI.new(ENV['STACKSHARE_ACCESS_TOKEN'])
  end

end
